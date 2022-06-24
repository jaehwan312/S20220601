package com.oracle.S20220601.dao.jj;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Pick;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;

@Repository
public class PickDaoImpl implements PickDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<HostStorejj> ajaxMyStoreList(int mem_num) {
		List<HostStorejj> list = null;
		try {
			list = session.selectList("jjMyStoreList", mem_num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public List<HostStayjj> ajaxMyStayList(int mem_num) {
		List<HostStayjj> list = null;
		try {
			list = session.selectList("jjMyStayList", mem_num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public int myPickDel(int host_num, int mem_num) {
		int result = 0;
		Pick pick = new Pick();
		pick.setHost_num(host_num);
		pick.setMem_num(mem_num);
		try {
			result = session.delete("jjMyPickDel", pick);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	
}
