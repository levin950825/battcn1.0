package com.battcn.service.system;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.UserEntity;
import com.battcn.service.BaseService;

public interface UserService extends BaseService<UserEntity>
{

	public UserEntity findByLoginName(String accountName);

	public PageInfo<UserEntity> queryUserForList();

	public String saveOrUpdate(UserEntity entity,Long txtGroupsSelect[]);
}
