package com.oracle.S20220601.controller.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.model.Search;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;
import com.oracle.S20220601.service.jj.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService ss;
	
	
	@GetMapping(value = "getSearchResult")
	public String getSearchResult(Search search, Model model) {
		
		// DB에 search Keyword 입력
		if(search.getOrder()==null&&search.getSelection()==null) {
			ss.keywordInsert(search.getKeyword());
		}
//		// 맛집 정보 조회
//		List<HostStorejj> store = ss.getHostStoreList(search);
//		// 숙소 정보 조회
//		List<HostStayjj> stay = ss.getHostStayList(search);
		
		
		model.addAttribute("keyword", search.getKeyword());
		model.addAttribute("order", search.getOrder());
		// selection -> 0: 검색결과 리스트 둘다 포함, 1: 숙소만 포함, 2: 맛집만 포함
		if(search.getSelection()!=null) {
			model.addAttribute("selection", search.getSelection());
		}else {
			model.addAttribute("selection", "0");
		}
		
//		model.addAttribute("storeList", store);
//		model.addAttribute("stayList", stay);
		
		return "jj/searchList";
	}
	
	@GetMapping(value = "stayList")
	public String stayList(Model model) {
		// selection -> 0: 검색결과 리스트 둘다 포함, 1: 숙소만 포함, 2: 맛집만 포함
		model.addAttribute("selection", "1");
		
		return "jj/searchList";
		
	}
	
	@GetMapping(value = "storeList")
	public String storeList(Model model) {
		// selection -> 0: 검색결과 리스트 둘다 포함, 1: 숙소만 포함, 2: 맛집만 포함
		model.addAttribute("selection", "2");
		
		return "jj/searchList";
		
	}
	
	//ajax용 맛집리스트 객체 리턴
	@PostMapping(value = "ajaxStoreList")
	@ResponseBody
	public List<HostStorejj> ajaxStoreList(Search search, Model model) {
		List<HostStorejj> store = ss.getHostStoreList(search);
		System.out.println("$$$$$store"+search.getOrder());
		
		return store;
		
	}
	
	//ajax용 숙소리스트 객체 리턴
	@PostMapping(value = "ajaxStayList")
	@ResponseBody
	public List<HostStayjj> ajaxStayList(Search search, Model model) {
		List<HostStayjj> stay = ss.getHostStayList(search);
		System.out.println("$$$$$stay"+search.getOrder());
		return stay;
		
	}
	
}
