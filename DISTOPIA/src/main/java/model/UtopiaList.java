package model;

import java.util.ArrayList;

public class UtopiaList {
	private ArrayList<Integer> boa_numberlist = new ArrayList<Integer>();
	private ArrayList<String> boa_titlelist = new ArrayList<String>();
	private ArrayList<String> boa_datelist = new ArrayList<String>();
	private ArrayList<String> us_idlist  = new ArrayList<String>();
	private ArrayList<String> boa_contentlist = new ArrayList<String>();
	private int pageNum;//게시판 페이지 갯수
	private boolean firstPage;//이전페이지 링크용 변수
	private boolean lastPage;//다음페이지 링크용 변수
	
	
	
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public boolean isFirstPage() {
		return firstPage;
	}

	public void setFirstPage(boolean firstPage) {
		this.firstPage = firstPage;
	}

	public boolean isLastPage() {
		return lastPage;
	}

	public void setLastPage(boolean lastPage) {
		this.lastPage = lastPage;
	}

	public String[] getBoa_content() {
		return boa_contentlist.toArray(new String[boa_contentlist.size()]);
	}

	public Integer[] getBoa_number() {
		return boa_numberlist.toArray(new Integer[boa_numberlist.size()]);
	}

	public String[] getBoa_title() {
		return boa_titlelist.toArray(new String[boa_titlelist.size()]);
	}

	public String[] getBoa_date() {
		return boa_datelist.toArray(new String[boa_datelist.size()]);
	}

	public String[] getUs_id() {
		return us_idlist.toArray(new String[us_idlist.size()]);
	}
	
	
	public void setBoa_number(int index, int boa_number){
		this.boa_numberlist.add(index, boa_number);
	}
	public void setBoa_title(int index, String boa_title){
		this.boa_titlelist.add(index, boa_title);
	}
	public void setBoa_date(int index, String boa_date){
		this.boa_datelist.add(index, boa_date);
	}
	public void setUs_id(int index, String us_id){
		this.us_idlist.add(index, us_id);
	}

	public void setBoa_content(int index, String boa_content){
		this.boa_contentlist.add(index, boa_content);
	}
	
	public int getListSize() {
		return boa_numberlist.size();
	}

}
