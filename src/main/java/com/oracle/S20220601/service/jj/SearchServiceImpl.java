package com.oracle.S20220601.service.jj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.SearchDao;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchDao sd;
	
	@Override
	public void keywordInsert(String keyword) {
		System.out.println("@@@keyword->"+keyword);
		sd.keywordInsert(keyword);
	}

}
