package com.oracle.S20220601.service.js;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.js.ProfileDao;
import com.oracle.S20220601.model.Profile;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao pd;

	// loginCheck 이후 세션에 mem_num 담음
	@Override
	public String loginCheck(Profile profile, HttpSession session) {
		System.out.println("----------- ProfileServiceImpl Start -----------");
		String name = pd.loginCheck(profile);
		
		// profile안있는 이름, 비번을 가지고 DB에 들어가서 mem_num과 grade를 가져와야 함
		
		if(name != null) { // 세션 변수 저장
			session.setAttribute("mem_num", 10);	// 현재 0
			session.setAttribute("grade", 1);	// 현재 null
			session.setAttribute("name", name);	// name 빼줘			
		}
		
		return name;
	}

	// 로그아웃시 세션 끊음
	@Override
	public void logout(HttpSession session) {
		session.invalidate();		
	}

	// 아이디 중복 확인
	@Override
	public int idCheck(String id) {
		System.out.println("----------- idCheck Start -----------");
		int cnt = pd.idCheck(id);
		return cnt;
	}
	
	

}
