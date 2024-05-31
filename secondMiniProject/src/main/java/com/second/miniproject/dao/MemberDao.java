package com.second.miniproject.dao;

import com.second.miniproject.domain.MemberShip;

public interface MemberDao {
	
	// idcheck 하는 메서드
	public abstract MemberShip idCheck(String idcheck);
	
	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 체크하는 메서드
	public String memberPassCheck(String id);
	
	// 회원 정보를 member 테이블에서 수정하는 메서드
	public void updateMember(MemberShip member);

	// id에 해당하는 회원 정보를 DB 테이블에서 읽어와 반환하는 메서드
	public abstract MemberShip getMember(String id);
	
	// 회원 가입 - 회원 정보를 DB 테이블에 저장하는 메서드
	public abstract void addMember(MemberShip member);
}
