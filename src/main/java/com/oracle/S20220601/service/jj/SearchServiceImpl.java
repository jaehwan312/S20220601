package com.oracle.S20220601.service.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.SearchDao;
import com.oracle.S20220601.model.Host;
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

	@Override
	public Host getLikeResult(Host host) {
		Host result = sd.getLikeResult(host);
		return result;
	}

	@Override
	public List<Search> getKeywordList() {
		List<Search> search = sd.getKeywordList();
		return search;
	}

	@Override
	public void getKeywordInsert(Search search) {
		sd.getKeywordInsert(search);
	}

	@Override
	public void getKeywordDelete(Search search) {
		sd.getKeywordDelete(search);
	}

	@Override
	public Search getKeywordSearch(int search_num) {
		Search search = sd.getKeywordSearch(search_num);
		return search;
	}

	@Override
	public int getKeywordUpdate(Search search) {
		int result = sd.getKeywordUpdate(search);
		return result;
	}

}
