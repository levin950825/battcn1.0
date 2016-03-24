package com.battcn.controller.system;

import java.io.InputStreamReader;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;

import com.battcn.annotation.SystemLog;
import com.battcn.constant.LoginConstant;
import com.battcn.entity.ResourcesEntity;
import com.battcn.entity.UserEntity;
import com.battcn.service.system.ResourcesService;
import com.battcn.service.system.RoleService;
import com.battcn.service.system.UserService;
import com.battcn.util.TreeUtil;
import com.battcn.util.UserEntityUtil;
import com.mysql.jdbc.Connection;

@Controller
public class LoginController {
	@Autowired
	ResourcesService resourcesService;
	@Autowired
	RoleService roleService;
	@Autowired
	UserService userService;

	@RequestMapping({ "login", "/" })
	public String login(HttpServletRequest request) 
	{
		if(request.getParameter("forceLogout") != null) 
		{  
		    request.setAttribute("LOGIN_ERROR_CODE", LoginConstant.LOGIN_ERROR_CODE_100004);
		    request.setAttribute("LOGIN_ERROR_MESSAGE", LoginConstant.LOGIN_ERROR_MESSAGE_FORCELOGOUT);
		}   
		return "login";
	}

	@RequestMapping("main")
	public String main() {
		return "main";
	}

	@RequestMapping("index")
	public String index(Model model) {
		UserEntity infoForm = UserEntityUtil.getUserFromSession();
		if (infoForm == null) {
			return "redirect:/";
		}
		String userId = String.valueOf(infoForm.getId());
		if (StringUtils.isNotBlank(userId)) {
			Map<String, String> queryMap = new HashMap<String, String>();
			queryMap.put("userId", userId);
			List<ResourcesEntity> resourceForms = resourcesService.findResourcessByMap(queryMap);
			List<ResourcesEntity> ns = TreeUtil.getChildResourceForms(resourceForms, 0);
			model.addAttribute("list", ns);
		}
		// 登陆的信息回传页面
		return "index";
	}

	@RequestMapping("check")
	@SystemLog(module = "用户管理", methods = "用户登陆")
	public String login(HttpServletRequest request, HttpServletResponse response, UserEntity user) {
		// 想要得到 SecurityUtils.getSubject() 的对象．．访问地址必须跟shiro的拦截地址内．不然后会报空指针
		Subject sub = SecurityUtils.getSubject();
		// 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
		// 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
		// 当以上认证成功后会向下执行,认证失败会抛出异常
		UsernamePasswordToken token = new UsernamePasswordToken(user.getAccountName(), user.getPassWord());
		try {
			sub.login(token);
		} catch (LockedAccountException lae) {
			token.clear();
			request.setAttribute("LOGIN_ERROR_CODE", LoginConstant.LOGIN_ERROR_CODE_100002);
			request.setAttribute("LOGIN_ERROR_MESSAGE", LoginConstant.LOGIN_ERROR_MESSAGE_SYSTEMERROR);
			return "login";
		} catch (ExcessiveAttemptsException e) {
			token.clear();
			request.setAttribute("LOGIN_ERROR_CODE", LoginConstant.LOGIN_ERROR_CODE_100003);
			request.setAttribute("LOGIN_ERROR_MESSAGE",
					"账号：" + user.getUserName() + LoginConstant.LOGIN_ERROR_MESSAGE_MAXERROR);
			return "login";
		} catch (AuthenticationException e) {
			token.clear();
			request.setAttribute("LOGIN_ERROR_CODE", LoginConstant.LOGIN_ERROR_CODE_100001);
			request.setAttribute("LOGIN_ERROR_MESSAGE", LoginConstant.LOGIN_ERROR_MESSAGE_USERERROR);
			return "login";
		}
		return "redirect:/index.shtml";
	}

	/**
	 * 登出系统
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param user
	 * @param result
	 * @return
	 */
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model) {
		if (SecurityUtils.getSubject().getSession() != null) {
			SecurityUtils.getSubject().logout();
		}
		return "redirect:/login.shtml";
	}

	@RequestMapping("install")
	public String install() throws Exception {
		try {
			Properties props = Resources.getResourceAsProperties("jdbc.properties");
			String url = props.getProperty("database.url");
			String driver = props.getProperty("database.driverClassName");
			String username = props.getProperty("database.username");
			String password = props.getProperty("database.password");
			Class.forName(driver).newInstance();
			Connection conn = (Connection) DriverManager.getConnection(url, username, password);
			ScriptRunner runner = new ScriptRunner(conn);
			runner.setErrorLogWriter(null);
			runner.setLogWriter(null);
			runner.runScript((new InputStreamReader(getClass().getResourceAsStream("/intall.sql"), "UTF-8")));
		} catch (Exception e) {
			e.printStackTrace();
			return "初始化失败！请联系管理员" + e;
		}
		return "install";
	}
}
