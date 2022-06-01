package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Store;

@Repository
public class StoreDaoImpl {

	@Autowired
	private SqlSession session;
	
	public List<Store> storeList(Store store) {

		System.out.println("StoreDaoImpl storeList Start....");
		
		List<Store> storeList = null;
		
		try {
			storeList = session.selectList("storeList", store);
			System.out.println("StoreDaoImpl storeLis storeList.size() --> " + storeList.size());
		} catch (Exception e) {
			System.out.println("StoreDaoImpl storeList ErrorMessage --> " + e.getMessage());
		}
		return storeList;
	}
	
}
