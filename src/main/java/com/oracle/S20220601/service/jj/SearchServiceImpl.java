package com.oracle.S20220601.service.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.SearchDao;
import com.oracle.S20220601.model.Search;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchDao sd;
	
	@Override
	public void keywordInsert(String keyword) {
		sd.keywordInsert(keyword);
	}

	@Override
	public List<HostStorejj> getHostStoreList(Search search) {
		List<HostStorejj> store = sd.getHostStoreList(search);
		return store;
	}

	@Override
	public List<HostStayjj> getHostStayList(Search search) {
		List<HostStayjj> stay = sd.getHostStayList(search);
		return stay;
	}

}
