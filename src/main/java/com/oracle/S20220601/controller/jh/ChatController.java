package com.oracle.S20220601.controller.jh;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.dao.jh.ChatRoom;
import com.oracle.S20220601.dao.jh.ChatRoomRepository;
import com.oracle.S20220601.model.jh.Chat;
import com.oracle.S20220601.model.jh.ChatRoomForm;
import com.oracle.S20220601.service.jh.ChatService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatService cs;
	
    private final ChatRoomRepository chatRoomRepository;
    // 관리자 페이지 리스트 목록
    @GetMapping("/chatList")
    public String rooms(Model model){
        model.addAttribute("rooms",chatRoomRepository.findAllRoom());
        return "jh/rooms";
    }

    // 관리자가 아이디방에 접속
    @GetMapping("/rooms/{id}")
    public String room(@PathVariable String id, Model model){
        ChatRoom room = chatRoomRepository.findRoomById(id);
        model.addAttribute("room",room);
        return "jh/room";
    }
    
    // 유저가 관리자 채팅 리스트로 갈때
    @PostMapping("/room/new")
    public String makeRoom(ChatRoomForm mem_num, Model model){
        ChatRoom chatroom = chatRoomRepository.createChatRoom(mem_num.getMem_num());
        String roomId = chatroom.getRoomId();
        model.addAttribute("roomId", roomId);
        return "redirect:/rooms/"+roomId;
    }
    
    @ResponseBody
	@RequestMapping(value = "getUserName", produces = "application/text;charset=UTF-8")
	public String getUserName(int mem_num, Model model) {
		String name = cs.userName(mem_num);
		return name;
	}
    
    @ResponseBody
	@RequestMapping(value = "insertChat", method = RequestMethod.POST)
	public void insertChat(Chat chat, Model model) {
		int result = cs.insertChat(chat);
	}
    
    @ResponseBody
	@RequestMapping(value = "deleteChat")
	public void deleteChat(int mem_num, Model model) {
		System.out.println("mem_num->"+mem_num);
		int result = cs.deleteChat(mem_num);
	}
}