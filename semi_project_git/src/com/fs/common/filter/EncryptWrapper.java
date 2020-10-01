package com.fs.common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	//암호화처리
	@Override
	public String getParameter(String name) {
		String result = "";
		String ori = super.getParameter(name);
		if(name.equals("memberPw")) {
			System.out.println("암호화 전"+ori);
			result = getSha512(ori);
			System.out.println("암호화 후"+result);
		}else {
			result = ori;
		}
		return result;
	}
	
	private String getSha512(String memberPw) {
		String encrypt = "";
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] bytes = memberPw.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		
		encrypt = Base64.getEncoder().encodeToString(md.digest());
		return encrypt;
	}
	
	
	
	
	
}
