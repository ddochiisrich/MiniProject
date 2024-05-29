package com.second.miniproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.miniproject.dao.TradeDao;
import com.second.miniproject.domain.Trade;

@Service
public class TradeBoardServiceImpl implements TradeBoardService {

	private final static int PAGE_SIZE = 10;
	private final static int PAGE_GROUP = 10;
	
	@Autowired
	private TradeDao tradeDao;
	
	@Override
	public Map<String, Object> tradeBoardList(int pageNum, String type, String keyword) {
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		listCount = tradeDao.getBoardCount(type, keyword);
//		System.out.println("listCount : " + listCount + ", type : " + type + ", keyword : " + keyword);
		List<Trade> tradeBoardList = tradeDao.tradeBoardList(startRow, PAGE_SIZE, type, keyword);
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		modelMap.put("tradeBoardList", tradeBoardList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		modelMap.put("searchOption", searchOption);
		
		if(searchOption) {
			modelMap.put("type", type);
			modelMap.put("keyword", keyword);
		}
				
		return modelMap;
	}

	@Override
	public Trade getTradeBoard(int ucno, boolean isCount) {
		
		if(isCount) {
			tradeDao.incrementReadCount(ucno);
		}
		return tradeDao.getTradeBoard(ucno);
	}

	@Override
	public void insertTradeBoard(Trade trade) {
		tradeDao.insertTradeBoard(trade);

	}

	@Override
	public void updateTradeBoard(Trade trade) {
		tradeDao.updateTradeBoard(trade);

	}

	@Override
	public void deleteTradeBoard(int ucno) {
		tradeDao.deleteTradeBoard(ucno);

	}

	@Override
	public int getBoardCount(String type, String keyword) {
		
		return tradeDao.getBoardCount(type, keyword);
		
	}
	

}
