package com.second.miniproject.dao;

import java.util.List;

import com.second.miniproject.domain.Board;
import com.second.miniproject.domain.Community;

public interface BoardDao {

	// 글쓰기
	void insertBoard(Board board);
	
	// community
	void insertCommunity(Community commu);
	public abstract List<Board> boardList(
			int startRow, int num, String type, String keyword);
	// paging 처리하는 
	public abstract int getBoardCount(String type, String keyword);
}
