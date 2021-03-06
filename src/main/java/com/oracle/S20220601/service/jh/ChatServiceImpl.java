package com.oracle.S20220601.service.jh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jh.ChatDao;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.jh.Chat;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao cd;
	
	@Override
	public String userName(int mem_num) {
		return cd.userName(mem_num);
	}

	@Override
	public int insertChat(Chat chat) {
		int result = 0;
		result = cd.insertChat(chat);
		return result;
	}

	@Override
	public int deleteChat(int mem_num) {
		int result = 0;
		result = cd.deleteChat(mem_num);
		return result;
	}

	@Override
	public Chat getChatting(String mem_num) {
		Chat chatting = cd.getChatting(mem_num);
		return chatting;
	}

	@Override
	public Profile getChatUserName(String mem_num) {
		Profile chatUserName = cd.getChatUserName(mem_num);
		return chatUserName;
	}

}
