package com.second.miniproject.service;

import java.util.List;
import java.util.Map;

import com.second.miniproject.domain.Trade;

public interface TradeBoardService {	
	
	public abstract Map<String, Object> tradeBoardList(int pageNum, String type, String keyword);

	public abstract Trade getTradeBoard(int ucno, boolean isCount);

	public abstract void insertTradeBoard(Trade trade);

	public abstract void updateTradeBoard(Trade trade);

	public abstract void deleteTradeBoard(int ucno);
	
	public abstract int getBoardCount(String type, String keyword);
	
}
