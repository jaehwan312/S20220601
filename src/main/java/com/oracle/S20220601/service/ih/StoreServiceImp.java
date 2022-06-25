package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ih.StoreDao;
import com.oracle.S20220601.model.Host;
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

	@Override
	public int storePick(int mem_num, int host_num) {
		System.out.println("StoreServiceImp storePick Start....");
		
		int storePick = storeDao.storePick(mem_num,host_num);
		
		return storePick;
	}

	@Override//내 식당 등록정보
	public List<HostStore> myStoreList(int mem_num) {
		System.out.println("StoreServiceImp myStoreList Start....");
		
		List<HostStore> myStoreList = storeDao.myStoreList(mem_num);
		
		return myStoreList;
	}

	@Override//식당 정보 삭제 요청
	public int storeDeleteRequest(HostStore hostStore) {
		System.out.println("StoreServiceImp storeDeleteRequest Start....");
		
		int storeDeleteRequest = storeDao.storeDeleteRequest(hostStore);
		
		return storeDeleteRequest;
	}



}
