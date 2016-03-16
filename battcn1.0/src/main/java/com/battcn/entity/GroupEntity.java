package com.battcn.entity;

public class GroupEntity implements java.io.Serializable
{
	private static final long serialVersionUID = -8437581071217901497L;
	private Long roleId;
	private Long userId;
	private Long resId;

	public Long getRoleId()
	{
		return roleId;
	}

	public void setRoleId(Long roleId)
	{
		this.roleId = roleId;
	}

	public Long getUserId()
	{
		return userId;
	}

	public void setUserId(Long userId)
	{
		this.userId = userId;
	}

	public Long getResId()
	{
		return resId;
	}

	public void setResId(Long resId)
	{
		this.resId = resId;
	}

}
