package com.oracle.S20220601.dao.js;

import com.oracle.S20220601.model.Profile;

public interface ProfileDao {

	String loginCheck(Profile profile);

	int    idCheck(String id);



}
