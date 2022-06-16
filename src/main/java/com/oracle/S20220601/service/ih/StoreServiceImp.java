package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ih.StoreDao;
import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.ih.HostStore;

@Service
public class StoreServiceImp implements StoreService{

	@Autowired
	private StoreDao storeDao;

	@Override//식당정보확인
	public HostStore storeRead(int host_num) {
		
		System.out.println("StoreServiceImp storeRead Start....");
		
		HostStore storeHost = storeDao.storeRead(host_num);
		
		return storeHost;
	}

	@Override//식장정보등록
	public int storeInsert(HostStore hostStore) {
		
		System.out.println("StoreServiceImp storeInsert Start....");
		
		int storeInsert = storeDao.storeInsert(hostStore);
		
		return storeInsert;
	}

	@Override
	public int storeUpdate(HostStore hostStore) {
		System.out.println("StoreServiceImp storeUpdate Start....");
		
		int storeUpdate = storeDao.storeUpdate(hostStore);
		
		return storeUpdate;
	}

}
