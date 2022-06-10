package com.oracle.S20220601.dao.jh;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Chat;

@Repository
public class ChatDaoImpl implements ChatDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public String userName(int mem_num) {
		String resultStr="";
		try {
			resultStr = session.selectOne("jhUserName", mem_num);
			System.out.println("ChatDaoImpl userName resultStr"+resultStr);
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



}
