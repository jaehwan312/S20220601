package com.oracle.S20220601.service.js;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.js.ProfileDao;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Search;

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


	@Override
	public int updateInfo(Profile profile) {
		System.out.println("------------ Service updateInfo -------------");
		int result = pd.updateInfo(profile);
		return result;
	}


	@Override
	public int updatePhoto(Profile profile) {
		int result = pd.updatePhoto(profile);
		return result;
	}


	@Override
	public String pwCheck(Profile profile) {
		String result = pd.pwCheck(profile);
		return result;
	}


	@Override
	public int userSleepUpdate(Profile profile) {
		int result = pd.userSleepUpdate(profile);
		return result;
	}


	@Override
	public String gradeCheck(Profile profile) {
		System.out.println("------------ service gradeCheck -------------");
		String grade = pd.gradeCheck(profile);
		return grade;
	}

	@Override
	public int total() {
		System.out.println("ProfileServiceImpl Start total..." );
		int totCnt = pd.total();
		System.out.println("ProfileServiceImpl total totCnt->"+totCnt );
		return totCnt;
	}


	@Override
	public List<Profile> profileList(Profile profile) {
		List<Profile> profileList = null;
		System.out.println("ProfileServiceImpl Start..." );
		profileList = pd.profileList(profile);
		System.out.println("ProfileServiceImpl profileList.size()->" +profileList.size());
		return profileList;
	}


	@Override
	public int totalKeyword(Profile profile) {
		System.out.println("ProfileServiceImpl totalKeyword Start..." );
		int totCnt = pd.totalKeyword(profile);
		System.out.println("ProfileServiceImpl totalKeyword totCnt->"+totCnt );
		return totCnt;
	}


	@Override
	public List<Profile> listProfileKeyword(Profile profile) {
		List<Profile> listProfileKeyword = null;
		System.out.println("ProfileServiceImpl listProfileKeyword Start..." );
		listProfileKeyword = pd.listProfileKeyword(profile);
		System.out.println("ProfileServiceImpl listProfileKeyword.size()->" +listProfileKeyword.size());
		return listProfileKeyword; 
	}


	@Override
	public Profile updateUser(Profile profile) {
		Profile result = pd.updateUser(profile);
		return result;
	}


	@Override
	public Profile updateAdmin(Profile profile) {
		Profile result = pd.updateAdmin(profile);
		return result;
	}


	@Override
	public List<Profile> userSleepList(Profile profile) {
		System.out.println("ProfileServiceImpl Start..." );
		List<Profile> userSleepList = pd.userSleepList(profile);
		System.out.println("ProfileServiceImpl userSleepList.size()->" +userSleepList.size());
		return userSleepList;
	}


	@Override
	public int total1() {
		System.out.println("ProfileServiceImpl Start total1..." );
		int totCnt = pd.total1();
		System.out.println("ProfileServiceImpl total1 totCnt->"+totCnt );
		return totCnt;
	}


	@Override
	public String userCnt(Profile profile) {
		String result = pd.userCnt(profile);
		return result;
	}


	@Override
	public String sleepUserCnt(Profile profile) {
		String result = pd.sleepUserCnt(profile);
		return result;
	}


	@Override
	public String searchCnt(Search search) {
		String result = pd.searchCnt(search);
		return result;
	}


	@Override
	public String storeCnt(Host host) {
		String result = pd.storeCnt(host);
		return result;
	}


	@Override
	public String stayCnt(Host host) {
		String result = pd.stayCnt(host);
		return result;
	}

	
	// 핸드폰 중복 확인
	@Override
	public int phnoeCheck(String phone) {
		System.out.println("----------- phoneCheck Start -----------");
		int cnt = pd.phoneCheck(phone);
		return cnt;
	}



 



	
	
	
	
	

}
