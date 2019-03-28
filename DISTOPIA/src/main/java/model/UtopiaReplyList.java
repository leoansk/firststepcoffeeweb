package model;

import java.util.ArrayList;

public class UtopiaReplyList {
	private ArrayList<Integer> boa_numberlist = new ArrayList<Integer>();
	private ArrayList<Integer> rep_numberlist = new ArrayList<Integer>();
	private ArrayList<String> rep_datelist = new ArrayList<String>();
	private ArrayList<String> us_idlist  = new ArrayList<String>();
	private ArrayList<String> rep_contentlist = new ArrayList<String>();

	
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
	//======================부모번호,그룹번호,출력순서=========================================
	private ArrayList<Integer> rep_parentsnumlist = new ArrayList<Integer>();
	private ArrayList<Integer> rep_orderlist = new ArrayList<Integer>();
	private ArrayList<Integer> rep_groupnumlist = new ArrayList<Integer>();

	public Integer[] getRep_parentsnum(){
		return rep_parentsnumlist.toArray(new Integer[rep_parentsnumlist.size()]);
	}
	public Integer[] getRep_order(){
		return rep_orderlist.toArray(new Integer[rep_orderlist.size()]);
	}
	public Integer[] getRep_groupnum(){
		return rep_groupnumlist.toArray(new Integer[rep_groupnumlist.size()]);
	}
	public void setRep_parentsnum(int index,int rep_parentsnum){
		this.rep_parentsnumlist.add(index,rep_parentsnum);
		
	}

	public void setRep_order(int index,int rep_order){
		this.rep_orderlist.add(index,rep_order);
	}

	public void setRep_groupnum(int index,int rep_groupnum){
		this.rep_groupnumlist.add(index,rep_groupnum);
	}

	//==============================================================

	public String[] getRep_content() {
		return rep_contentlist.toArray(new String[rep_contentlist.size()]);
	}
	public Integer[] getBoa_number() {
		return boa_numberlist.toArray(new Integer[boa_numberlist.size()]);
	}
	public Integer[] getRep_number() {
		return rep_numberlist.toArray(new Integer[rep_numberlist.size()]);
	}
	public String[] getRep_date() {
		return rep_datelist.toArray(new String[rep_datelist.size()]);
	}
	public String[] getUs_id() {
		return us_idlist.toArray(new String[us_idlist.size()]);
	}

	public void setBoa_number(int index, int boa_number){
		this.boa_numberlist.add(index, boa_number);
	}

	public void setRep_number(int index, int rep_number){
		this.rep_numberlist.add(index, rep_number);
	}
	public void setRep_date(int index, String rep_date){
		this.rep_datelist.add(index, rep_date);
	}
	public void setUs_id(int index, String us_id){
		this.us_idlist.add(index, us_id);
	}

	public void setRep_contentlist(int index, String rep_content){
		this.rep_contentlist.add(index, rep_content);
	}
	public int getListSize() {
		return boa_numberlist.size();
	}

}
