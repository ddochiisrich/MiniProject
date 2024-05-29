package com.second.miniproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.second.miniproject.domain.Board;
import com.second.miniproject.service.BoardService;

@Controller
public class BricksController {
	
	private static final String DEFAULT_PATH = "/resources/carimg/";
	
	// BoardService 주입
	@Autowired
	private BoardService boardService;

	@GetMapping("/main")
	public String BricksMain(Model model) {
		model.addAttribute("msg", "이건 메인페이지다 이말이야!!!!!!!!!!");
		
		return "BricksMain";
	}
	
	@PostMapping("/writeProcess")
	public String insertBoard(HttpServletRequest req,
			String cname, String cnumber, String km, String tire,
			String coolant, String battey, String wiper, String aircon,
			@RequestParam(value="file2") MultipartFile multipartFile) throws IOException {
		
		Board board = new Board();
		board.setCname(cname);
		board.setCnumber(cnumber);
		board.setKm(km);
		board.setTire(tire);
		board.setCoolant(coolant);
		board.setBattery(battey);
		board.setWiper(wiper);
		board.setAircon(aircon);
	
		if(!multipartFile.isEmpty()) { // 파일이 업로드 되었으면
			String realPath = req.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			File file = new File(realPath, saveName);
			System.out.println("insertBoard - newName : " + file.getName());
			
			multipartFile.transferTo(file);
			board.setFile2(saveName);
			
		}
		
		boardService.insertBoard(board);
		
		// 여기서 바로전에 insert한 board no 알아야 한다면 ?
		System.out.println("board no : " + board.getNo());
		
		return "redirect:BricksMain";
	}
	
}
