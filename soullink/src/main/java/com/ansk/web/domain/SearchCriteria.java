package com.ansk.web.domain;

//SearchCriteria는 기존의 Criteria에 searchType,keyword를 추가한 형태로 작성함
public class SearchCriteria extends Criteria{

	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return super.toString() + "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
}


