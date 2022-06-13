package com.oracle.S20220601.dao.js;

import org.apache.ibatis.annotations.Param;

import com.oracle.S20220601.model.Profile;

public interface ProfileDao {

	Profile loginCheck(Profile profile);

	int    idCheck(String id);

	int    insert(Profile profile);

	int    getMem_numSeq();

	String searchId(@Param("name") String name,@Param("phone") String phone);

	Profile selectProfile(int mem_num);//로그인한 회원 정보 가져오기






}
