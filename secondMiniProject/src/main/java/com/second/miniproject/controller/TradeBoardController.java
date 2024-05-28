package com.second.miniproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.second.miniproject.Board;
import com.second.miniproject.domain.Trade;
import com.second.miniproject.service.TradeBoardService;

@Controller
public class TradeBoardController {

	@Autowired
	private TradeBoardService tradeBoardService;
	
	@RequestMapping("/DeleteTradeBoardProcess")
	public String deleteTradeBoard(int ucno, RedirectAttributes reAttrs, @RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum, @RequestParam(value="type", required=false, defaultValue="null") String type, @RequestParam(value="keyword", required=false, defaultValue="null") String keyword) throws Exception  {
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		tradeBoardService.deleteTradeBoard(ucno);
		
		reAttrs.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);
		}
		
		reAttrs.addAttribute("pageNum", pageNum);
		return "redirect:used_car_board";		
	}
	
	
	@RequestMapping("/used_car_board")
	public String TradeBoardList(Model model, @RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum, @RequestParam(value="type", required=false, defaultValue="null") String type, @RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
		Map<String, Object> modelMap = tradeBoardService.tradeBoardList(pageNum, type, keyword);
		int count = tradeBoardService.getBoardCount(type, keyword);
		
		model.addAllAttributes(modelMap);
		model.addAttribute("count", count);
				
		return "usedCarTradeBoard";
	}
	
	@RequestMapping("/TradeBoardDetail")
	public String TradeBoardDetail(Model model, int ucno, @RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum, @RequestParam(value="type", required=false, defaultValue="null") String type, @RequestParam(value="keyword", required=false, defaultValue="null") String keyword) throws Exception {
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		Trade trade = tradeBoardService.getTradeBoard(ucno, true);
		
		model.addAttribute("trade", trade);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		return "usedCarTradeDetail";
	}
	
	@RequestMapping("/registcar")
	public String TradeBoardWrite() {
	
		return "usedCarTradeWrite";
	}
	
	@RequestMapping("/registProcess")
	public String insertTradeBoard(Trade trade, Model model, String cseller_contact1, String cseller_contact2, String cseller_contact3) {
		
		trade.setCsellerContact(cseller_contact1 + "-" + cseller_contact2 + "-" + cseller_contact3); 
		
		tradeBoardService.insertTradeBoard(trade);
		
		return "redirect:used_car_board";		
	}
	
	@RequestMapping("/tradeCarUpdate")
	public String updateTradeBoard(Model model, int ucno, @RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum, @RequestParam(value="type", required=false, defaultValue="null") String type, @RequestParam(value="keyword", required=false, defaultValue="null") String keyword) throws Exception {
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		Trade trade = tradeBoardService.getTradeBoard(ucno, false);
		
		model.addAttribute("trade" ,trade);
		model.addAttribute("pageNum" ,pageNum);
		model.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
				
		return "usedCarTradeUpdate";
	}
	
	@RequestMapping("/tradeUpdateProcess")
	public String updateTradeBoardProcess(Trade trade, Model model, int ucno, String cseller_contact1, String cseller_contact2, String cseller_contact3, RedirectAttributes reAttrs, @RequestParam(value="pageNum", required=false, defaultValue="1")int pageNum, @RequestParam(value="type", required=false, defaultValue="null") String type, @RequestParam(value="keyword", required=false, defaultValue="null") String keyword) throws Exception {
		
		trade.setCsellerContact(cseller_contact1 + "-" + cseller_contact2 + "-" + cseller_contact3); 
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		tradeBoardService.updateTradeBoard(trade);
		
		reAttrs.addAttribute("searchOption", searchOption);

		if(searchOption) {

			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);
		}
		
		reAttrs.addAttribute("pageNum", pageNum);
		
		return "redirect:used_car_board";
	}
	
}
