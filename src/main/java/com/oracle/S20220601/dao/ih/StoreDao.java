package com.oracle.S20220601.dao.ih;

import java.util.List;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.ih.HostStore;

public interface StoreDao {
	HostStore       storeRead(int host_num);          //식당정보확인
	int             storeInsert(HostStore hostStore); //식장정보등록
}
