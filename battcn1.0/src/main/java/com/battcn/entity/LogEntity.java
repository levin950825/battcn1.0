package com.battcn.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "t_mp_log")
public class LogEntity implements java.io.Serializable
{
	@Transient
	private static final long serialVersionUID = -7219312610626941290L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	@Column(name = "accountName")
	private String accountName;
	@Column(name = "module")
	private String module;
	@Column(name = "methods")
	private String methods;
	@Column(name = "actionTime")
	private String actionTime;
	@Column(name = "ip")
	private String ip;
	@Column(name = "description")
	private String description;
	
	@OrderBy("desc")
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

	public String getAccountName()
	{
		return accountName;
	}

	public void setAccountName(String accountName)
	{
		this.accountName = accountName;
	}

	public String getModule()
	{
		return module;
	}

	public void setModule(String module)
	{
		this.module = module;
	}

	public String getMethods()
	{
		return methods;
	}

	public void setMethods(String methods)
	{
		this.methods = methods;
	}

	public String getActionTime()
	{
		return actionTime;
	}

	public void setActionTime(String actionTime)
	{
		this.actionTime = actionTime;
	}

	public String getIp()
	{
		return ip;
	}

	public void setIp(String ip)
	{
		this.ip = ip;
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
