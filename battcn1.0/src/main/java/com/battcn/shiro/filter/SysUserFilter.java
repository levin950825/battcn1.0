package com.battcn.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.factory.annotation.Autowired;

import com.battcn.service.system.UserService;

public class SysUserFilter extends PathMatchingFilter
{

	@Autowired
	private UserService userService;

	@Override
	protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception
	{
		String userName = (String) SecurityUtils.getSubject().getPrincipal();
		request.setAttribute("user", userService.findByLoginName(userName));
		return true;
	}
}