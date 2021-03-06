package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Pick;
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
			hostStore.setOpen_time(hostStore.getStart_time() 
								   + "~" + 
								   hostStore.getEnd_time());
			hostStore.setBreak_time(hostStore.getBreak_start_time() 
									    + "~" + 
									    hostStore.getBreak_end_time());
			storeInsert = session.insert("storeInsert", hostStore);
			storeInsert = 1;
		} catch (Exception e) {
			storeInsert = 0;
			System.out.println("StoreDaoImpl storeInsert ErrorMessage --> " + e.getMessage());
		}
		return storeInsert;
	}


	@Override //식당정보 업데이트
	public int storeUpdate(HostStore hostStore) {
		System.out.println("StoreDaoImpl storeUpdate Start....");
		
		int storeUpdate = 0;
		try {
			hostStore.setIn_open_time(hostStore.getIn_start_time() + "~" + hostStore.getIn_end_time());
			hostStore.setIn_break_time(hostStore.getIn_break_start_time() + "~" + hostStore.getIn_break_end_time());
			storeUpdate = session.update("storeUpdate", hostStore);
			storeUpdate = 1;
		} catch (Exception e) {
			storeUpdate = 0;
			System.out.println("StoreDaoImpl storeInsert ErrorMessage --> " + e.getMessage());
		}
		
		System.out.println("storeUpdate-----<> "+ storeUpdate);
		return storeUpdate;
	}

	@Override //찜하기 확인
	public int storePick(int mem_num, int host_num) {
		System.out.println("StoreDaoImpl storePick Start....");
		
		int storePick = 0;
		Pick storePickChack = new Pick();
		storePickChack.setHost_num(host_num);
		storePickChack.setMem_num(mem_num);
		try {
			storePick = session.selectOne("storePickChack", storePickChack);
		} catch (Exception e) {
			System.out.println("StoreDaoImpl storePick ErrorMessage --> " + e.getMessage());
		}
		return storePick;
	}

	@Override  //내 식당 등록정보
	public List<HostStore> myStoreList(int mem_num) {
		System.out.println("StoreDaoImpl myStoreList Start....");
		
		List<HostStore> myStoreList = null;
		try {
			myStoreList = session.selectList("myStoreList", mem_num);
		} catch (Exception e) {
			System.out.println("StoreDaoImpl myStoreList ErrorMessage --> " + e.getMessage());
		}
		return myStoreList;
	}

	@Override //식당정보 삭제 요청
	public int storeDeleteRequest(HostStore hostStore) {
		System.out.println("StoreDaoImpl storeDeleteRequest Start....");
		
		int storeDeleteRequest = 0;
		try {
			storeDeleteRequest = session.update("storeDelete", hostStore);
		} catch (Exception e) {
			System.out.println("StoreDaoImpl storeDeleteRequest ErrorMessage --> " + e.getMessage());
		}
		return storeDeleteRequest;
	}

	
	/*
	private void prn(HostStore hostStore) {
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
		System.out.println("hostStore.getHost_app() --> " + hostStore.getHost_app());
	}
	*/
	/*
	private void in_prn(HostStore hostStore) {
		System.out.println("hostStore.getHost_num()   --> " + hostStore.getIn_host_num());
		System.out.println("hostStore.getBcd_code()   --> " + hostStore.getIn_bcd_code());
		System.out.println("hostStore.getFood_type()  --> " + hostStore.getIn_food_type());
		System.out.println("hostStore.getHost_addr()  --> " + hostStore.getIn_host_addr());
		System.out.println("hostStore.getHost_avg()   --> " + hostStore.getIn_host_avg());
		System.out.println("hostStore.getHost_code()  --> " + hostStore.getIn_host_code());
		System.out.println("hostStore.getHost_info()  --> " + hostStore.getIn_host_info());
		System.out.println("hostStore.getHost_name()  --> " + hostStore.getIn_host_name());
		System.out.println("hostStore.getLike_count() --> " + hostStore.getIn_like_count());
		System.out.println("hostStore.getMem_num()    --> " + hostStore.getIn_mem_num());
		System.out.println("hostStore.getOpen_time()  --> " + hostStore.getIn_open_time());
		System.out.println("hostStore.getParking()    --> " + hostStore.getIn_parking());
		System.out.println("hostStore.getRev_count()  --> " + hostStore.getIn_rev_count());
		System.out.println("hostStore.getBreak_time() --> " + hostStore.getIn_break_time());
		System.out.println("hostStore.getHost_app()   --> " + hostStore.getIn_host_app());
		System.out.println("hostStore.getParking()    --> " + hostStore.getIn_start_time());
		System.out.println("hostStore.getRev_count()  --> " + hostStore.getIn_end_time());
		System.out.println("hostStore.getBreak_time() --> " + hostStore.getIn_break_start_time());
		System.out.println("hostStore.getHost_app()   --> " + hostStore.getIn_break_end_time());
	}
	*/
}
