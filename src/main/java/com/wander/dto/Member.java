package com.wander.dto;

import java.io.Serializable;

public class Member implements Serializable{

	private static final long serialVersionUID = 791162587187412369L;
	private String name;		//사용자 이름
	private String email;		//사용자 이메일
	private String phoneNumber;	//사용자 전화번호
	private String nickname;	//사용자 닉네임
	private String password;	//사용자 비밀번호
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Member(String name, String email, String phoneNumber, String nickname, String password) {
		this.name = name;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.nickname = nickname;
		this.password = password;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
