package com.second.miniproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.second.miniproject.domain.MemberShip;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.second.miniproject.MemberMapper"; 

	@Override
	public MemberShip idCheck(String idcheck) {
		return null;
	}

	@Override
	public MemberShip getMember(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}

	@Override
	public void addMember(MemberShip member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
		
	}

	@Override
	public String memberPassCheck(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".memberPassCheck", id);
	}

	@Override
	public void updateMember(MemberShip member) {
		sqlSession.update(NAME_SPACE + ".updateMember", member);
		
	}

}

