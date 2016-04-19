package cn.edu.kmust.camret.security.service;

public interface PasswordEncoder {
	
	//MD5加密
	public String passwordMD5encode(String str);
	
	public String passwordBCryptEncode(String str);
	
}
