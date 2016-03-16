package com.battcn.service.system;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.RoleEntity;
import com.battcn.service.BaseService;

public interface RoleService extends BaseService<RoleEntity>
{

	public PageInfo<RoleEntity> queryRoleForList();

	public String saveOrUpdate(RoleEntity roleEntity);

	public List<RoleEntity> findRoleByUser(String userId);

}
