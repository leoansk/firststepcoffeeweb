package com.ansk.web.persistence;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ansk.web.domain.JoinMemberInfoVO;

@Repository
public class MembershipManagementImplDAOImpl implements MembershipManagementDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.ansk.web.mappers.memberMapper";
	
	@Override
	public void create(JoinMemberInfoVO joinMember) throws Exception {
		sqlSession.insert(namespace + ".create", joinMember);
	}

	@Override
	@SuppressWarnings("unchecked")
	public int selectUserId(Map<String, Object> map) throws Exception {
		System.out.println("시작?");
		Map<String, Object> resultMap = (Map<String, Object>) sqlSession.selectOne(namespace + ".selectUserId", map);
		System.out.println("여기까지 옴?");
		
		//키 값을 모를 경우 사용
		Set set = resultMap.keySet();
		Iterator iterator = set.iterator();
		
		while(iterator.hasNext()){
			  String key = (String)iterator.next();
			  System.out.println("hashMap Key : " + key);
		}
		//맵에 있는 값을 string으로 바꾼 후 다시 int형으로 바꿔줌
		int result = Integer.valueOf(String.valueOf(resultMap.get("result")));
		
		return result;
	}
}
