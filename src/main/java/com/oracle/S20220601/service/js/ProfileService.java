package com.oracle.S20220601.service.js;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.Profile;

public interface ProfileService {

	Profile loginCheck(Profile profile, HttpSession session);

	void   logout(HttpSession session);

	int    idCheck(String id);

	int    signUp(Profile profile);

	String searchId(String name, String phone);

	Profile selectProfile(int mem_num); //로그인한 회원 정보 가져오기





}
