package com.second.miniproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.second.miniproject.service.CarInfoService;

@Controller
public class CarInfoController {

	@Autowired
	private CarInfoService carInfoService;
	
}
