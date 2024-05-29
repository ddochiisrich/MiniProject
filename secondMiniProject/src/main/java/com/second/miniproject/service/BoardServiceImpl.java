package com.second.miniproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.miniproject.dao.BoardDao;
import com.second.miniproject.domain.Board;

@Service
public class BoardServiceImpl implements BoardService{
	
	// BoardDao 주입
	@Autowired
	private BoardDao boardDao;

	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);
	}
}