package com.oracle.S20220601.dao.js;

import javax.servlet.http.HttpSession;

import com.oracle.S20220601.model.Profile;

public interface ProfileDao {

	Profile loginCheck(Profile profile);

	int    idCheck(String id);

	int    insert(Profile profile);

	int    getMem_numSeq();






}
