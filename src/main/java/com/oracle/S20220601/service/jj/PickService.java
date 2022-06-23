package com.oracle.S20220601.service.jj;

import java.util.List;

import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;

public interface PickService {

	List<HostStorejj> ajaxMyStoreList(int mem_num);

	List<HostStayjj> ajaxMyStayList(int mem_num);

}
