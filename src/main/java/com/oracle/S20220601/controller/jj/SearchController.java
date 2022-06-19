package com.oracle.S20220601.controller.jj;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.model.Host;
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
		if(search.getKeyword()!=null && search.getKeyword()!="") {
			ss.keywordInsert(search.getKeyword());
		}
//		// 맛집 정보 조회
//		List<HostStorejj> store = ss.getHostStoreList(search);
//		// 숙소 정보 조회
//		List<HostStayjj> stay = ss.getHostStayList(search);
		
		
		model.addAttribute("keyword", search.getKeyword());
		// selection -> 0: 검색결과 리스트 둘다 포함, 1: 숙소만 포함, 2: 맛집만 포함
		if(search.getSelection()!=null) {
			model.addAttribute("selection", search.getSelection());
		}else {
			model.addAttribute("selection", "0");
		}
		model.addAttribute("selectSection", "0");
		
		
		return "jj/searchList";
	}
	
	@GetMapping(value = "stayList")
	public String stayList(Model model) {
		// selection -> 0: 검색결과 리스트 둘다 포함, 1: 숙소만 포함, 2: 맛집만 포함
		model.addAttribute("selection", "1");
		model.addAttribute("selectSection", "1");
		
		return "jj/searchList";
		
	}
	
	@GetMapping(value = "storeList")
	public String storeList(Model model) {
		// selection -> 0: 검색결과 리스트 둘다 포함, 1: 숙소만 포함, 2: 맛집만 포함
		model.addAttribute("selection", "2");
		model.addAttribute("selectSection", "2");
		
		return "jj/searchList";
		
	}
	
	//ajax용 맛집리스트 객체 리턴
	@PostMapping(value = "ajaxStoreList")
	@ResponseBody
	public List<HostStorejj> ajaxStoreList(HttpServletRequest request, Search search, Model model) {
		if(request.getSession().getAttribute("mem_num")!=null) {
			int mem_num = (int)request.getSession().getAttribute("mem_num");
			search.setMem_num(mem_num);
		}
		List<HostStorejj> store = ss.getHostStoreList(search);
		System.out.println("$$$$$store.order-->"+search.getOrder());
		System.out.println("$$$$$store.storeprice-->"+search.getStoreprice());
		
		return store;
		
	}
	
	//ajax용 숙소리스트 객체 리턴
	@PostMapping(value = "ajaxStayList")
	@ResponseBody
	public List<HostStayjj> ajaxStayList(HttpServletRequest request, Search search, Model model) {
		if(request.getSession().getAttribute("mem_num")!=null) {
			int mem_num = (int)request.getSession().getAttribute("mem_num");
			search.setMem_num(mem_num);
		}
		List<HostStayjj> stay = ss.getHostStayList(search);
		System.out.println("$$$$$stay.order-->"+search.getOrder());
		System.out.println("$$$$$stay.stayprice-->"+search.getStayprice());
		
		return stay;
		
	}
	
	@PostMapping(value = "ajaxLikeInOut")
	@ResponseBody
	public Host ajaxLikeInOut(HttpServletRequest request, Host host, Model model) {
		if(request.getSession().getAttribute("mem_num")!=null) {
			int mem_num = (int)request.getSession().getAttribute("mem_num");
			host.setMem_num(mem_num);
		}
		Host result = ss.getLikeResult(host);
		
		return result;
	}
	
}
