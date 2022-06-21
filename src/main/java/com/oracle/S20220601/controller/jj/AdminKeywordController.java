package com.oracle.S20220601.controller.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.model.Search;
import com.oracle.S20220601.service.jj.SearchService;

@Controller
public class AdminKeywordController {
	
	@Autowired
	private SearchService ss;
	
	
	@GetMapping(value = "keywordList")
	public String getKeywordList(Model model) {
		List<Search> search = ss.getKeywordList();
		
		model.addAttribute("keywords", search);
		
		return "jj/adminAddKeyword";
	}
	
	@RequestMapping(value = "keywordInsert")
	public String getKeywordInsert(Search search, Model model) {
		ss.getKeywordInsert(search);
		
		return "redirect:keywordList";
	}
	
	@RequestMapping(value = "keywordDelete")
	public String getKeywordDelete(Search search, Model model) {
		ss.getKeywordDelete(search);
		
		return "redirect:keywordList";
	}
	
	@RequestMapping(value = "keywordSearch")
	@ResponseBody
	public Search getKeywordSearch(int search_num, Model model) {
		Search search = ss.getKeywordSearch(search_num);
		
		return search;
	}
	
	@RequestMapping(value = "keywordUpdate")
	@ResponseBody
	public Search getKeywordUpdate(Search search, Model model) {
		Search result = null;
		if(ss.getKeywordUpdate(search)>0) {
			result = ss.getKeywordSearch(search.getSearch_num());
		}
		return result;
	}
	
	
}
