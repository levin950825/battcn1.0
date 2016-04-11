package com.battcn.task;

import com.battcn.util.EhcacheUtils;
import com.battcn.util.PropertiesUtils;

public class CacheInit
{

	public void init()
	{
		System.out.println("初始化缓存");
		EhcacheUtils.initCacheManager();
		EhcacheUtils.initCache("cache");
		EhcacheUtils.put("cpu", PropertiesUtils.findPropertiesKey("cpu"));
		EhcacheUtils.put("jvm", PropertiesUtils.findPropertiesKey("jvm"));
		EhcacheUtils.put("ram", PropertiesUtils.findPropertiesKey("ram"));
		EhcacheUtils.put("toEmail", PropertiesUtils.findPropertiesKey("toEmail"));
	}
}
