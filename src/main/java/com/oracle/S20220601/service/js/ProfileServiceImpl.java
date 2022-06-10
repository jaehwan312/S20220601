package com.oracle.S20220601.service.js;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.dao.js.ProfileDao;
import com.oracle.S20220601.model.Profile;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao pd;

	// loginCheck 이후 세션에 mem_num 담음
	@Override
	public Profile loginCheck(Profile profile, HttpSession session) {
		System.out.println("----------- ProfileServiceImpl loginCheck Start -----------");
		profile = pd.loginCheck(profile);
		if(profile != null) { // 세션 변수 저장
			session.setAttribute("mem_num", profile.getMem_num());
			session.setAttribute("grade",   profile.getGrade());
		}
		
		return profile;
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


	@Override
	public int signUp(Profile profile) {
		int mem_num = pd.getMem_numSeq();
		profile.setMem_num(mem_num);
		int rusult = pd.insert(profile);
		
		return rusult;
	}





	
	
	
	
	

}
