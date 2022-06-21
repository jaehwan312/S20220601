package com.oracle.S20220601.dao.jh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Notice;


@Repository
public class NtcDaoImpl implements NtcDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCnt() {
		int total = 0;
		try {
			total = session.selectOne("jhSelectTotal");
		} catch (Exception e) {
			System.out.println("NtcDaoImpl getTotalCnt Exception->"+e.getMessage());
		}
		return total;
	}

	@Override
	public List<Notice> listNtc(Notice ntc) {
		List<Notice> ntcList = null;
		try {
			ntcList = session.selectList("jhNtcListAll", ntc);
		} catch (Exception e) {
			System.out.println("NtcDaoImpl listNtc Exception->"+e.getMessage());
		}
		
		return ntcList;
	}

}
