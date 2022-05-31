package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ih.StoreDaoImpl;
import com.oracle.S20220601.model.Store;

@Service
public class StoreServiceImpl{

	@Autowired
	private StoreDaoImpl storeDaoImpl;
	
	public List<Store> storeList(Store store) {
		
		System.out.println("StoreServiceImpl storeList() Start...");
		
		List<Store> storeList = null;
		storeList = storeDaoImpl.storeList(store);
		
		return storeList;
	}

}
