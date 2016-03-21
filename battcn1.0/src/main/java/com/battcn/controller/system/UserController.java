package com.battcn.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.battcn.annotation.SystemLog;
import com.battcn.controller.BaseController;
import com.battcn.entity.UserEntity;
import com.battcn.service.system.UserService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/user/")
public class UserController extends BaseController
{

	@Autowired
	public UserService userService;

	@RequestMapping("list")
	public String main(Model model)
	{
		model.addAttribute("res", findResByUser());
		return "/system/user/list";
	}

	@RequestMapping("editUI")
	public String addUI(Model model, Long id)
	{
		if (id != null)
		{
			model.addAttribute("user", userService.findByPrimaryKey(id));
		}
		return "/system/user/edit";
	}

	@RequestMapping("queryUserForList")
	@ResponseBody
	public PageInfo<UserEntity> queryUserForList()
	{
		return this.userService.queryUserForList();
	}

	@RequestMapping("saveForm")
	@ResponseBody
	@SystemLog(module = "用户管理", methods = "添加用户")
	public String saveUser(UserEntity form,Long txtGroupsSelect[])
	{
		return this.userService.saveOrUpdate(form,txtGroupsSelect);
	}

	@RequestMapping("batchDelete")
	@ResponseBody
	@SystemLog(module = "用户管理", methods = "批量删除用户")
	public String batchDelete(Long ids[])
	{
		return this.userService.batchDelete(ids);
	}

}
