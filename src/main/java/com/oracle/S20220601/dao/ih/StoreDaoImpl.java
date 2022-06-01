package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.HostPhoto;
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
	
	
	
}
