package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.ih.HostStore;

@Repository
public class CodeDaoImpl implements CodeDao {

	@Autowired
	private SqlSession session;
	
	@Override	//식당의 음식코드 확인
	public Code foodcode(HostStore storeRead) {
		
		System.out.println("CodeDaoImpl foodcode Start....");
		
		Code foodcode = null;
		
		try {
			foodcode = session.selectOne("foodcode", storeRead);
			System.out.println("CodeDaoImpl foodcode name --> " + foodcode.getName());
		} catch (Exception e) {
			System.out.println("CodeDaoImpl foodcode ErrorMessage --> " + e.getMessage());
		}
		return foodcode;
	}
	
	@Override //음식코드 전체 리스트
	public List<Code> foodcodeList(int bcd_code) {

		System.out.println("CodeDaoImpl foodcodeList Start....");
		
		List<Code> foodcodeList = null;
		
		try {
			foodcodeList = session.selectList("foodcodeList", bcd_code);
			System.out.println("CodeDaoImpl foodcodeList foodcodeList.size() --> " + foodcodeList.size());
		} catch (Exception e) {
			System.out.println("StoreDaoImpl foodcodeList ErrorMessage --> " + e.getMessage());
		}
		return foodcodeList;
	}
	
	

}
