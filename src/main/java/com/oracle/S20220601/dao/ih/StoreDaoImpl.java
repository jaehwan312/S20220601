package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.Store;
import com.oracle.S20220601.model.ih.HostStore;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	private SqlSession session;

	@Override
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

	@Override
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

	@Override
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

	@Override
	public Code foodcode(HostStore storeRead) {
		
		System.out.println("StoreDaoImpl foodcode Start....");
		
		Code foodcode = null;
		
		try {
			foodcode = session.selectOne("foodcode", storeRead);
			System.out.println("StoreDaoImpl foodcode name --> " + foodcode.getName());
		} catch (Exception e) {
			System.out.println("StoreDaoImpl foodcode ErrorMessage --> " + e.getMessage());
		}
		return foodcode;
	}

	@Override
	public int storeInsert(HostStore hostStore) {
		
		System.out.println("StoreDaoImpl storeInsert Start....");
		
		int storeInsert = 0;
		
		try {
			
			hostStore.setOpen_time(hostStore.getStart_time() 
								   + " ~ " + 
								   hostStore.getEnd_time());
			hostStore.setBreak_end_time(hostStore.getBreak_start_time() 
									    + " ~ " + 
									    hostStore.getBreak_end_time());
			
			storeInsert = session.insert("storeInsert", hostStore);
		} catch (Exception e) {
			System.out.println("StoreDaoImpl storeInsert ErrorMessage --> " + e.getMessage());
		}
		return storeInsert;
	}
	
	
	
}
