package com.ansk.web.persistence;

import com.ansk.web.domain.JoinMemberInfoVO;

public interface MembershipManagementDAO {
	//회원가입 
	public void create(JoinMemberInfoVO joinMember) throws Exception;

//	//회원정보
//	public void read() throws Exception; 
//	//회원삭제
//	public void delete() throws Exception;
//	//회원정보수정
//	public void update() throws Exception;
	
}
