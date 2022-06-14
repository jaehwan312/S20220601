package com.oracle.S20220601.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oracle.S20220601.dao.jh.ChatRoom;
import com.oracle.S20220601.dao.jh.ChatRoomRepository;
import com.oracle.S20220601.model.jh.Chat;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class SocketHandler extends TextWebSocketHandler {
    private final ChatRoomRepository chatRoomRepository;
    private final ObjectMapper objectMapper;
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String msg = message.getPayload();
        Chat chat = objectMapper.readValue(msg,Chat.class);
        ChatRoom chatRoom = chatRoomRepository.findRoomById(chat.getChatRoomId());
        chatRoom.handleMessage(session,chat,objectMapper);
    }

}