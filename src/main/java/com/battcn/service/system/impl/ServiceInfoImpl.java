package com.battcn.service.system.impl;

import org.springframework.stereotype.Service;
import com.battcn.entity.ServiceInfoEntity;
import com.battcn.service.BaseServiceImpl;
import com.battcn.service.system.IServiceInfoApi;
import com.github.pagehelper.PageInfo;

@Service
public class ServiceInfoImpl extends BaseServiceImpl<ServiceInfoEntity> implements IServiceInfoApi
{

	@Override
	public PageInfo<ServiceInfoEntity> queryMonitorForList()
	{
		return this.queryPageForList();
	}

	@Override
	public String addServiceInfo(ServiceInfoEntity entity)
	{
		return this.save(entity);
	}

}
