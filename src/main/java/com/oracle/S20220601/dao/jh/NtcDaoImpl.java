package com.oracle.S20220601.dao.jh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Notice;
import com.sun.net.httpserver.Authenticator.Result;


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

	@Override
	public Notice ntcContent(int n_num) {
		Notice ntc = null;
		try {
			ntc = session.selectOne("jhSelContent", n_num);
		} catch (Exception e) {
			System.out.println("NtcDaoImpl ntcContent Exception->"+e.getMessage());
		}
		return ntc;
	}
	
	@Override
	public void viewCount(int n_num) {
		try {
			session.update("jhViewCount", n_num);
		} catch (Exception e) {
			System.out.println("NtcDaoImpl viewCount Exception->"+e.getMessage());
		}
	}

	@Override
	public int ntcUpdate(Notice ntc) {
		int result = 0;
		try {
			System.out.println("NtcDaoImpl ntcUpdate Start...");
			result = session.update("jhNtcUpdate", ntc);
		} catch (Exception e) {
			System.out.println("NtcDaoImpl ntcUpdate Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int ntcDelete(int n_num) {
		int result = 0;
		try {
			result = session.delete("jhNtcDelete", n_num);
		} catch (Exception e) {
			System.out.println("NtcDaoImpl ntcContent Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int ntcInsert(Notice ntc) {
		int result = 0;
		try {
			result = session.insert("jhNtcInsert", ntc);
		} catch (Exception e) {
			System.out.println("NtcDaoImpl ntcInsert Exception->"+e.getMessage());
		}
		return result;
	}

}
