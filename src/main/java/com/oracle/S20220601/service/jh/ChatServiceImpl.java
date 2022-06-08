package com.oracle.S20220601.service.jh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jh.ChatDao;
import com.oracle.S20220601.model.Chat;

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

}
