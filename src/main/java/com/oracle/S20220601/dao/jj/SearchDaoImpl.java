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
		// 조건 문자열을 담을 새로운 객체 생성
		Search searchStr = new Search();
		searchStr.setKeyword(search.getKeyword());
		
		// keyword 조건 문자열 변환
		if(search.getKeyword()!=null&&search.getKeyword()!="") {
			searchStr.setKeyword(" and (host_name like '%"+search.getKeyword()+"%' or host_addr like '%"+search.getKeyword()
			+"%' or (select c.name from code c where c.bcd=200 and c.mcd=s.food_type) like '%"+search.getKeyword()+"%')");
		}else {
			searchStr.setKeyword("");
		}
		System.out.println("@"+searchStr.getKeyword());
		
		// 가격대 조건 문자열 변환
		if(search.getMin_price()!=null&&search.getMin_price()!="") {
			searchStr.setMin_price(" and min_price >="+search.getMin_price());
		}else {
			searchStr.setMin_price("");
		}
		System.out.println("@"+searchStr.getMin_price());
		
		// 타입 조건들 문자열 변환 
		if(search.getFood_type()!=null) {
			String str="";
			for(int i=0; i<search.getFood_type().size(); i++) {
				if(i==0) {
					str+=search.getFood_type().get(i);
				}else {
					str+=","+search.getFood_type().get(i);
				}
			}
			searchStr.setTotal_food_type(" and food_type in ("+str+")");
		}else {
			searchStr.setTotal_food_type("");
		}
		System.out.println("@"+searchStr.getTotal_food_type());
		
		// 정렬 조건 문자열 변환
		if(search.getOrder()!=null&&search.getOrder()!="") {
			searchStr.setOrder(" order by "+search.getOrder());
		}else {
			searchStr.setOrder("");
		}
		System.out.println("@"+searchStr.getOrder());
		
		List<HostStorejj> stores = session.selectList("jjHostStoreList", searchStr);
		return stores;
	}

	
	@Override
	public List<HostStayjj> getHostStayList(Search search) {
		// 조건 문자열을 담을 새로운 객체 생성
		Search searchStr = new Search();
		searchStr.setKeyword(search.getKeyword());
		
		// keyword 조건 문자열 변환
		if(search.getKeyword()!=null&&search.getKeyword()!="") {
			searchStr.setKeyword(" and (host_name like '%"+search.getKeyword()+"%' or host_addr like '%"+search.getKeyword()+
					"%' or (select c.name from code c where c.bcd=300 and c.mcd=s.stay_type) like '%"+search.getKeyword()+"%')");
		}else {
			searchStr.setKeyword("");
		}
		System.out.println("@@@"+searchStr.getKeyword());
		// 가격대 조건 문자열 변환
		if(search.getMin_price()!=null&&search.getMin_price()!="") {
			searchStr.setMin_price(" and min_dayfee >="+search.getMin_price());
		}else {
			searchStr.setMin_price("");
		}
		System.out.println("@@@"+searchStr.getMin_price());
		// 타입 조건들 문자열 변환 
		if(search.getStay_type()!=null) {
			String str="";
			for(int i=0; i<search.getStay_type().size(); i++) {
				if(i==0) {
					str+=search.getStay_type().get(i);
				}else {
					str+=","+search.getStay_type().get(i);
				}
			}
			searchStr.setTotal_stay_type(" and stay_type in ("+str+")");
		}else {
			searchStr.setTotal_stay_type("");
		}
		System.out.println("@@@"+searchStr.getTotal_stay_type());
		// 정렬 조건 문자열 변환
		if(search.getOrder()!=null&&search.getOrder()!="") {
			searchStr.setOrder(" order by "+search.getOrder());
		}else {
			searchStr.setOrder("");
		}
		System.out.println("@@@"+searchStr.getOrder());
		
		List<HostStayjj> stays = session.selectList("jjHostStayList", searchStr);
		return stays;
	}

}
