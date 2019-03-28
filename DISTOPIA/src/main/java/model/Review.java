package model;

public class Review {
	private Integer rev_number;
	private Integer pro_number;
	private Integer us_number;
	private Integer rev_point;
	private String rev_content;
	private String rev_photo1,rev_photo2,rev_photo3;
	private Integer rev_userproductscore;
	private String rev_date;
	private String rev_title;
	private String us_id;
	private String us_photo;
	private Integer revck_costeff;
	private Integer revch_design;
	private Integer revch_performance;
	private Integer revch_as;
	private Integer revch_durability;
	private Integer checkedUser;
	private String us_photoname;
	
	
	
	public String getUs_photoname() {
		return us_photoname;
	}
	public void setUs_photoname(String us_photoname) {
		this.us_photoname = us_photoname;
	}
	public String getRev_photo1() {
		return rev_photo1;
	}
	public void setRev_photo1(String rev_photo1) {
		this.rev_photo1 = rev_photo1;
	}
	public String getRev_photo2() {
		return rev_photo2;
	}
	public void setRev_photo2(String rev_photo2) {
		this.rev_photo2 = rev_photo2;
	}
	public String getRev_photo3() {
		return rev_photo3;
	}
	public void setRev_photo3(String rev_photo3) {
		this.rev_photo3 = rev_photo3;
	}
	public Integer getCheckedUser() {
		return checkedUser;
	}
	public void setCheckedUser(Integer checkedUser) {
		this.checkedUser = checkedUser;
	}
	public Integer getRevck_costeff() {
		return revck_costeff;
	}
	public Integer getRevch_design() {
		return revch_design;
	}
	public Integer getRevch_performance() {
		return revch_performance;
	}
	public Integer getRevch_as() {
		return revch_as;
	}
	public Integer getRevch_durability() {
		return revch_durability;
	}
	public void setRevck_costeff(Integer revck_costeff) {
		this.revck_costeff = revck_costeff;
	}
	public void setRevch_design(Integer revch_design) {
		this.revch_design = revch_design;
	}
	public void setRevch_performance(Integer revch_performance) {
		this.revch_performance = revch_performance;
	}
	public void setRevch_as(Integer revch_as) {
		this.revch_as = revch_as;
	}
	public void setRevch_durability(Integer revch_durability) {
		this.revch_durability = revch_durability;
	}
	public Integer getPro_number() {
		return pro_number;
	}
	public String getUs_id() {
		return us_id;
	}
	
	public void setPro_number(Integer pro_number) {
		this.pro_number = pro_number;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	
	public String getUs_photo() {
		return us_photo;
	}
	public void setUs_photo(String us_photo) {
		this.us_photo = us_photo;
	}
	public Integer getRev_number() {
		return rev_number;
	}
	public Integer getPro_numer() {
		return pro_number;
	}
	public Integer getUs_number() {
		return us_number;
	}
	public Integer getRev_point() {
		return rev_point;
	}
	public String getRev_content() {
		return rev_content;
	}
	
	public Integer getRev_userproductscore() {
		return rev_userproductscore;
	}
	public String getRev_date() {
		return rev_date;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_number(Integer rev_number) {
		this.rev_number = rev_number;
	}
	public void setPro_numer(Integer pro_numer) {
		this.pro_number = pro_numer;
	}
	public void setUs_number(Integer us_number) {
		this.us_number = us_number;
	}
	public void setRev_point(Integer rev_point) {
		this.rev_point = rev_point;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	
	public void setRev_userproductscore(Integer rev_userproductscore) {
		this.rev_userproductscore = rev_userproductscore;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	
	
}
