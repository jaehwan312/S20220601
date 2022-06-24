package com.oracle.S20220601.service.ih;

import java.util.List;

import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.ih.HostStore;

public interface StoreService {
	HostStore       storeRead(int host_num);              //식당정보확인
	int             storeInsert(HostStore hostStore); 	  //식장정보등록
	int             storeUpdate(HostStore hostStore); 	  //식당정보 업데이트
	int				storePick(int mem_num, int host_num); //찜하기 확인
	List<HostStore> myStoreList(int mem_num);             //내 식당 등록정보
	int 			storeDeleteRequest(HostStore hostStore);	  //식당 정보 삭제

}		
    