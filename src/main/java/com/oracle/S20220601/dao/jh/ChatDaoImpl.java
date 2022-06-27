package com.oracle.S20220601.dao.jh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.jh.Chat;


@Repository
public class ChatDaoImpl implements ChatDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public String userName(int mem_num) {
		String resultStr="";
		try {
			resultStr = session.selectOne("jhUserName", mem_num);
		} catch (Exception e) {
			System.out.println("ChatDaoImpl userName Exception->"+e.getMessage());
		}
		return resultStr;
	}

	@Override
	public int insertChat(Chat chat) {
		int result = 0;
		try {
			result = session.insert("jhInsertChat", chat);
		} catch (Exception e) {
			System.out.println("ChatDaoImpl userName Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int deleteChat(int mem_num) {
		int result = 0;
		try {
			result = session.insert("jhDeleteChat", mem_num);
		} catch (Exception e) {
			System.out.println("ChatDaoImpl deleteChat Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public Chat getChatting(String mem_num) {
		Chat chatting = null;
		try {
			chatting = session.selectOne("jhSelectChatting", Integer.parseInt(mem_num));
		} catch (Exception e) {
			System.out.println("ChatDaoImpl getChatting Exception->"+e.getMessage());
		}
		return chatting;
	}

	@Override
	public Profile getChatUserName(String mem_num) {
		Profile chatUserName = null;
		try {
			chatUserName = session.selectOne("jhSelUserName", Integer.parseInt(mem_num));
		} catch (Exception e) {
			System.out.println("ChatDaoImpl getChatUserName Exception->"+e.getMessage());
		}
		return chatUserName;
	}



}
