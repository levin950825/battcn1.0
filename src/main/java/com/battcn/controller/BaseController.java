package com.battcn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.battcn.entity.ResourcesEntity;
import com.battcn.entity.UserEntity;
import com.battcn.service.system.ResourcesService;
import com.battcn.util.UserEntityUtil;

public class BaseController
{
	static final String SUCCESS = "success";
	static final String ERROR = "error";
	static final String EXCEPTION = "exception";
	
	Logger logger = Logger.getLogger(BaseController.class);
	
	@Autowired	
	public ResourcesService resourcesService;

	/**
	 * 获取返回某一页面的按扭组,
	 * 
	 * @throws Exception
	 */
	public List<ResourcesEntity> findResByUser()
	{
		try
		{
			UserEntity infoForm = UserEntityUtil.getUserFromSession();
			Map<String,String> queryMap = new HashMap<String,String>();
			queryMap.put("userId", String.valueOf(infoForm.getId()));
			queryMap.put("parentId", getParameter("id"));
			return resourcesService.findResourcessByMap(queryMap);
		} catch (Exception e)
		{
			logger.error("--basecontroller --error---",e);
		}
		return null;
	}

	/**
	 * 获取页面传递的某一个参数值,
	 */
	public String getParameter(String key)
	{
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		return request.getParameter(key);
	}

	/**
	 * 获取HttpServletRequest;
	 * 
	 * @return [参数说明]
	 * 
	 * @return HttpServletRequest [返回类型说明]
	 * @exception throws
	 *                [违例类型] [违例说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static HttpServletRequest getHttpRequest()
	{
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
}
