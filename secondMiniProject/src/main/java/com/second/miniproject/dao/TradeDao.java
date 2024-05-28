package com.second.miniproject.dao;

import java.util.List;

import com.second.miniproject.domain.Trade;

public interface TradeDao {

	public abstract List<Trade> tradeBoardList(int startRow, int num, String type, String keyword);
	
	public abstract int getBoardCount(String type, String keyword);
	
	public abstract Trade getTradeBoard(int ucno);
	
	public abstract void insertTradeBoard(Trade trade);
	
	public abstract void updateTradeBoard(Trade trade);
	
	public abstract void deleteTradeBoard(int ucno);
	
	public abstract void incrementReadCount(int ucno);
	
}
