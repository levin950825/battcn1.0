package com.battcn.logAop;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.github.pagehelper.StringUtil;
import com.battcn.annotation.SystemLog;
import com.battcn.controller.BaseController;
import com.battcn.entity.LogEntity;
import com.battcn.service.system.LogService;
import com.battcn.util.CommonUtil;
import com.battcn.util.UserEntityUtil;

/**
 * 切点类
 * 
 * @author LJN
 * @since 2015-05-05 Pm 20:35
 * @version 1.0
 */
@Aspect
@Component
public class LogAopAction extends BaseController
{
	// 本地异常日志记录对象
	private static final Logger logger = LoggerFactory.getLogger(LogAopAction.class);
	@Autowired
	private LogService logService;

	// Controller层切点
	@Pointcut("@annotation(com.battcn.annotation.SystemLog)")
	public void controllerAspect()
	{
	}

	/**
	 * 操作异常记录
	 * 
	 * @descript
	 * @param point
	 * @param e
	 * @author LJN
	 * @date 2015年5月5日
	 * @version 1.0
	 */
	@AfterThrowing(pointcut = "controllerAspect()", throwing = "e")
	public void doAfterThrowing(JoinPoint point, Throwable e)
	{
		HttpServletRequest request = CommonUtil.getHttpRequest();
		LogEntity logForm = new LogEntity();
		Map<String, Object> map = null;
		String accountName = null;
		String ip = null;
		try
		{
			ip = CommonUtil.toIpAddr(request);
		} catch (Exception ee)
		{
			ip = "无法获取登录用户Ip";
		}
		try
		{
			map = getControllerMethodDescription(point);
			// 登录名
			accountName = UserEntityUtil.getUserFromSession().getUserName();
			if (StringUtil.isEmpty(accountName))
			{
				accountName = "无法获取登录用户信息！";
			}
		} catch (Exception ee)
		{
			accountName = "无法获取登录用户信息！";
		}
		logForm.setAccountName(accountName);
		logForm.setModule(String.valueOf(map.get("module")));
		logForm.setMethods("<font color=\"red\">执行方法异常:-->" + map.get("methods") + "</font>");
		logForm.setDescription("<font color=\"red\">执行方法异常:-->" + e + "</font>");
		logForm.setActionTime("0");
		logForm.setIp(ip);
		try
		{
			logService.save(logForm);
		} catch (Exception e1)
		{
			e1.printStackTrace();
		}
	}

	/**
	 * 前置通知 用于拦截Controller层记录用户的操作
	 *
	 * @param joinPoint
	 *            切点
	 */
	@Around("controllerAspect()")
	public Object doController(ProceedingJoinPoint point)
	{
		HttpServletRequest request = CommonUtil.getHttpRequest();
		Object result = null;
		// 执行方法名
		String methodName = point.getSignature().getName();
		String className = point.getTarget().getClass().getSimpleName();
		LogEntity logForm = new LogEntity();
		Map<String, Object> map = null;
		String accountName = null;
		Long start = 0L;
		Long end = 0L;
		Long time = 0L;
		String ip = null;
		try
		{
			ip = CommonUtil.toIpAddr(request);
		} catch (Exception e)
		{
			ip = "无法获取登录用户Ip";
		}
		try
		{
			// 登录名
			accountName = UserEntityUtil.getUserFromSession().getUserName();
			if (StringUtil.isEmpty(accountName))
			{
				accountName = "无法获取登录用户信息！";
			}
		} catch (Exception e)
		{
			accountName = "无法获取登录用户信息！";
		}
		// 当前用户
		try
		{
			map = getControllerMethodDescription(point);
			// 执行方法所消耗的时间
			start = System.currentTimeMillis();
			result = point.proceed();
			end = System.currentTimeMillis();
			time = end - start;
		} catch (Throwable e)
		{
			throw new RuntimeException(e);
		}
		try
		{
			logForm.setAccountName(accountName);
			logForm.setModule(String.valueOf(map.get("module")));
			logForm.setMethods(String.valueOf(map.get("methods")));
			logForm.setDescription(String.valueOf(map.get("description")));
			logForm.setActionTime(time.toString());
			logForm.setIp(ip);
			logService.save(logForm);
			// *========控制台输出=========*//
			System.out.println("=====通知开始=====");
			System.out.println("请求方法:" + className + "." + methodName + "()");
			System.out.println("方法描述:" + map);
			System.out.println("请求IP:" + ip);
			System.out.println("=====通知结束=====");
		} catch (Exception e)
		{
			// 记录本地异常日志
			logger.error("====通知异常====");
			logger.error("异常信息:{}", e.getMessage());
		}
		return result;
	}

	/**
	 * 获取注解中对方法的描述信息 用于Controller层注解
	 *
	 * @param joinPoint
	 *            切点
	 * @return 方法描述
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> getControllerMethodDescription(JoinPoint joinPoint) throws Exception
	{
		Map<String, Object> map = new HashMap<String, Object>();
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] arguments = joinPoint.getArgs();
		Class targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		for (Method method : methods)
		{
			if (method.getName().equals(methodName))
			{
				Class[] clazzs = method.getParameterTypes();
				if (clazzs.length == arguments.length)
				{
					map.put("module", method.getAnnotation(SystemLog.class).module());
					map.put("methods", method.getAnnotation(SystemLog.class).methods());
					String de = method.getAnnotation(SystemLog.class).description();
					if (StringUtil.isEmpty(de))
						de = "执行成功!";
					map.put("description", de);
					break;
				}
			}
		}
		return map;
	}
}
