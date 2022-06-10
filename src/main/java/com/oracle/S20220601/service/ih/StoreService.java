package com.oracle.S20220601.service.ih;

import com.oracle.S20220601.model.ih.HostStore;

public interface StoreService {
	HostStore       storeRead(int host_num);          //식당정보확인
	int             storeInsert(HostStore hostStore); //식장정보등록
}		
