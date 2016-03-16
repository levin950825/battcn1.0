package com.battcn.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "t_mp_userinfo")
public class UserEntity implements java.io.Serializable
{
	@Transient
	private static final long serialVersionUID = 7561221437381062290L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	@Column(name = "userName")
	private String userName;
	@Column(name = "accountName")
	private String accountName;
	@Column(name = "credentialsSalt")
	private String credentialsSalt;
	@Column(name = "locked")
	private String locked;
	@Column(name = "passWord")
	private String passWord;
	@Column(name = "email")
	private String email;
	@Column(name = "tel")
	private String tel;
	@Column(name = "description")
	private String description;
	@Column(name = "date")
	private String date;
	// @Transient表示注销改字段

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getAccountName()
	{
		return accountName;
	}

	public void setAccountName(String accountName)
	{
		this.accountName = accountName;
	}

	public String getCredentialsSalt()
	{
		return credentialsSalt;
	}

	public void setCredentialsSalt(String credentialsSalt)
	{
		this.credentialsSalt = credentialsSalt;
	}

	public String getLocked()
	{
		return locked;
	}

	public void setLocked(String locked)
	{
		this.locked = locked;
	}

	public String getPassWord()
	{
		return passWord;
	}

	public void setPassWord(String passWord)
	{
		this.passWord = passWord;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
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
