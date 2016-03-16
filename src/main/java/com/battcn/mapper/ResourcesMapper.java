package com.battcn.mapper;

import java.util.List;
import java.util.Map;

import com.battcn.entity.GroupEntity;
import com.battcn.entity.ResourcesEntity;

import tk.mybatis.mapper.common.Mapper;

public interface ResourcesMapper extends Mapper<ResourcesEntity>
{
	
	public List<ResourcesEntity> findResourcessByRoleId(String roleId);
	public List<ResourcesEntity> findResourcessByMap(Map<String,String> queryMap);
	
	public List<ResourcesEntity> findRes(Map<String,String> queryMap);
	
	public void deleteByRoleId(String roleId);
	public void deleteByUserId(String userId);
	public void deleteRoleByUserId(String userId);
	
	
	
	public void batchAddRoleGroup(List<GroupEntity> list);
	public void batchAddUserGroup(List<GroupEntity> list);
	
	
	public void treeNodes();
	
	
}
