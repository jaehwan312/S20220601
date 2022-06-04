package com.oracle.S20220601.controller.jh;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@GetMapping(value = "admMain")
	public String admMain() {
		logger.info("AdminController admMain Start...");
		
		return "jh/admMain";
	}
}






	
	
	
