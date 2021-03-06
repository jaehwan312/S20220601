package com.oracle.S20220601.service.jj;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.JpaSearchDao;
import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Search1;

@Service
@Transactional
public class JpaSearchServiceImpl implements JpaSearchService {
	@Autowired
	private JpaSearchDao sd;

	@Override
	public List<Host1> getHostList() {
		List<Host1> host1 = sd.getHostList();
		return host1;
	}

	@Override
	public List<Search1> getRecList() {
		List<Search1> search1 = sd.getRecList();
		return search1;
	}

	@Override
	public List<Search1> getPopList() {
		List<Search1> search1 = sd.getPopList();
		return search1;
	}

}
