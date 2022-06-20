package com.oracle.S20220601.dao.jh;

import java.util.List;

import com.oracle.S20220601.model.jh.Chat;

public interface ChatDao {

	String userName(int mem_num);

	int insertChat(Chat chat);

	int deleteChat(int mem_num);

	List<Chat> listChat(Chat chat);

}
