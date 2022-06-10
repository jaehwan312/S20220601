package com.oracle.S20220601.dao.ih;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.ih.HostStore;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	private SqlSession session;
	
	
	@Override//식당정보확인
	public HostStore storeRead(int host_num) {
		System.out.println("StoreDaoImpl storeRead Start....");
		
		HostStore storeRead 	   = null;
		int 	  storeRevcount    = 0;
		float     storeRevPointAvg = 0.0f;
		try {
			storeRevPointAvg = session.update("storeRevPointAvg",host_num);
			storeRevcount	 = session.update("storeRevcount",host_num);
			storeRead 	  	 = session.selectOne("storeRead", host_num);
		} catch (Exception e) {
			System.out.println("StoreDaoImpl storeRead ErrorMessage --> " + e.getMessage());
		}
		
		return storeRead;
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
//			prn(hostStore);
			storeInsert = session.insert("storeInsert", hostStore);
			storeInsert = 1;
		} catch (Exception e) {
			storeInsert = 0;
			System.out.println("StoreDaoImpl storeInsert ErrorMessage --> " + e.getMessage());
		}
		return storeInsert;
	}
	
	public void prn(HostStore hostStore) {
		System.out.println("hostStore.getHost_num()   --> " + hostStore.getHost_num());
		System.out.println("hostStore.getBcd_code()   --> " + hostStore.getBcd_code());
		System.out.println("hostStore.getFood_type()  --> " + hostStore.getFood_type());
		System.out.println("hostStore.getHost_addr()  --> " + hostStore.getHost_addr());
		System.out.println("hostStore.getHost_avg()   --> " + hostStore.getHost_avg());
		System.out.println("hostStore.getHost_code()  --> " + hostStore.getHost_code());
		System.out.println("hostStore.getHost_info()  --> " + hostStore.getHost_info());
		System.out.println("hostStore.getHost_name()  --> " + hostStore.getHost_name());
		System.out.println("hostStore.getLike_count() --> " + hostStore.getLike_count());
		System.out.println("hostStore.getMem_num()    --> " + hostStore.getMem_num());
		System.out.println("hostStore.getOpen_time()  --> " + hostStore.getOpen_time());
		System.out.println("hostStore.getParking()    --> " + hostStore.getParking());
		System.out.println("hostStore.getRev_count()  --> " + hostStore.getRev_count());
		System.out.println("hostStore.getBreak_time() --> " + hostStore.getBreak_time());
	}
	
}
