package com.oracle.S20220601.service.jj;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.JpaSearchDao;
import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Menu1;
import com.oracle.S20220601.domain.jj.Stay1;
import com.oracle.S20220601.domain.jj.Store1;

@Service
@Transactional
public class SearchServiceImpl implements SearchService {
	@Autowired
	private JpaSearchDao sd;

	@Override
	public List<Host1> getHostList() {
		List<Host1> host1 = sd.getHostList();
		return host1;
	}

}
