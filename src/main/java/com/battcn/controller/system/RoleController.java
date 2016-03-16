package com.battcn.controller.system;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.battcn.annotation.SystemLog;
import com.battcn.controller.BaseController;
import com.battcn.entity.RoleEntity;
import com.battcn.service.system.RoleService;

import tk.mybatis.mapper.entity.Example;

@Controller
@RequestMapping("/role/")
public class RoleController extends BaseController
{
	@Autowired
	public RoleService roleService;

	@RequestMapping("list")
	public String main(Model model)
	{
		model.addAttribute("res", findResByUser());
		return "/system/role/list";
	}

	@RequestMapping("editUI")
	public String addUI(Model model, String id)
	{
		if (StringUtils.isNotEmpty(id))
			model.addAttribute("role", roleService.findByPrimaryKey(Long.valueOf(id)));
		return "/system/role/edit";
	}

	@RequestMapping("queryLogForList")
	@ResponseBody
	public PageInfo<RoleEntity> queryRoleForList()
	{
		return roleService.queryRoleForList();
	}

	@RequestMapping("saveForm")
	@ResponseBody
	@SystemLog(module = "角色管理", methods = "添加角色")
	public String saveUserInfo(RoleEntity infoForm)
	{
		return this.roleService.saveOrUpdate(infoForm);
	}

	@RequestMapping("batchDelete")
	@ResponseBody
	@SystemLog(module = "角色管理", methods = "批量删除角色")
	public String batchDelete(String ids[])
	{
		return this.roleService.batchDelete(ids);
	}
			
		
	@RequestMapping("selRole")
	public String seletRole(Model model, String userId) throws Exception
	{
		Example example = new Example(RoleEntity.class);
		if (null != userId)
		{
			List<RoleEntity> list = this.roleService.findRoleByUser(userId);
			List<Long> roleIds = new ArrayList<Long>();
			for (RoleEntity role : list)
			{
				roleIds.add(role.getId());
			}
			model.addAttribute("txtRoleSelect", roleIds);
			model.addAttribute("userRole", list);
			if (roleIds != null && roleIds.size() > 0)
			{
				example.createCriteria().andNotIn("id", roleIds);
			}
		}
		List<RoleEntity> roles = this.roleService.queryExampleForList(example);
		model.addAttribute("role", roles);
		return "/system/user/roleSelect";
	}
}
