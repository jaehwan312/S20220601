package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ih.StoreConfirmDao;
import com.oracle.S20220601.dao.jj.StayConfirmDao;
import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.model.jj.Jjpaging;
@Service
public class StoreConfirmServiceImpl implements StoreConfirmService{
	@Autowired
	private StoreConfirmDao dao;

	@Override
	public int total() {
		int total = dao.total();
		return total;
	}

	@Override
	public List<HostStore> storeList(Jjpaging pg) {
		List<HostStore> list = dao.storeList(pg);
		return list;
	}

	@Override
	public int approveStore(int host_num) {
		int result = dao.approveStore(host_num);
		return result;
	}

	@Override
	public int rejectStore(int host_num) {
		int result = dao.rejectStore(host_num);
		return result;
	}
}
