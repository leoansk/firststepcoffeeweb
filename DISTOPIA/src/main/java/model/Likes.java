package model;

public class Likes {
	private Integer like_number;
	private Integer us_number;
	private Integer pro_number;
	private String like_date;
	private String like_memo;
	
	public Integer getLike_number() {
		return like_number;
	}
	public Integer getUs_number() {
		return us_number;
	}
	public Integer getPro_number() {
		return pro_number;
	}
	public String getLike_date() {
		return like_date;
	}
	public String getLike_memo() {
		return like_memo;
	}
	public void setLike_number(Integer like_number) {
		this.like_number = like_number;
	}
	public void setUs_number(Integer us_number) {
		this.us_number = us_number;
	}
	public void setPro_number(Integer pro_number) {
		this.pro_number = pro_number;
	}
	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}
	public void setLike_memo(String like_memo) {
		this.like_memo = like_memo;
	}
	
}
