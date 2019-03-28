package com.ansk.web.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.ansk.web.mappers.replyMapper";
	
	//REST방식이고 페이징처리를 하지 않은 애
  	@Override
	public List<ReplyVO> list(Integer bno) throws Exception {
		return sqlSession.selectList(namespace + ".list", bno);
	}
  	
	@Override
	public void create(ReplyVO vo) throws Exception {
		sqlSession.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		sqlSession.delete(namespace + ".delete", rno);
	}

	//페이징 처리를 추가한 REST방식
	@Override
	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception {
		
		//Map<String,Object> paramMap = new HashMap<>();
		HashMap<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return sqlSession.selectList(namespace + ".listPage", paramMap);
	}
	
	//해당 게시물의 전체 댓글 수를 가져온다
	@Override
	public int count(Integer bno) throws Exception {
		return sqlSession.selectOne(namespace + ".count", bno);
	}

	@Override
	public int getBno(Integer rno) throws Exception {
		
		return sqlSession.selectOne(namespace+ ".getBno", rno);
	}

}
