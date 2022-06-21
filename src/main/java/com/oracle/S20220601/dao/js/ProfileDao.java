package com.oracle.S20220601.dao.js;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oracle.S20220601.model.Profile;

public interface ProfileDao {

	Profile 		loginCheck(Profile profile);
	int    			idCheck(String id);
	int    			insert(Profile profile);
	int    			getMem_numSeq();
	String 			searchId(Profile profile);
	int    			emailCheck(Profile profile);
	void   			pwSave(Profile profile);
	Profile 		selectProfile(int mem_num);//로그인한 회원 정보 가져오기
	int 			updateInfo(Profile profile);
	int     		updatePhoto(Profile profile);
	String  		pwCheck(Profile profile);
	int     		userSleepUpdate(Profile profile);
	String  		gradeCheck(Profile profile);
	int     		total();
	List<Profile>	profileList(Profile profile);
	int             totalKeyword(Profile profile);
	List<Profile>   listProfileKeyword(Profile profile);
	Profile         updateUser(Profile profile);
	Profile         updateAdmin(Profile profile);







}
