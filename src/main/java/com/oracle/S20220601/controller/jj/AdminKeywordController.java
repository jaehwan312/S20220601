package com.oracle.S20220601.controller.jj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.S20220601.service.jj.SearchService;

@Controller
public class AdminKeywordController {
	
	@Autowired
	private SearchService ss;
	
	
	@GetMapping(value = "keywordList")
	public String getSearchResult(Model model) {
		
		
		return "jj/adminAddKeyword";
	}
	
	
	
}
