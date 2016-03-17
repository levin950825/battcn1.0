package com.battcn.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "t_mp_server_info")
public class ServiceInfoEntity implements java.io.Serializable
{
	@Transient
	private static final long serialVersionUID = -2053588631509322820L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	@Column(name = "cpuUsage")
	private String cpuUsage;
	@Column(name = "setCpuUsage")
	private String setCpuUsage;
	@Column(name = "jvmUsage")
	private String jvmUsage;
	@Column(name = "setJvmUsage")
	private String setJvmUsage;
	@Column(name = "ramUsage")
	private String ramUsage;
	@Column(name = "setRamUsage")
	private String setRamUsage;
	@Column(name = "email")
	private String email;
	@Column(name = "date")
	private String date;
	@Column(name = "mark")
	private String mark;

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getCpuUsage()
	{
		return cpuUsage;
	}

	public void setCpuUsage(String cpuUsage)
	{
		this.cpuUsage = cpuUsage;
	}

	public String getSetCpuUsage()
	{
		return setCpuUsage;
	}

	public void setSetCpuUsage(String setCpuUsage)
	{
		this.setCpuUsage = setCpuUsage;
	}

	public String getJvmUsage()
	{
		return jvmUsage;
	}

	public void setJvmUsage(String jvmUsage)
	{
		this.jvmUsage = jvmUsage;
	}

	public String getSetJvmUsage()
	{
		return setJvmUsage;
	}

	public void setSetJvmUsage(String setJvmUsage)
	{
		this.setJvmUsage = setJvmUsage;
	}

	public String getRamUsage()
	{
		return ramUsage;
	}

	public void setRamUsage(String ramUsage)
	{
		this.ramUsage = ramUsage;
	}

	public String getSetRamUsage()
	{
		return setRamUsage;
	}

	public void setSetRamUsage(String setRamUsage)
	{
		this.setRamUsage = setRamUsage;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getDate()
	{
		return date;
	}

	public void setDate(String date)
	{
		this.date = date;
	}

	public String getMark()
	{
		return mark;
	}

	public void setMark(String mark)
	{
		this.mark = mark;
	}

}
