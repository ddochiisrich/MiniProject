package com.second.miniproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.second.miniproject.domain.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	private final String NAME_SPACE = "com.second.miniproject.mapper.BoardMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertBoard(Board board) {
		sqlSession.insert(NAME_SPACE + ".insertBoard", board);
	}

	
}
