package com.battcn.mapper;

import java.util.List;

import com.battcn.entity.RoleEntity;

import tk.mybatis.mapper.common.Mapper;

public interface RoleMapper extends Mapper<RoleEntity>
{
	public List<RoleEntity> findRoleByUser(String userId);
}
