package com.battcn.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

import com.battcn.entity.UserEntity;

public class UserEntityUtil
{
	/**
	 * 用户信息key
	 */
	public static final String USER_SESSION_KEY = "USER_SESSION_KEY";

	/**
	 * 从session中获取当前登录的用户信息
	 * 
	 * @return[参数、异常说明] @return UserForm [返回类型说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static UserEntity getUserFromSession()
	{
		Session session = SecurityUtils.getSubject().getSession();
		return (UserEntity) session.getAttribute(UserEntityUtil.USER_SESSION_KEY);
	}

	/**
	 * <一句话功能简述> <功能详细描述> 从session存放登录信息
	 * 
	 * @param request
	 * @param loginInfo
	 *            [参数说明]
	 * 
	 * @return void [返回类型说明]
	 * @exception throws
	 *                [违例类型] [违例说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static void saveUserToSession(UserEntity userForm)
	{
		Session session = SecurityUtils.getSubject().getSession();
		session.setTimeout(1800000);
		session.setAttribute(USER_SESSION_KEY, userForm);
	}

	public static String convertDateToString(Date date, String format)
	{
		return new SimpleDateFormat(format).format(date);
	}

}
