package com.battcn.util;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import com.battcn.entity.UserEntity;

public class PasswordHelper
{
	private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	private String algorithmName = "md5";
	private int hashIterations = 2;

	public void encryptPassword(UserEntity infoEntity)
	{
		String salt = randomNumberGenerator.nextBytes().toHex();
		infoEntity.setCredentialsSalt(salt);
		String newPassword = new SimpleHash(algorithmName, infoEntity.getPassWord(), ByteSource.Util.bytes(infoEntity.getAccountName()+salt), hashIterations).toHex();
		infoEntity.setPassWord(newPassword);
		System.out.println(newPassword);
		System.out.println(salt);
	}

	public static void main(String[] args)
	{
		PasswordHelper passwordHelper = new PasswordHelper();
		UserEntity userFormMap = new UserEntity();
		userFormMap.setPassWord("123456");
		userFormMap.setAccountName("admin");
		passwordHelper.encryptPassword(userFormMap);
	}
}
