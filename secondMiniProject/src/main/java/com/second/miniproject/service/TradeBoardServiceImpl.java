package com.second.miniproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.miniproject.dao.TradeDao;
import com.second.miniproject.domain.Trade;

@Service
public class TradeBoardServiceImpl implements TradeBoardService {

	@Autowired
	private TradeDao tradeDao;
	
	@Override
	public List<Trade> tradeBoardList() {
		
		return tradeDao.tradeBoardList();
	}

	@Override
	public Trade getTradeBoard(int ucno) {
		
		return tradeDao.getTradeBoard(ucno);
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
