package com.ansk.web.persistence;

import java.util.List;

import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.ReplyVO;

//우선적으로 필요한 댓글의 리스트와 댓글 등록, 수정,삭제 기능을 정의합니다.
public interface ReplyDAO {
	//페이징 처리를 하지 않은 REST방식
	public List<ReplyVO> list(Integer bno) throws Exception;
	public void create(ReplyVO vo) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(Integer rno) throws Exception;
	
	//페이징 처리를 하기 위한 REST방식
	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;
	//화면에 페이징 처리를 하기 위해서는 반드시 해당 게시물의 댓글 수가 필요하므로 만듬
	public int count(Integer bno) throws Exception;
	//댓글이 삭제될 때 해당 게시물의 번호를 알아내는 기능
	public int getBno(Integer rno) throws Exception;
	
}
