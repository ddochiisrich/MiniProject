package com.second.miniproject.ajax;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.second.miniproject.service.TradeBoardService;

@Controller
public class TradeAjaxController {
	
	@Autowired
	private TradeBoardService tradeBoardService;
	
	@RequestMapping(value = "used_car_board.ajax", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> TradeBoardList(
	        @RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
	        @RequestParam(value="type", required=false, defaultValue="null") String type,
	        @RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
	    
	    Map<String, Object> modelMap = tradeBoardService.tradeBoardList(pageNum, type, keyword);

	    // 페이징 정보 계산
	    int totalRecords = tradeBoardService.getBoardCount(type, keyword);
	    int recordsPerPage = 10; // 페이지당 레코드 수
	    int totalPages = (totalRecords + recordsPerPage - 1) / recordsPerPage;
	    int pageGroup = 10; // 페이지 그룹 크기
	    int startPage = ((pageNum - 1) / pageGroup) * pageGroup + 1;
	    int endPage = Math.min(startPage + pageGroup - 1, totalPages);

	    
	    // 페이징 정보 추가
	    modelMap.put("startPage", startPage);
	    modelMap.put("endPage", endPage);
	    modelMap.put("currentPage", pageNum);
	    modelMap.put("pageGroup", pageGroup);
	    modelMap.put("pageCount", totalPages);
	    modelMap.put("count", totalRecords);

	    return modelMap;
	}

	
}
