package com.oracle.S20220601.service.jh;

import com.oracle.S20220601.model.Chat;

public interface ChatService {

	String userName(int mem_num);

	int insertChat(Chat chat);

	int deleteChat(int mem_num);


}
