package com.battcn.service.system.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.StringUtil;
import com.battcn.entity.GroupEntity;
import com.battcn.entity.ResourcesEntity;
import com.battcn.mapper.ResourcesMapper;
import com.battcn.service.BaseServiceImpl;
import com.battcn.service.system.ResourcesService;

@Service
public class ResourcesServiceImpl extends BaseServiceImpl<ResourcesEntity> implements ResourcesService
{
	Logger logger = Logger.getLogger(ResourcesServiceImpl.class);
	@Autowired
	private ResourcesMapper resourcesMapper;

	public PageInfo<ResourcesEntity> queryResourcrsForList()
	{
		PageHelper.orderBy("scort");
		return this.queryPageForList();
	}

	public List<ResourcesEntity> queryResourcesForList()
	{
		return this.queryObjectForList("scort");
	}

	public List<ResourcesEntity> findRes(Map<String, String> queryMap)
	{
		return this.resourcesMapper.findRes(queryMap);
	}

	public List<ResourcesEntity> findResourcessByRoleId(String roleId)
	{
		return this.resourcesMapper.findResourcessByRoleId(roleId);
	}

	public List<ResourcesEntity> findResourcessByMap(Map<String,String> queryMap)
	{
		return this.resourcesMapper.findResourcessByMap(queryMap);
	}

	public String saveOrUpdate(ResourcesEntity entity)
	{
		String result = "";
		if (entity.getId() == null)
		{
			result = this.save(entity);
		}
		else
		{
			result = this.update(entity);
		}
		this.resourcesMapper.treeNodes();
		return result;
	}

	public String updateGroupByRole(String userId,String roleId, Integer[] resId)
	{
		try
		{
			if (StringUtil.isNotEmpty(userId))//如果是给用户分配权限走这里
			{
				// 角色不为Null,应该先删除原本的权限,然后新增
				this.resourcesMapper.deleteByUserId(userId);
				if (resId != null)
				{
					List<GroupEntity> list = new ArrayList<GroupEntity>();
					for (int i = 0; i < resId.length; i++)
					{
						GroupEntity entity = new GroupEntity();
						entity.setResId(Long.valueOf(resId[i]));
						entity.setUserId(Long.valueOf(userId));
						list.add(entity);
					}
					this.resourcesMapper.batchAddUserGroup(list);
				}
			}
			if (StringUtil.isNotEmpty(roleId)){
				// 角色不为Null,应该先删除原本的权限,然后新增
				this.resourcesMapper.deleteByRoleId(roleId);
				if (resId != null)
				{
					List<GroupEntity> list = new ArrayList<GroupEntity>();
					for (int i = 0; i < resId.length; i++)
					{
						GroupEntity entity = new GroupEntity();
						entity.setResId(Long.valueOf(resId[i]));
						entity.setRoleId(Long.valueOf(roleId));
						list.add(entity);
					}
					this.resourcesMapper.batchAddRoleGroup(list);
				}
			}
		} catch (Exception e)
		{
			logger.error("resources --error--updateGroupByRole--", e);
			return ERROR;
		}
		return SUCCESS;
	}

	@Override
	public List<ResourcesEntity> findResourcessByUserId(Long userId)
	{
		return resourcesMapper.findResourcesByUserId(userId);
	}

}
