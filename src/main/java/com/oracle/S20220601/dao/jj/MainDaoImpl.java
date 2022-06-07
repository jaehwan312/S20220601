package com.oracle.S20220601.dao.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDaoImpl implements MainDao {
	@Autowired
	private SqlSession session;

	@Override
	public int getStoreCount() {
		int count = 0;
		try {
			count = session.selectOne("jjStoreCount");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return count;
	}

	@Override
	public int getStayCount() {
		int count = 0;
		try {
			count = session.selectOne("jjStayCount");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return count;
	}

	@Override
	public int getResCount() {
		int count = 0;
		try {
			count = session.selectOne("jjResCount");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return count;
	}

	@Override
	public int getReviewCount() {
		int count = 0;
		try {
			count = session.selectOne("jjReviewCount");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return count;
	}
	
}
