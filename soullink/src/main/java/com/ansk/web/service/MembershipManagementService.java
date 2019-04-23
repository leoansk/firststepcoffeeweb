package com.ansk.web.service;

import java.util.Map;

import com.ansk.web.domain.JoinMemberInfoVO;

public interface MembershipManagementService {
	public void create(JoinMemberInfoVO memberinfo) throws Exception;
	//중복 id 체크
	public int selectUserId(Map<String,Object> map ) throws Exception;
}
