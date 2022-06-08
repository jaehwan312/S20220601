package com.oracle.S20220601.dao.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Search;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void keywordInsert(String keyword) {
		Search search = session.selectOne("jjPopSelect", keyword);
		if(search != null) {
			session.update("jjPopUpdate", keyword);
			System.out.println("기존 keyword존재, search_count 추가");
		}else {
			session.insert("jjPopInsert", keyword);
			System.out.println("새로운 keyword 추가");
		}
	}

}
