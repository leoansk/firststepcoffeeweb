package com.ansk.web.domain;

//Criteria뜻 검색기준,분류기준
public class Criteria {
	//limit page,perPageNum 즉 기본세팅은 limit 1,10
  private int page;
  private int perPageNum;

  public Criteria() {
    this.page = 1;
    this.perPageNum = 10;
  }

  public void setPage(int page) {

    if (page <= 0) {
      this.page = 1;
      return;
    }

    this.page = page;
  }

  public void setPerPageNum(int perPageNum) {
	  //둘중에 하나가 만족할시 
    if (perPageNum <= 0 || perPageNum > 100) {
      this.perPageNum = 10;
      return;
    }

    this.perPageNum = perPageNum;
  }

  public int getPage() {
    return page;
  }
  // mapper에서 사용하는 getter
  //getPerPageNum()은 sql limit구문에서 뒤에위치를 지정할 때 사용
  public int getPerPageNum() {
	  
	  return this.perPageNum;
  }

  // mapper에서 사용하는 getter
  //getPageStart()는 sql limit구문에서 시작위치를 지정할 때 사용
  public int getPageStart() {
	  //계산공식:시작데이터번호=(페이지번호-1)*페이지 당 보여지는 개수
    return (this.page - 1) * perPageNum;
  }


  @Override
  public String toString() {
    return "Criteria [page=" + page + ", "
        + "perPageNum=" + perPageNum + "]";
  }
}
