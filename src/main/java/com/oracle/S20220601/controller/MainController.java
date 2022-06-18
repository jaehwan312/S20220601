package com.oracle.S20220601.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220601.domain.jj.Search1;
import com.oracle.S20220601.service.jj.MainService;
import com.oracle.S20220601.service.jj.JpaSearchService;

@Controller
public class MainController {
	@Autowired
	private JpaSearchService ss;
	@Autowired
	private MainService ms;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("main")
	public String main(Model model, String msg) {
		System.out.println("main Start...");
		List<Search1> search1 = ss.getRecList();
		int storeCount = ms.getStoreCount();
		int stayCount = ms.getStayCount();
		int resCount = ms.getResCount();
		int reviewCount = ms.getReviewCount();
		
		model.addAttribute("search", search1);
		model.addAttribute("storeCount", storeCount);
		model.addAttribute("stayCount", stayCount);
		model.addAttribute("resCount", resCount);
		model.addAttribute("reviewCount", reviewCount);
		System.out.println("msg ----->" + msg);
		if(msg != null) {
			if (msg.equals("1")) {
				model.addAttribute("msg", "관리자만 접근가능한 페이지입니다.");
			}
		}
		
		return "main";	
	}
	
	
	
}
