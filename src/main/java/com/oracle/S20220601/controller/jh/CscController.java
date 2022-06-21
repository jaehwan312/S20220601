package com.oracle.S20220601.controller.jh;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CscController {
	private static final Logger logger = LoggerFactory.getLogger(CscController.class);
	
	@GetMapping(value = "tosContent")
	public String TOSContent() {
		return "tosContent";
	}
	
	@GetMapping(value = "faqContent")
	public String FAQContent() {
		return "faqContent";
	}
}
