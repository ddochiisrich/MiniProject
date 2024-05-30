package com.second.miniproject.service;

import java.util.Map;

import com.second.miniproject.domain.Board;
import com.second.miniproject.domain.Community;

public interface BoardService {

	// 글쓰기
	void insertBoard(Board board);

	void insetCommunity(Community commu);
	public abstract Map<String, Object> boardList(
			int pageNum, String type, String keyword);
}
