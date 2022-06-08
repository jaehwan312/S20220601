package com.oracle.S20220601.dao.js;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Profile;


@Repository
public class ProfileDaoImpl implements ProfileDao {

	@Autowired
	private SqlSession session;
	

	@Override
	public Profile loginCheck(Profile profile) {
		System.out.println("----------- ProfileDaoImpl Start -----------");
		profile =  session.selectOne("loginCheck", profile);
		// grade, mem_num 값 확인 완료 (로그인성공 시에만 뜸 -> 실패하면 null 오류)
		return profile;
	}
	

	@Override
	public int idCheck(String id) {
		int cnt = session.selectOne("idCheck", id);
		return cnt;
	}


	
	



}
