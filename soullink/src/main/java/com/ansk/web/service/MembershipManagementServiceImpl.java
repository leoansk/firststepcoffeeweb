package com.ansk.web.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ansk.web.domain.JoinMemberInfoVO;
import com.ansk.web.persistence.MembershipManagementDAO;

@Service
public class MembershipManagementServiceImpl implements MembershipManagementService{
	
	@Inject
	private MembershipManagementDAO dao;
	
	@Override
	public void create(JoinMemberInfoVO memberinfo) throws Exception {
		dao.create(memberinfo);
	}

	@Override
	public int selectUserId(Map<String, Object> map) throws Exception {
		return dao.selectUserId(map);
	}

}
