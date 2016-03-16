package com.battcn.service.system;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.ResourcesEntity;
import com.battcn.service.BaseService;

public interface ResourcesService extends BaseService<ResourcesEntity>
{
	public PageInfo<ResourcesEntity> queryResourcrsForList();

	public List<ResourcesEntity> queryResourcesForList();

	public List<ResourcesEntity> findRes(Map<String, String> queryMap);

	public List<ResourcesEntity> findResourcessByRoleId(String roleId);

	public List<ResourcesEntity> findResourcessByMap(Map<String, String> queryMap);

	public String saveOrUpdate(ResourcesEntity entity);

	public String updateGroupByRole(String userId, String roleId, Integer[] resId);
}
