package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ih.CodeDao;
import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.ih.HostStore;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	private CodeDao codeDao;
	
	@Override  //식당의 음식코드 확인
	public Code foodcode(HostStore storeRead) {
		System.out.println("CodeServiceImpl foodcode Start....");
		
		Code foodcode = codeDao.foodcode(storeRead);
		
		return foodcode;
	}
	
	@Override //음식코드 전체 리스트
	public List<Code> foodcodeList(int bcd_code) {
		
		System.out.println("CodeServiceImpl foodcodeList Start....");
		
		List<Code> foodcodeList = codeDao.foodcodeList(bcd_code);
		
		return foodcodeList;
	}

}
