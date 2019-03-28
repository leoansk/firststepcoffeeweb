package com.ansk.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.ReplyVO;
import com.ansk.web.persistence.BoardDAO;
import com.ansk.web.persistence.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception{
		replyDAO.create(vo);
		boardDAO.updateReplyCnt(vo.getBno(), 1);
	}
	
	/*	댓글 수 카운트 하기 전
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		replyDAO.create(vo);
	}*/
	
	//페이징 처리 안된애
	
	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception {
		return replyDAO.list(bno);
	}
	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		replyDAO.update(vo);
	}
	
	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception{
		int bno = replyDAO.getBno(rno);
		replyDAO.delete(rno);
		boardDAO.updateReplyCnt(bno, -1);
	}
	
	/*	댓글 수 삭제 카운트 하기 전
	@Override
	public void removeReply(Integer rno) throws Exception {
		replyDAO.delete(rno);
	}
	*/
	
	
	//페이징 처리 해준애
	@Override
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {
		return replyDAO.listPage(bno, cri);
	}
	@Override
	public int count(Integer bno) throws Exception {
		return replyDAO.count(bno);
	}
	
	

}
