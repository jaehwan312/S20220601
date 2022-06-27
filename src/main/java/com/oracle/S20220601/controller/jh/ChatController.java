package com.oracle.S20220601.controller.jh;

import java.util.List;

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
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Room;
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
    public String rooms(Chat chat, Model model){
    	List<ChatRoom> rooms = chatRoomRepository.findAllRoom();
    	for(ChatRoom rm : rooms) {
    		Chat chatting = cs.getChatting(rm.getMem_num());
    		rm.setMsg(chatting.getMsg());
    		rm.setMsg_time(chatting.getMsg_time());
    		Profile profile = cs.getChatUserName(rm.getMem_num());
    		rm.setName(profile.getName());
    	}
        model.addAttribute("rooms", rooms);
        return "jh/rooms";
    }
    
    // 관리자가 채팅창에 접속
    @GetMapping("/chatEnter")
    public String room(String id, Model model){
    	
        ChatRoom room = chatRoomRepository.findRoomById(id);
         model.addAttribute("room",room);
        return "jh/room";
    }
    
    // 유저가 채팅방을 만드는 매핑
    @PostMapping("/room/new")
    public String makeRoom(ChatRoomForm mem_num, Model model){
        ChatRoom chatroom = chatRoomRepository.createChatRoom(mem_num.getMem_num());
        String roomId = chatroom.getRoomId();
        model.addAttribute("roomId", roomId);
        return "redirect:/chatOpen/"+roomId;
    }
    
    // 유저가 채팅창에 접속
    @GetMapping("/chatOpen/{id}")
    public String chatOpen(@PathVariable String id, Model model){
        ChatRoom room = chatRoomRepository.findRoomById(id);
        model.addAttribute("room",room);
        return "jh/chat";
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