package com.battcn.service.system.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.UserEntity;
import com.battcn.entity.UserRoleEntity;
import com.battcn.mapper.ResourcesMapper;
import com.battcn.mapper.UserRoleMapper;
import com.battcn.service.BaseServiceImpl;
import com.battcn.service.system.UserService;
import com.battcn.util.PasswordHelper;

@Service
public class UserServiceImpl extends BaseServiceImpl<UserEntity>implements UserService
{

	@Autowired
	private ResourcesMapper resourcesMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;

	public UserEntity findByLoginName(String accountName)
	{
		UserEntity entity = new UserEntity();
		entity.setAccountName(accountName);
		return this.findByObject(entity);
	}

	public PageInfo<UserEntity> queryUserForList()
	{
		return this.queryPageForList();
	}

	public String saveOrUpdate(UserEntity entity, Long txtGroupsSelect[])
	{
		String result = "";
		try
		{
			if (entity.getId() == null)
			{
				PasswordHelper passwordHelper = new PasswordHelper();
				passwordHelper.encryptPassword(entity);
				result = this.save(entity);
			} else
			{
				// 删除逻辑
				this.resourcesMapper.deleteRoleByUserId(String.valueOf(entity.getId()));
			}
			if (txtGroupsSelect != null && txtGroupsSelect.length > 0)
			{
				for (Long roleId : txtGroupsSelect)
				{
					UserRoleEntity record = new UserRoleEntity();
					record.setUserId(entity.getId());
					record.setRoleId(roleId);
					userRoleMapper.insertSelective(record);
				}
			}
			result = this.update(entity);
		} catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
		return result;
	}
}
