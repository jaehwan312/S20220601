package com.oracle.S20220601.dao.ih;

import java.util.List;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.ih.HostStore;

public interface CodeDao {

	Code 	   foodcode(HostStore storeRead); 	//식당의 음식코드 확인
	List<Code> foodcodeList(int bcd_code);		//음식코드 전체 리스트

}
