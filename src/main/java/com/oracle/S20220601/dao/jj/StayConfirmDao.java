package com.oracle.S20220601.dao.jj;

import java.util.List;

import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.Jjpaging;

public interface StayConfirmDao {

	int total();

	List<HostStayjj> stayList(Jjpaging pg);

	int approveStay(int host_num);

	int rejectStay(int host_num);

	
}
