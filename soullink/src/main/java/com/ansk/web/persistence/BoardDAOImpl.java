package com.ansk.web.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ansk.web.domain.BoardVO;
import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.SearchCriteria;

//@Repository : 1.DAO객체임을 알려주며 DAO를 스프링에 인식시키기 위해서 사용
@Repository
public class BoardDAOImpl implements BoardDAO {
	
	/* SqlSession:
	Mybatis-spring에서 제공하는 SqlSessionTemplate은 Mybatis의 SqlSession인터페이스를 구현한 클래스로 
	기본적인 트랜잭션의 관리나 스레드 처리의 안정성 드을 보장해 주고, 데이터베이스의 연결과 종료를 책임집니다.
	@Inject, @Autowired, @Resource는 모두 의존 관계를 자동으로 연결해주는 기능을 가진 어노테이션이다.
	*/

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.ansk.web.mappers.boardMapper";

	
	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert(namespace + ".create", vo);
	}
	@Override
	public BoardVO read(Integer bno) throws Exception {
		return sqlSession.selectOne(namespace + ".read", bno);
	}
	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update(namespace + ".update", vo);
	}
	@Override
	public void delete(Integer bno) throws Exception {
		sqlSession.delete(namespace + ".delete", bno);
	}
	@Override
	public List<BoardVO> listAll() throws Exception {
		return sqlSession.selectList(namespace + ".listAll");
	}
	//페이지 처리 page값만 받을경우
	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		if(page <= 0){
			page = 1;
		}
		page = (page-1) * 10;
		return sqlSession.selectList(namespace + ".listPage", page);
	}
	//페이지 처리  PageStart과 perPageNum두개의 값을 받을경우
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		
		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}
	//totalCount를 반환할 수 있게 처리하기 위해 사용됨.
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".countPaging",cri);
	}
	//동적 SQL문을 적용하기 위한 메소드(검색과 페이징을 둘 다 처리하기 위해서 SearchCriteria를 파라미터로 받는다
	//SearchCriteria는 네 개의 데이터를 유지할 수 있다
	//page,perPagenum(Criteria에서 상속된 속성),searchType(검색조건),keyword(검색 키워드)
	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listSearchCount", cri);
	}
	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		
		sqlSession.update(namespace + ".updateReplyCnt",paramMap);
	}
}