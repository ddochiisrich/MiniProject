package com.second.miniproject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.second.miniproject.domain.Trade;
import com.second.miniproject.service.TradeBoardService;

@Controller
public class TradeBoardController {

	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private TradeBoardService tradeBoardService;
	
	@GetMapping("/fileDownload")
	public void download(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String fileName = request.getParameter("fileName");
		System.out.println("fileName : " + fileName);
		String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
		File file = new File(filePath, fileName);
		System.out.println("file.getName() : " + file.getName());
		
		response.setContentType("application/download; charset=UTF-8");
		response.setContentLength((int) file.length());
		
		fileName = URLEncoder.encode(file.getName(), "UTF-8");
		System.out.println("다운로드 fileName : " + fileName);

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		fis = new FileInputStream(file);

		FileCopyUtils.copy(fis, out);
		if(fis != null) {
			fis.close();
		}

		out.flush();
	}
	
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
	
	@PostMapping("/registProcess")
	public String insertTradeBoard(Trade trade, Model model, String cseller_contact1, String cseller_contact2, String cseller_contact3, HttpServletRequest request, @RequestParam(value="cimg1", required=false) MultipartFile multipartFile)throws IOException {
		
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		if(!multipartFile.isEmpty()) { 
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);

			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			File file = new File(filePath, saveName);
			
			System.out.println("insertBoard - newName : " + file.getName());

			multipartFile.transferTo(file);


			trade.setCimg(saveName);
		}
		
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
