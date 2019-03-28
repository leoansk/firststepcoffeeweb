package model;

import org.springframework.web.multipart.MultipartFile;

public class UserInfo {
	private Integer usnumber;
	private String usname;
	private String usid;
	private String uspassword;
	private String usage;
	private String usbirthday;
	private MultipartFile usphoto;
	private String usgender;
	private String usaddress;
	private String usemail;
	private String usphone;
	private String ustreasure; //유저 보물
	private String us_photoname;
	
	
	public String getUs_photoname() {
		return us_photoname;
	}
	public void setUs_photoname(String us_photoname) {
		this.us_photoname = us_photoname;
	}
	public Integer getUsnumber() {
		return usnumber;
	}
	public void setUsnumber(Integer usnumber) {
		this.usnumber = usnumber;
	}
	public String getUsname() {
		return usname;
	}
	public void setUsname(String usname) {
		this.usname = usname;
	}
	public String getUsid() {
		return usid;
	}
	public void setUsid(String usid) {
		this.usid = usid;
	}
	public String getUspassword() {
		return uspassword;
	}
	public void setUspassword(String uspassword) {
		this.uspassword = uspassword;
	}
	public String getUsage() {
		return usage;
	}
	public void setUsage(String usage) {
		this.usage = usage;
	}
	public String getUsbirthday() {
		return usbirthday;
	}
	public void setUsbirthday(String usbirthday) {
		this.usbirthday = usbirthday;
	}
	public MultipartFile getUsphoto() {
		return usphoto;
	}
	public void setUsphoto(MultipartFile usphoto) {
		this.usphoto = usphoto;
	}
	public String getUsgender() {
		return usgender;
	}
	public void setUsgender(String usgender) {
		this.usgender = usgender;
	}
	public String getUsaddress() {
		return usaddress;
	}
	public void setUsaddress(String usaddress) {
		this.usaddress = usaddress;
	}
	public String getUsemail() {
		return usemail;
	}
	public void setUsemail(String usemail) {
		this.usemail = usemail;
	}
	public String getUsphone() {
		return usphone;
	}
	public void setUsphone(String usphone) {
		this.usphone = usphone;
	}
	public String getUstreasure() {
		return ustreasure;
	}
	public void setUstreasure(String ustreasure) {
		this.ustreasure = ustreasure;
	}
}
