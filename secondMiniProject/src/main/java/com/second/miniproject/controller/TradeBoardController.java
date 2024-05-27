package com.second.miniproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.miniproject.Board;
import com.second.miniproject.domain.Trade;
import com.second.miniproject.service.TradeBoardService;

@Controller
public class TradeBoardController {

	@Autowired
	private TradeBoardService tradeBoardService;
	
	@RequestMapping("/used_car_board")
	public String TradeBoardList(Model model) {
		List<Trade> tList = tradeBoardService.tradeBoardList();
		
		model.addAttribute("tList", tList);
				
		return "usedCarTradeBoard";
	}
	
	@RequestMapping("/TradeBoardDetail")
	public String TradeBoardDetail(Model model, int ucno) {
		
		Trade trade = tradeBoardService.getTradeBoard(ucno);
		
		model.addAttribute("trade", trade);
		
		return "usedCarTradeDetail";
	}
	
	@RequestMapping("/registcar")
	public String TradeBoardWrite() {
	
		return "usedCarTradeWrite";
	}
	
}
