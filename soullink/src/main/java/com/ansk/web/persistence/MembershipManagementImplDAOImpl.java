package com.ansk.web.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ansk.web.domain.JoinMemberInfoVO;

@Repository
public class MembershipManagementImplDAOImpl implements MembershipManagementDAO{
	
	private SqlSession sqlSession;
	private static String namespace = "com.ansk.web.mappers.memberMapper";
	
	@Override
	public void create(JoinMemberInfoVO joinMember) throws Exception {
		sqlSession.insert(namespace + ".create", joinMember);
	}

}
