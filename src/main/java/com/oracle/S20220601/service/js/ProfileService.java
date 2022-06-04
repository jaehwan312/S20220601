package com.oracle.S20220601.service.js;

import javax.servlet.http.HttpSession;

import com.oracle.S20220601.model.Profile;

public interface ProfileService {

	String loginCheck(Profile profile, HttpSession session);

	void   logout(HttpSession session);

	int    idCheck(String id);



}
