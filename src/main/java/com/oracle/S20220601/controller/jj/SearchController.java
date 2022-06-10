package com.oracle.S20220601.controller.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.oracle.S20220601.model.Search;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;
import com.oracle.S20220601.service.jj.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService ss;
	
	
	@PostMapping(value = "getSearchResult")
	public String getSearchResult(Search search, Model model) {
		System.out.println("@@@@@ search.getKeyword()-->"+search.getKeyword());
		
		// DB에 search Keyword 입력
		ss.keywordInsert(search.getKeyword());
		// 맛집 정보 조회
		List<HostStorejj> store = ss.getHostStoreList(search);
		// 숙소 정보 조회
		List<HostStayjj> stay = ss.getHostStayList(search);
		
		
		model.addAttribute("keyword", search.getKeyword());
		model.addAttribute("storeList", store);
		model.addAttribute("stayList", stay);
		
		return "jj/searchList";
	}
}
