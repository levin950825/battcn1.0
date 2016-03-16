package com.battcn.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "t_mp_role")
public class RoleEntity implements java.io.Serializable
{
	@Transient
	private static final long serialVersionUID = -7008567341719097566L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	@Column(name = "isEnabled")
	private String isEnabled;
	@Column(name = "roleName")
	private String roleName;
	@Column(name = "description")
	private String description;
	@Column(name = "date")
	private String date;

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getIsEnabled()
	{
		return isEnabled;
	}

	public void setIsEnabled(String isEnabled)
	{
		this.isEnabled = isEnabled;
	}

	public String getRoleName()
	{
		return roleName;
	}

	public void setRoleName(String roleName)
	{
		this.roleName = roleName;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getDate()
	{
		return date;
	}

	public void setDate(String date)
	{
		this.date = date;
	}

}
