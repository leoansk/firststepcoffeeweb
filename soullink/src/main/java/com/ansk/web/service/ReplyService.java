package com.ansk.web.service;

import java.util.List;

import com.ansk.web.domain.Criteria;
import com.ansk.web.domain.ReplyVO;

public interface ReplyService {
	
	public void addReply(ReplyVO vo) throws Exception;
	
	//페이징 처리가 안된 REST방식
	public List<ReplyVO> listReply(Integer bno) throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	//페이징 처리를 위한 
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception;
	
	public int count(Integer bno) throws Exception;
}
