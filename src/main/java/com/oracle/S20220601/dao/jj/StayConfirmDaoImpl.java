package com.oracle.S20220601.dao.jj;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.Jjpaging;

@Repository
public class StayConfirmDaoImpl implements StayConfirmDao {
	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		int total = 0;
		try {
			total = session.selectOne("jjStayTotal");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	@Override
	public List<HostStayjj> stayList(Jjpaging pg) {
		List<HostStayjj> list = null;
		try {
			list=session.selectList("jjHostStayApproveList", pg);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public int approveStay(int host_num) {
		int result = 0;
		try {
			result = session.update("jjApproveStay", host_num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
