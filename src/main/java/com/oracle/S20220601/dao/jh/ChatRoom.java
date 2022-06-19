package com.oracle.S20220601.dao.jh;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oracle.S20220601.model.jh.Chat;
import com.oracle.S20220601.model.jh.MessageType;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.util.*;

@Getter @Setter
public class ChatRoom {
    private String roomId;
    private String mem_num;
    private Set<WebSocketSession> sessions = new HashSet<>();

    public static ChatRoom create(String mem_num){
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.roomId = UUID.randomUUID().toString();
        chatRoom.mem_num = mem_num;
        return chatRoom;
    }

    public void handleMessage(WebSocketSession session, Chat chatMessage,
                              ObjectMapper objectMapper) throws IOException {
        if(chatMessage.getType() == MessageType.ENTER){
            if((String)chatMessage.getGrade() == "1") {
            	sessions.add(session);
                chatMessage.setMessage(chatMessage.getGrade()+"관리자가 입장하였습니다.");
                System.out.println("chatMessage.getGrade()->"+chatMessage.getGrade());
            } else {
            	sessions.add(session);
                chatMessage.setMessage(chatMessage.getGrade()+"1:1 채팅 문의가 시작되었습니다");
                System.out.println("chatMessage.getGrade()->"+chatMessage.getGrade());
            }
        }
        else if(chatMessage.getType() == MessageType.LEAVE){
            sessions.remove(session);
            chatMessage.setMessage(chatMessage.getGrade()+chatMessage.getWriter()+"님이 퇴장하셨습니다.");
        }
        else{
            chatMessage.setMessage(chatMessage.getGrade()+chatMessage.getMessage());
        }
        send(chatMessage,objectMapper);
    }

    private void send(Chat chatMessage, ObjectMapper objectMapper) throws IOException {
        TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMessage()));
        for(WebSocketSession sess : sessions){
            sess.sendMessage(textMessage);
        }
    }
}