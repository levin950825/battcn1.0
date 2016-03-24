package com.battcn.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.Session;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import com.battcn.util.UserEntityUtil;

/**
 * <p>
 * User: Zhang Kaitao
 * <p>
 * Date: 14-3-16
 * <p>
 * Version: 1.0
 */
public class ForceLogoutFilter extends AccessControlFilter
{

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception
	{
		Session session = getSubject(request, response).getSession(false);
		if (session == null)
		{
			return true;
		}
		return session.getAttribute(UserEntityUtil.USER_SESSION_LOGOUT_LOGOUT_KEY) == null;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception
	{
		try
		{
			getSubject(request, response).logout();// 强制退出
		} catch (Exception e)
		{
			
		}
		String loginUrl = getLoginUrl() + (getLoginUrl().contains("?") ? "&" : "?") + "forceLogout=1";  
		WebUtils.issueRedirect(request, response, loginUrl);
		return false;
	}
}