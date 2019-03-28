package model;

import java.util.ArrayList;

import oracle.sql.BLOB;

public class UsersListA {
	private ArrayList<Integer> us_numberlist = new ArrayList<Integer>();
	private ArrayList<String> us_idlist = new ArrayList<String>();
	private ArrayList<String> us_passwordlist = new ArrayList<String>();
	private ArrayList<String> us_agelist = new ArrayList<String>();
	private ArrayList<String> us_genderlist = new ArrayList<String>();
	private ArrayList<String> us_addresslist = new ArrayList<String>();
	private ArrayList<String> us_emaillist = new ArrayList<String>();
	private ArrayList<String> us_phonelist = new ArrayList<String>();
	private ArrayList<String> us_birthdaylist = new ArrayList<String>();
	private ArrayList<BLOB> us_photolist = new ArrayList<BLOB>();
	private ArrayList<String> us_namelist = new ArrayList<String>();
	private ArrayList<String> us_photonamelist = new ArrayList<String>();
	
	public String[] getUs_photoname() {
		return us_photonamelist.toArray(new String[us_photonamelist.size()]);
	}
	public void setUs_photoname(int index, String us_photoname){
		this.us_photonamelist.add(index, us_photoname);
	}
	
	public String[] getUs_name(){
		return us_namelist.toArray(new String[us_namelist.size()]);
	}
	
	
	public Integer[] getUs_number() {
		return us_numberlist.toArray(new Integer[us_numberlist.size()]);
	}
	public String[] getUs_id() {
		return us_idlist.toArray(new String[us_idlist.size()]);
	}
	public String[] getUs_password() {
		return us_passwordlist.toArray(new String[us_passwordlist.size()]);
	}
	public String[] getUs_age() {
		return us_agelist.toArray(new String [us_agelist.size()]);
	}
	public String[] getUs_gender() {
		return us_genderlist.toArray(new String[us_genderlist.size()]);
	}
	public String[] getUs_address() {
		return us_addresslist.toArray(new String[us_addresslist.size()]);
	}
	public String[] getUs_email() {
		return us_emaillist.toArray(new String[us_emaillist.size()]);
	}
	public String[] getUs_phone() {
		return us_phonelist.toArray(new String[us_phonelist.size()]);
	}
	public String[] getUs_birthday() {
		return us_birthdaylist.toArray(new String[us_birthdaylist.size()]);
	}
	public BLOB[] getUs_photo() {
		return us_photolist.toArray(new BLOB[us_photolist.size()]);
	}
	
	
	
	//setter
	public void setUs_name(int index, String us_name){
		this.us_namelist.add(index, us_name);
	}
	public void setUs_number(int index, int us_number) {
		this.us_numberlist.add(index, us_number);
	}
	
	public void setUs_id(int index, String us_id) {
		this.us_idlist.add(index, us_id);
	}
	public void setUs_password(int index, String us_password) {
		this.us_passwordlist.add(index, us_password);
	}
	public void setUs_age(int index, String us_age) {
		this.us_agelist.add(index, us_age);
	}
	public void setUs_gender(int index, String us_gender) {
		this.us_genderlist.add(index, us_gender);
	}
	public void setUs_address(int index, String us_address) {
		this.us_addresslist.add(index, us_address);
	}
	public void setUs_email(int index, String us_email) {
		this.us_emaillist.add(index, us_email);
	}
	public void setUs_phone(int index, String us_phone) {
		this.us_phonelist.add(index, us_phone);
	}
	public void setUs_birthday(int index, String us_birthday) {
		this.us_birthdaylist.add(index, us_birthday);
	}
	public void setUs_photo(int index, BLOB us_photo) {
		this.us_photolist.add(index, us_photo);
	}
	
	
	
}
