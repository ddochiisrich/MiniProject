package com.second.miniproject.domain;

public class MemberShip {
	// 회원가입
//	- 비밀번호 확인
// 이름 - name, 생일 -, 주민번호 -,전화번호 - phone, 이메일 - email, 주소 -, 아이디 -, 비밀번호(비밀번호 확인) -
	private String name, id, pass, email, mobile;
	private String zipcode, address1, address2; // 주소 관련
	private boolean emailGet;
	
	public MemberShip() {	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public boolean isEmailGet() {
		return emailGet;
	}
	public void setEmailGet(boolean emailGet) {
		this.emailGet = emailGet;
	}
	
	
}
