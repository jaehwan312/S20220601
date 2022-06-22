package com.oracle.S20220601.service.jj;

import java.util.List;

import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.Jjpaging;

public interface StayConfirmService {

	int total();

	List<HostStayjj> stayList(Jjpaging pg);

	int approveStay(int host_num);

	int rejectStay(int host_num);


}
