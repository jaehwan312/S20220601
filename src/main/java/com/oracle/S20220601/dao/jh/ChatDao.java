package com.oracle.S20220601.dao.jh;

import com.oracle.S20220601.model.Chat;

public interface ChatDao {

	String userName(int mem_num);

	int insertChat(Chat chat);

}
