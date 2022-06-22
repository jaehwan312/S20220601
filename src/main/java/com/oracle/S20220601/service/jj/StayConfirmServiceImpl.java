package com.oracle.S20220601.service.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.StayConfirmDao;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.Jjpaging;

@Service
public class StayConfirmServiceImpl implements StayConfirmService {
	@Autowired
	private StayConfirmDao scd;

	@Override
	public int total() {
		int total = scd.total();
		return total;
	}

	@Override
	public List<HostStayjj> stayList(Jjpaging pg) {
		List<HostStayjj> list = scd.stayList(pg);
		return list;
	}

	@Override
	public int approveStay(int host_num) {
		int result = scd.approveStay(host_num);
		return result;
	}

	@Override
	public int rejectStay(int host_num) {
		int result = scd.rejectStay(host_num);
		return result;
	}
}
