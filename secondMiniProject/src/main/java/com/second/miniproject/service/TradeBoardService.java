package com.second.miniproject.service;

import java.util.List;

import com.second.miniproject.domain.Trade;

public interface TradeBoardService {

	public abstract List<Trade> tradeBoardList();

	public abstract Trade getTradeBoard(int ucno);

	public abstract void insertTradeBoard(Trade trade);

	public abstract void updateTradeBoard(Trade trade);

	public abstract void deleteTradeBoard(int ucno);

}
