package com.battcn.service.system;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.ButtomEntity;
import com.battcn.service.BaseService;

public interface ButtomService extends BaseService<ButtomEntity>
{
	public PageInfo<ButtomEntity> queryButtomForList();
}
