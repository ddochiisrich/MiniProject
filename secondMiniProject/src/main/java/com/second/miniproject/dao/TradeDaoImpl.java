package com.second.miniproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.second.miniproject.domain.Trade;

@Repository
public class TradeDaoImpl implements TradeDao {
	
	private final String NAME_SPACE = "com.second.miniproject.mapper.TradeBoardMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Trade getTradeBoard(int ucno) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getTradeBoard", ucno);
	}

	@Override
	public void insertTradeBoard(Trade trade) {
		sqlSession.insert(NAME_SPACE + ".insertTradeBoard", trade);
		
	}

	@Override
	public void updateTradeBoard(Trade trade) {
		sqlSession.update(NAME_SPACE + ".updateTradeBoard", trade);
		
	}

	@Override
	public void deleteTradeBoard(int ucno) {
		sqlSession.delete(NAME_SPACE + ".deleteTradeBoard", ucno);
		
	}

	@Override
	public List<Trade> tradeBoardList(int startRow, int num, String type, String keyword) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);
		return sqlSession.selectList(NAME_SPACE + ".tradeBoardList", params);
	}

	@Override
	public int getBoardCount(String type, String keyword) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount");
	}

	@Override
	public void incrementReadCount(int ucno) {
	
		sqlSession.update(NAME_SPACE + ".incrementReadCount", ucno);
		
	}

}
