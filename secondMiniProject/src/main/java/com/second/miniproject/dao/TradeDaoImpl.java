package com.second.miniproject.dao;

import java.util.List;

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
	public List<Trade> tradeBoardList() {

		return sqlSession.selectList(NAME_SPACE + ".tradeBoardList");
	}

	@Override
	public Trade getTradeBoard(int ucno) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getTradeBoard", ucno);
	}

	@Override
	public void insertTradeBoard(Trade trade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTradeBoard(Trade trade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTradeBoard(int ucno) {
		// TODO Auto-generated method stub
		
	}

}
