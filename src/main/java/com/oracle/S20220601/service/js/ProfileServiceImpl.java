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
		if(name != null) { // 세션 변수 저장
			session.setAttribute("mem_num", profile.getMem_num());
			session.setAttribute("name", name);			
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
