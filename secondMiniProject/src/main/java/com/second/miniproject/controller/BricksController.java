package com.second.miniproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.second.miniproject.service.CarInfoService;

@Controller
public class BricksController {

	private CarInfoService carInfoService;
	
	@GetMapping("/main")
	public String BricksMain(Model model) {

		return "BricksMain";
	}
	
}
