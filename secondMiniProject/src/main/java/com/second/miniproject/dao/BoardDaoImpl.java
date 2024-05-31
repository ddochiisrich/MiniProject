package com.second.miniproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.second.miniproject.domain.Board;
import com.second.miniproject.domain.Community;

@Repository
public class BoardDaoImpl implements BoardDao {

	private final String NAME_SPACE = "com.second.miniproject.mapper.BoardMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertBoard(Board board) {
		sqlSession.insert(NAME_SPACE + ".insertBoard", board);
	}

	@Override
	public void insertCommunity(Community commu) {
		sqlSession.insert(NAME_SPACE + ".insertCommunity", commu);
	}

	@Override
	public List<Board> boardList(int startRow, int num, String type, String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".boardList", params);
	}

	@Override
	public int getBoardCount(String type, String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();		
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", params);
	}
}
