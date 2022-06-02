package com.oracle.S20220601.controller.jj;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Menu1;
import com.oracle.S20220601.domain.jj.SearchListBuffer;
import com.oracle.S20220601.domain.jj.Stay1;
import com.oracle.S20220601.domain.jj.Store1;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.service.jj.SearchService;

@RestController
public class SearchController {
	
	@Autowired
	private SearchService ss;
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@GetMapping("/getSearchList")
	public List<SearchListBuffer> getSearchList() {
		List<SearchListBuffer> bufferList = new ArrayList<SearchListBuffer>();
		SearchListBuffer buffer = null; // 클래스명, 컬럼명, 내용으로 버퍼용 클래스 생성
		// 검색목록에 업체명 저장
		List<Host1> host = ss.getHostList();
		for(Host1 ht : host) {
			buffer = new SearchListBuffer();
			buffer.setTable_name("host");
			buffer.setColumn_name("host_name");
			buffer.setContent(ht.getHost_name());
			bufferList.add(buffer);
		}
		// 검색목록에 업체주소 저장
		for(Host1 ht2 : host) {
			buffer = new SearchListBuffer();
			buffer.setTable_name("host");
			buffer.setColumn_name("host_addr");
			buffer.setContent(ht2.getHost_addr());
			bufferList.add(buffer);
		}
		// 검색목록에 편의시설 저장
		List<Stay1> stay = ss.getStayList();
		for(Stay1 st : stay) {
			buffer = new SearchListBuffer();
			buffer.setTable_name("stay");
			buffer.setColumn_name("convenient");
			buffer.setContent(st.getConvenient());
			bufferList.add(buffer);
		}
		// 검색목록에 숙소코드 저장
		for(Stay1 st2 : stay) {
			buffer = new SearchListBuffer();
			buffer.setTable_name("stay");
			buffer.setColumn_name("stay_type");
			buffer.setContent(st2.getName());
			bufferList.add(buffer);
		}
		// 검색목록에 메뉴이름 저장
		List<Menu1> menu = ss.getMenuList(); 
		for(Menu1 mn : menu) {
			buffer = new SearchListBuffer();
			buffer.setTable_name("menu");
			buffer.setColumn_name("menu_name");
			buffer.setContent(mn.getMenu_name());
			bufferList.add(buffer);
		}
		// 검색목록에 음식코드 저장
		List<Store1> store = ss.getStoreList(); 
		for(Store1 sr : store) {
			buffer = new SearchListBuffer();
			buffer.setTable_name("store");
			buffer.setColumn_name("food_type");
			buffer.setContent(sr.getName());
			bufferList.add(buffer);
		}
		
		return bufferList;
	}
	
}
