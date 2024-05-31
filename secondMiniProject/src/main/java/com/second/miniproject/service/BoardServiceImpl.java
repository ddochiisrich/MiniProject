package com.second.miniproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.miniproject.dao.BoardDao;
import com.second.miniproject.domain.Board;
import com.second.miniproject.domain.Community;

@Service
public class BoardServiceImpl implements BoardService{
	
	private static final int PAGE_SIZE=10;
	private static final int PAGE_GROUP=5;
	
	// BoardDao 주입
	@Autowired
	private BoardDao boardDao;

	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);
	}

	@Override
	public void insetCommunity(Community commu) {
		boardDao.insertCommunity(commu);
	}

	@Override
	public Map<String, Object> boardList(int pageNum, String type, String keyword) {
		
		int currentPage = pageNum;
		
		int startRow = (currentPage -1) * PAGE_SIZE;
		List<Board> bList = boardDao.boardList(
				startRow, PAGE_SIZE, type, keyword);
				
		int listCount = boardDao.getBoardCount(type, keyword);
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = currentPage / PAGE_GROUP * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP -1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("communi", bList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
				
		// 검색인지 아닌지 판단하는 
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		modelMap.put("searchOption", searchOption);
		
		if(searchOption) {
			modelMap.put("type", type);
			modelMap.put("keyword", keyword);
		}
		
		return modelMap;
	}
}