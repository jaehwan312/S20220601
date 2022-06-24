package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.model.jj.Jjpaging;

@Repository
public class StoreConfirmDaoImpl implements StoreConfirmDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		int total = 0;
		try {
			total = session.selectOne("StoreTotal");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	@Override
	public List<HostStore> storeList(Jjpaging pg) {
		List<HostStore> list = null;
		try {
			list=session.selectList("storeConfirmList", pg);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public int approveStore(int host_num) {
		int result = 0;
		try {
			result = session.update("approveStore", host_num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public int rejectStore(int host_num) {
		int result = 0;
		try {
			result = session.delete("rejectStore", host_num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
