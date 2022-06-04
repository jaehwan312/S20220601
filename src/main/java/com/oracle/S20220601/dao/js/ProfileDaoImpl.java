package com.oracle.S20220601.dao.js;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Profile;


@Repository
public class ProfileDaoImpl implements ProfileDao {

	@Autowired
	private SqlSession session;

	@Override
	public String loginCheck(Profile profile) {
		System.out.println("----------- ProfileDaoImpl Start -----------");
		
		return session.selectOne("loginCheck", profile);
	}

	@Override
	public int idCheck(String id) {
		int cnt = session.selectOne("idCheck", id);
		return cnt;
	}
	
	



}
