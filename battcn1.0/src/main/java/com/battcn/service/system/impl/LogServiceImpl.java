package com.battcn.service.system.impl;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.LogEntity;
import com.battcn.service.BaseServiceImpl;
import com.battcn.service.system.LogService;

@Service
public class LogServiceImpl extends BaseServiceImpl<LogEntity> implements LogService
{
	public PageInfo<LogEntity> queryLogForList()
	{
		return this.queryPageForList();
	}
	
	
	
}
