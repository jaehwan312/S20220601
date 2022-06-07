package com.oracle.S20220601.service.jj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.MainDao;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDao md;
	
	@Override
	public int getStoreCount() {
		int count = md.getStoreCount();
		return count;
	}

	@Override
	public int getStayCount() {
		int count = md.getStayCount();
		return count;
	}

	@Override
	public int getResCount() {
		int count = md.getResCount();
		return count;
	}

	@Override
	public int getReviewCount() {
		int count = md.getReviewCount();
		return count;
	}

}
