package com.oracle.S20220601.controller.jh;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.dao.jh.ChatRoom;
import com.oracle.S20220601.dao.jh.ChatRoomRepository;
import com.oracle.S20220601.model.jh.Chat;
import com.oracle.S20220601.model.jh.ChatRoomForm;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
public class ChatController {
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

}
