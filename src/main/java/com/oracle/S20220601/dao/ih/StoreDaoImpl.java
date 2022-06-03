package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.ih.HostStore;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	private SqlSession session;
	
	
	@Override//식당정보확인
	public HostStore storeRead(int host_num) {
		System.out.println("StoreDaoImpl storeRead Start....");
		
		HostStore storeRead = null;
		
		try {
			storeRead = session.selectOne("storeRead", host_num);
		} catch (Exception e) {
			System.out.println("StoreDaoImpl storeRead ErrorMessage --> " + e.getMessage());
		}
		
		return storeRead;
	}

	@Override//식당사진
	public List<HostPhoto> storePhoto(int host_num) {
		
		System.out.println("StoreDaoImpl storePhoto Start....");
		
		List<HostPhoto> storePhoto = null;
		
		try {
			storePhoto = session.selectList("storePhoto", host_num);
			System.out.println("StoreDaoImpl storePhoto storePhoto.size() --> " + storePhoto.size());
		} catch (Exception e) {
			System.out.println("StoreDaoImpl storePhoto ErrorMessage --> " + e.getMessage());
		}
		return storePhoto;
	}

	@Override//메뉴리스트
	public List<Menu> menuList(int host_num) {
		System.out.println("StoreDaoImpl menuList Start....");
		
		List<Menu> menuList = null;
		
		try {
			menuList = session.selectList("menuList", host_num);
			System.out.println("StoreDaoImpl menuList storePhoto.size() --> " + menuList.size());
		} catch (Exception e) {
			System.out.println("StoreDaoImpl menuList ErrorMessage --> " + e.getMessage());
		}
		return menuList;
	}

	@Override//식장정보등록
	public int storeInsert(HostStore hostStore) {
		
		System.out.println("StoreDaoImpl storeInsert Start....");
		
		int storeInsert = 0;
		
		try {
			
			
			hostStore.setMem_num(1);
			hostStore.setOpen_time(hostStore.getStart_time() 
								   + " ~ " + 
								   hostStore.getEnd_time());
			hostStore.setBreak_time(hostStore.getBreak_start_time() 
									    + " ~ " + 
									    hostStore.getBreak_end_time());
			prn(hostStore);
			
			storeInsert = session.insert("storeInsert", hostStore);
			storeInsert = 1;
		} catch (Exception e) {
			storeInsert = 0;
			System.out.println("StoreDaoImpl storeInsert ErrorMessage --> " + e.getMessage());
		}
		return storeInsert;
	}
	
	public void prn(HostStore hostStore) {
		System.out.println(hostStore.getHost_num());
		System.out.println(hostStore.getBcd_code());
		System.out.println(hostStore.getFood_type());
		System.out.println(hostStore.getHost_addr());
		System.out.println(hostStore.getHost_avg());
		System.out.println(hostStore.getHost_code());
		System.out.println(hostStore.getHost_info());
		System.out.println(hostStore.getHost_name());
		System.out.println(hostStore.getLike_count());
		System.out.println(hostStore.getMem_num());
		System.out.println(hostStore.getOpen_time());
		System.out.println(hostStore.getParking());
		System.out.println(hostStore.getRev_count());
		System.out.println(hostStore.getBreak_time());
	}
	
}
