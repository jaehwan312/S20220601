package com.oracle.S20220601.service.js;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Search;

public interface ProfileService {

	Profile 		loginCheck(Profile profile, HttpSession session);
	void 			logout(HttpSession session);
	int 			idCheck(String id);
	int 			signUp(Profile profile);
	String 			searchId(Profile profile);
	int 			emailCheck(Profile profile);
	void 			pwSave(Profile profile);
	Profile 		selectProfile(int mem_num); // 로그인한 회원 정보 가져오기
	int 			updateInfo(Profile profile);
	int     		updatePhoto(Profile profile);
	String  		pwCheck(Profile profile);
	int     		userSleepUpdate(Profile profile);
	String 			gradeCheck(Profile profile);
	int     		total();
	List<Profile> 	profileList(Profile profile);
	int             totalKeyword(Profile profile);
	List<Profile>   listProfileKeyword(Profile profile);
	Profile         updateUser(Profile profile);
	Profile         updateAdmin(Profile profile);
	List<Profile>   userSleepList(Profile profile);
	int             total1();
	String          userCnt(Profile profile);
	String          sleepUserCnt(Profile profile);
	String          searchCnt(Search search);
	String          storeCnt(Host host);
	String          stayCnt(Host host);
	int             phnoeCheck(String phone);
	
}
