package com.oracle.S20220601.controller.jh;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
//	@GetMapping(value = "chatList")
//	public String chatList() {
//		logger.info("ChatController chatList Start...");
//		
//		return "jh/chatList";
//	}
	
	@RequestMapping(value = "chat")
	public String chat() {
		logger.info("ChatController chat Start...");
		
		return "jh/chat";
	}
	
}
