package com.battcn.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "t_mp_buttom")
public class ButtomEntity implements java.io.Serializable
{
	@Transient
	private static final long serialVersionUID = 4632776596792017054L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	@Column(name = "name")
	private String name;
	@Column(name = "buttom")
	private String buttom;
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

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getButtom()
	{
		return buttom;
	}

	public void setButtom(String buttom)
	{
		this.buttom = buttom;
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
