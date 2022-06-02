package com.oracle.S20220601.service.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.JpaSearchDao;
import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Menu1;
import com.oracle.S20220601.domain.jj.Stay1;
import com.oracle.S20220601.domain.jj.Store1;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private JpaSearchDao sd;

	@Override
	public List<Host1> getHostList() {
		List<Host1> host = null;
		host = sd.getHostList();
		return host;
	}

	@Override
	public List<Stay1> getStayList() {
		List<Stay1> stay = null;
		stay = sd.getStayList();
		return stay;
	}

	@Override
	public List<Menu1> getMenuList() {
		List<Menu1> menu = null;
		menu = sd.getMenuList();
		return menu;
	}

	@Override
	public List<Store1> getStoreList() {
		List<Store1> store = null;
		store = sd.getStoreList();
		return store;
	}
}
