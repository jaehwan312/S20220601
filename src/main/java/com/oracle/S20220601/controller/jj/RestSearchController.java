package com.oracle.S20220601.controller.jj;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Search1;
import com.oracle.S20220601.service.jj.SearchService;

@RestController
public class RestSearchController {
	
	@Autowired
	private SearchService ss;
	private static final Logger logger = LoggerFactory.getLogger(RestSearchController.class);
	
	@GetMapping("/getSearchList")
	public List<String> getSearchList() {
		List<String> searchList = new ArrayList<String>();
		List<Host1> host1 = ss.getHostList();
		for(Host1 ht : host1) {
			searchList.add(ht.getHost_name());
		}
		System.out.println("@@@@@searchList.size()-->"+searchList.size());
		
		return searchList;
		
	}
	
	@GetMapping("/getRecList")
	public List<String> getRecList(){
		List<String> recList = new ArrayList<String>();
		List<Search1> search1 = ss.getRecList();
		for(Search1 sc : search1) {
			recList.add(sc.getKeyword());
		}
		System.out.println("@@@@@recList.size()-->"+recList.size());
		
		return recList;
	}
	
	@GetMapping("/getPopList")
	public List<String> getPopList(){
		List<String> popList = new ArrayList<String>();
		List<Search1> search1 = ss.getPopList();
		for(Search1 sc : search1) {
			popList.add(sc.getKeyword());
		}
		System.out.println("@@@@@popList.size()-->"+popList.size());
		
		return popList;
	}
	
}
