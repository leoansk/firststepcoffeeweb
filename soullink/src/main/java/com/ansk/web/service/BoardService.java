package com.ansk.web.service;

import java.util.List;

import com.ansk.web.domain.BoardVO;
import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.SearchCriteria;
/*
	스프링에서 비지니스영역은 일반적으로 서비스라는 이름을 칭합니다.
	비지니스 계층은 고객의 요구사항이 반영되는 영역입니다.
	비지니스계층은 쉽게 말해 컨트롤러와 DAO사이의 접착제 역할을 합니다.
	1.요구사항을 메소드로 정리해서 xxxService인터페이스를 정의하고
	2.xxxServiceImpl 구현객체를 만들어준다
	비지니스객체의 구현은 로직에 필요한 데이터베이스 관련 객체들을 모아서 자신이 원하는
	일을 처리하는 용도이다
*/
public interface BoardService {

	public void regist(BoardVO board) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public void modify(BoardVO board) throws Exception;
	public void remove(Integer bno) throws Exception;
	public List<BoardVO> listAll() throws Exception;
	//페이지 처리용
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	//Criteria를 이용해 전체 게시물의 숫자를 계산
	public int listCountCriteria(Criteria cri) throws Exception;
	
	//동적 SQL문,검색어 실행을 위한..
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
