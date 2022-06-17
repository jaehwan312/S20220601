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


	@Override
	public String searchId(Profile profile) {
		System.out.println("----------------- Service SearchId Start --------------");
		String result = "";
		
		try {
			result = pd.searchId(profile);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public int emailCheck(Profile profile) {
		System.out.println("----------------- Service emailCheck Start --------------");
		int cnt = pd.emailCheck(profile);
		return cnt;
	}


	@Override
	public void pwSave(Profile profile) {
		pd.pwSave(profile);
	}
	
	
//	로그인한 회원 정보 가져오기 by 김인헌
	@Override
	public Profile selectProfile(int mem_num) {
		
		System.out.println("----------- ProfileServiceImpl selectProfile Start -----------");
		
		Profile selectProfile = pd.selectProfile(mem_num);
		
		return selectProfile;
	}
//	로그인한 회원 정보 가져오기	




	
	
	
	
	

}
