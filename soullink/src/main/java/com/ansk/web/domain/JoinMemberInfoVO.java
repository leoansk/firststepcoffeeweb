package com.ansk.web.domain;

import java.util.Date;

public class JoinMemberInfoVO {
	private String id;
	private String password;
	private String password_re;
	private String email;
	private Date regdate;
	private Date updatedate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword_re() {
		return password_re;
	}
	public void setPassword_re(String password_re) {
		this.password_re = password_re;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

}
