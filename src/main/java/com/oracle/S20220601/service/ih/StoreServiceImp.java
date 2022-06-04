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
	private StoreDao storeDaol;

	@Override//식당정보확인
	public HostStore storeRead(int host_num) {
		
		System.out.println("StoreServiceImp storeRead Start....");
		
		HostStore storeHost = storeDaol.storeRead(host_num);
		
		return storeHost;
	}

	@Override//식당사진
	public List<HostPhoto> storePhoto(int host_num) {
		System.out.println("StoreServiceImp photo Start....");
		
		List<HostPhoto> storePhoto = storeDaol.storePhoto(host_num);
		
		return storePhoto;
	}

	@Override//메뉴리스트 
	public List<Menu> menuList(int host_num) {
		System.out.println("StoreServiceImp menuList Start....");
		
		List<Menu> menuList = storeDaol.menuList(host_num);
		
		return menuList;
	}

	@Override//식장정보등록
	public int storeInsert(HostStore hostStore) {
		
		System.out.println("StoreServiceImp storeInsert Start....");
		
		int storeInsert = storeDaol.storeInsert(hostStore);
		
		return storeInsert;
	}

}
