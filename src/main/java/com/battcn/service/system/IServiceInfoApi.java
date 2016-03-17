package com.battcn.service.system;

import com.battcn.entity.ServiceInfoEntity;
import com.battcn.service.BaseService;
import com.github.pagehelper.PageInfo;

public interface IServiceInfoApi extends BaseService<ServiceInfoEntity>
{
	public PageInfo<ServiceInfoEntity> queryMonitorForList();
	public String addServiceInfo(ServiceInfoEntity entity);
}
