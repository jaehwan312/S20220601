package com.oracle.S20220601.controller.jh;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.S20220601.model.Chat;
import com.oracle.S20220601.service.jh.ChatService;

@RestController
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatService cs;
	
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
	
	@RequestMapping(value = "getUserName", produces = "application/text;charset=UTF-8")
	public String getUserName(int mem_num, Model model) {
		String name = cs.userName(mem_num);
		return name;
	}
	
	@RequestMapping(value = "insertChat", method = RequestMethod.POST)
	public void insertChat(Chat chat, Model model) {
		int result = cs.insertChat(chat);
	}
	
	@RequestMapping(value = "deleteChat")
	public void deleteChat(int mem_num, Model model) {
		System.out.println("mem_num->"+mem_num);
		int result = cs.deleteChat(mem_num);
	}
	
}
