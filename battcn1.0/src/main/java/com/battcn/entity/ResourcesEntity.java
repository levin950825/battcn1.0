package com.battcn.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "t_mp_resources")
public class ResourcesEntity implements java.io.Serializable
{
	@Transient
	private static final long serialVersionUID = 2350687073322773458L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	@Column(name = "name")
	private String name;
	@Column(name = "parentId")
	private Long parentId;
	@Column(name = "type")
	private String type;
	@Column(name = "resUrl")
	private String resUrl;
	@Column(name = "level")
	private String level;
	@Column(name = "icon")
	private String icon;
	@Column(name = "description")
	private String description;
	@Column(name = "date")
	private String date;
	@Column(name = "nlevel")
	private String nlevel;
	@Column(name = "scort")
	private String scort;

	@Transient
	private List<ResourcesEntity> children = new ArrayList<ResourcesEntity>();

	public List<ResourcesEntity> getChildren()
	{
		return children;
	}

	public void setChildren(List<ResourcesEntity> children)
	{
		this.children = children;
	}

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

	public Long getParentId()
	{
		return parentId;
	}

	public void setParentId(Long parentId)
	{
		this.parentId = parentId;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public String getResUrl()
	{
		return resUrl;
	}

	public void setResUrl(String resUrl)
	{
		this.resUrl = resUrl;
	}

	public String getLevel()
	{
		return level;
	}

	public void setLevel(String level)
	{
		this.level = level;
	}

	public String getIcon()
	{
		return icon;
	}

	public void setIcon(String icon)
	{
		this.icon = icon;
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

	public String getNlevel()
	{
		return nlevel;
	}

	public void setNlevel(String nlevel)
	{
		this.nlevel = nlevel;
	}

	public String getScort()
	{
		return scort;
	}

	public void setScort(String scort)
	{
		this.scort = scort;
	}

}
