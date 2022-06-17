package com.oracle.S20220601.dao.jj;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Search;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void keywordInsert(String keyword) {
		Search search = session.selectOne("jjPopSelect", keyword);
		int result = 0;
		if(search != null) {
			result = session.update("jjPopUpdate", keyword);
			if(result>0) System.out.println("기존 keyword존재, search_count 추가");
			else System.out.println("search_count 수정 실패");
			
		}else {
			result = session.insert("jjPopInsert", keyword);
			if(result>0) System.out.println("새로운 keyword 추가");
			else System.out.println("keyword 추가 실패");
		}
	}

	@Override
	public List<HostStorejj> getHostStoreList(Search search) {
		List<HostStorejj> stores = session.selectList("jjHostStoreList", search);
		return stores;
	}

	
	@Override
	public List<HostStayjj> getHostStayList(Search search) {
		List<HostStayjj> stays = session.selectList("jjHostStayList", search);
		return stays;
	}

}
