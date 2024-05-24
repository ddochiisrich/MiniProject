package com.second.miniproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BricksController {

	@GetMapping("/main")
	public String BricksMain(Model model) {
		model.addAttribute("msg", "이건 메인페이지다 이말이야!!!!!!!!!!");
		
		return "BricksMain";
	}
	
}
