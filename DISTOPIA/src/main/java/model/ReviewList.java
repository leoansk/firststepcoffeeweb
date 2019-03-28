package model;

import java.util.ArrayList;

public class ReviewList {
	
	private ArrayList<Integer> rev_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> pro_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> us_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> rev_pointlist = new ArrayList<Integer>();
	private ArrayList<String> rev_contentlist = new ArrayList<String>();
	private ArrayList<String> rev_photolist = new ArrayList<String>();
	private ArrayList<Integer> rev_userproductscorelist = new ArrayList<Integer>();
	private ArrayList<String> rev_datelist = new ArrayList<String>();
	private ArrayList<String> rev_titlelist = new ArrayList<String>();
	private ArrayList<String> rev_photo1list = new ArrayList<String>();
	private ArrayList<String> rev_photo2list = new ArrayList<String>();
	private ArrayList<String> rev_photo3list = new ArrayList<String>();
	private ArrayList<Integer> checkedUserlist= new ArrayList<Integer>();
	
	public String[] getRev_photo1() {
		return rev_photo1list.toArray(new String[rev_photo1list.size()]);
		}
	public void setRev_photo1(int index, String rev_photo1) {
		this.rev_photo1list.add(index, rev_photo1);
		}
	public String[] getRev_photo2() {
		return rev_photo2list.toArray(new String[rev_photo2list.size()]);
		}
	public void setRev_photo2(int index, String rev_photo2) {
		this.rev_photo2list.add(index, rev_photo2);
		}
	public String[] getRev_photo3() {
		return rev_photo3list.toArray(new String[rev_photo3list.size()]);
		}
	public void setRev_photo3(int index, String rev_photo3) {
		this.rev_photo3list.add(index, rev_photo3);
		}
	
	public Integer[] getCheckedUser() {
		return checkedUserlist.toArray(new Integer[checkedUserlist.size()]);
		}
	public void setCheckedUser(int index, int checkedUser) {
		this.checkedUserlist.add(index, checkedUser);
		}
	public String[] getRev_title() {
		return rev_titlelist.toArray(new String[rev_titlelist.size()]);
		}
	public void setRev_title(int index, String rev_title) {
		this.rev_titlelist.add(index, rev_title);
		}
	public String[] getRev_date() {
		return rev_datelist.toArray(new String[rev_datelist.size()]);
		}
	public void setRev_date(int index, String rev_date) {
		this.rev_datelist.add(index, rev_date);
		}
	public Integer[] getRev_userproductscore() {
		return rev_userproductscorelist.toArray(new Integer[rev_userproductscorelist.size()]);
		}
	public void setRev_userproductscore(int index, int rev_userproductscore) {
		this.rev_userproductscorelist.add(index, rev_userproductscore);
		}
	public String[] getRev_photo() {
		return rev_photolist.toArray(new String[rev_photolist.size()]);
		}
	public void setRev_photo(int index, String rev_photo) {
		this.rev_photolist.add(index, rev_photo);
		}
	public String[] getRev_content() {
		return rev_contentlist.toArray(new String[rev_contentlist.size()]);
		}
	public void setRev_content(int index, String rev_content) {
		this.rev_contentlist.add(index, rev_content);
		}
	public Integer[] getRev_point() {
		return rev_pointlist.toArray(new Integer[rev_pointlist.size()]);
		}
	
	public void setRev_point(int index, int rev_point) {
		this.rev_pointlist.add(index, rev_point);
		}
	public Integer[] getUs_number() {
		return us_numberlist.toArray(new Integer[us_numberlist.size()]);
		}
	
	public void setUs_number(int index, int us_number) {
		this.us_numberlist.add(index, us_number);
		}
	public Integer[] getPro_number() {
		return pro_numberlist.toArray(new Integer[pro_numberlist.size()]);
		}
	
	public void setPro_number(int index, int pro_number) {
		this.pro_numberlist.add(index, pro_number);
		}
	
	public Integer[] getRev_number() {
		return rev_numberlist.toArray(new Integer[rev_numberlist.size()]);
		}
	
	public void setRev_number(int index, int rev_number) {
		this.rev_numberlist.add(index, rev_number);
		}
	public int getListSize() {
		return rev_numberlist.size();
	}
	
}
