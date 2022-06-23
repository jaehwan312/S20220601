package com.oracle.S20220601.service.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.PickDao;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;

@Service
public class PickServiceImpl implements PickService {
	
	@Autowired
	private PickDao pd;

	@Override
	public List<HostStorejj> ajaxMyStoreList(int mem_num) {
		List<HostStorejj> list = pd.ajaxMyStoreList(mem_num);
		return list;
	}

	@Override
	public List<HostStayjj> ajaxMyStayList(int mem_num) {
		List<HostStayjj> list = pd.ajaxMyStayList(mem_num);
		return list;
	}

	@Override
	public int myPickDel(int host_num, int mem_num) {
		int result = pd.myPickDel(host_num, mem_num);
		return result;
	}
}
