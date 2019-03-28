package model;

import oracle.sql.BLOB;

public class Users {
	Integer us_number;
	String us_id;
	String us_password;
	String us_age;
	String us_gender;
	String us_address;
	String us_email;
	String us_phone;
	String us_birthday;
	String us_name;
	BLOB us_photo;
	private String us_photoname;
	
	public String getUs_photoname() {
		return us_photoname;
	}
	public void setUs_photoname(String us_photoname) {
		this.us_photoname = us_photoname;
	}
	public Integer getUs_number() {
		return us_number;
	}
	public void setUs_number(Integer us_number) {
		this.us_number = us_number;
	}
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	public String getUs_password() {
		return us_password;
	}
	public void setUs_password(String us_password) {
		this.us_password = us_password;
	}
	public String getUs_age() {
		return us_age;
	}
	public void setUs_age(String us_age) {
		this.us_age = us_age;
	}
	public String getUs_gender() {
		return us_gender;
	}
	public void setUs_gender(String us_gender) {
		this.us_gender = us_gender;
	}
	public String getUs_address() {
		return us_address;
	}
	public void setUs_address(String us_address) {
		this.us_address = us_address;
	}
	public String getUs_email() {
		return us_email;
	}
	public void setUs_email(String us_email) {
		this.us_email = us_email;
	}
	public String getUs_phone() {
		return us_phone;
	}
	public void setUs_phone(String us_phone) {
		this.us_phone = us_phone;
	}
	public String getUs_birthday() {
		return us_birthday;
	}
	public void setUs_birthday(String us_birthday) {
		this.us_birthday = us_birthday;
	}
	public BLOB getUs_photo() {
		return us_photo;
	}
	public void setUs_photo(BLOB us_photo) {
		this.us_photo = us_photo;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	
	
}
