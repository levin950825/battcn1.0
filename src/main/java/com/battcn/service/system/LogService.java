package com.battcn.service.system;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.LogEntity;
import com.battcn.service.BaseService;

public interface LogService extends BaseService<LogEntity>
{
	public PageInfo<LogEntity> queryLogForList();

}
