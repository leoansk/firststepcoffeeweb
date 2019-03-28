package com.ansk.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ansk.web.domain.BoardVO;
import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.SearchCriteria;
import com.ansk.web.persistence.BoardDAO;

//@Service: 스프링에서 빈으로 인식하기 위해서 사용
//만들어놓은 DAO를 이용해서 실행시켜주기만 하는 역할
@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
	}
	@Override
	public BoardVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
	}
	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}
	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}
	//페이지 처리
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		
		return dao.listCriteria(cri);
	}
	//Criteria를 이용해 전체 게시물의 숫자를 계산
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return dao.countPaging(cri);
	}
	
	//동적 SQL문,검색어 실행을 위한..
	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
}
