package cn.edu.kmust.camret.security.service;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PasswordEncoderImpl implements PasswordEncoder{
	
	private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	
	private Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();

	public String passwordMD5encode(String str) {
		// TODO Auto-generated method stub
		return md5PasswordEncoder.encodePassword(str, md5PasswordEncoder);
	}

	public String passwordBCryptEncode(String str) {
		// TODO Auto-generated method stub
		return bCryptPasswordEncoder.encode(str);
	}


}
