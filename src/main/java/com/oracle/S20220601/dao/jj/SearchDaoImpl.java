package com.oracle.S20220601.dao.jj;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.Search;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void keywordInsert(String keyword) {
		try {
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public List<HostStorejj> getHostStoreList(Search search) {
		List<HostStorejj> stores = null;
		try {
			 stores = session.selectList("jjHostStoreList", search);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return stores;
	}

	
	@Override
	public List<HostStayjj> getHostStayList(Search search) {
		List<HostStayjj> stays = null;
		try {
			stays = session.selectList("jjHostStayList", search);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return stays;
	}

	@Override
	public Host getLikeResult(Host host) {
		Host result = null;
		try {
			int exist = session.selectOne("jjSelectPick", host);
			if(exist==0) {
				//값이 존재하지 않으면 Insert
				session.insert("jjInsertPick", host);
				System.out.println("찜하기 값이 없음. INSERT완료");
				session.update("jjHostPickUp", host);
			}else if(exist==1) {
				//값이 존재하면 Delete
				session.delete("jjDeletePick", host);
				System.out.println("찜하기 값이 존재. DELETE완료");
				session.update("jjHostPickDown", host);
			}
			result = session.selectOne("jjHostPickCount", host);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public List<Search> getKeywordList() {
		List<Search> search = null;
		try {
			search = session.selectList("jjRecKeywordList");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return search;
	}

	@Override
	public void getKeywordInsert(Search search) {
		try {
			session.insert("jjRecKeywordInsert", search);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void getKeywordDelete(Search search) {
		try {
			session.delete("jjRecKeywordDelete", search);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
