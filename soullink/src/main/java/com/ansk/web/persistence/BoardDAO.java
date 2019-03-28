package com.ansk.web.persistence;

import java.util.List;

import com.ansk.web.domain.BoardVO;
import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.SearchCriteria;

public interface BoardDAO {
	
	public void create(BoardVO vo) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(Integer bno) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	//댓글의 숫자를 변경할 수 있는 updateReplyCnt
	public void updateReplyCnt(Integer bno, int amount) throws Exception;
	
	//page처리
	public List<BoardVO> listPage(int page) throws Exception;
	
	//listCriteria()는 Criteria객체를 파라미터로 받고 필요한 getPageStart()와 getPerPageNum()메소드를 호출한 결과를 사용하게 됩니다
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	//totalCount를 반환할 수 있게 처리하기 위해 사용됨.
	public int countPaging(Criteria cri) throws Exception;
	
	//동적 SQL문을 적용하기 위한 메소드(검색과 페이징을 둘 다 처리하기 위해서 SearchCriteria를 파라미터로 받는다
	//SearchCriteria는 네 개의 데이터를 유지할 수 있다
	//page,perPagenum(Criteria에서 상속된 속성),searchType(검색조건),keyword(검색 키워드)
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
