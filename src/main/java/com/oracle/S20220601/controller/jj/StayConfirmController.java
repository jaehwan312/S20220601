package com.oracle.S20220601.controller.jj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.Jjpaging;
import com.oracle.S20220601.service.jj.StayConfirmService;

@Controller
public class StayConfirmController {
	
	@Autowired
	private StayConfirmService scs;
	
	@RequestMapping(value = "stayConfirm")
	public String stayConfirm(String currentPage, Model model) {
		int total = scs.total();
		
		Jjpaging pg = new Jjpaging(total, currentPage);
		List<HostStayjj> list = scs.stayList(pg);
		
		model.addAttribute("stayList",list);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		if(currentPage==null||currentPage.equals("")) {
			model.addAttribute("currentPage", "1");
		}else {
			model.addAttribute("currentPage", currentPage);
		}
		
		return "jj/stayConfirm";
	}
	
	@PostMapping(value = "approveStay")
	@ResponseBody
	public int approveStay(int host_num) {
		int result = scs.approveStay(host_num);
		
		return result;
	}
	
	@PostMapping(value = "rejectStay")
	@ResponseBody
	public int rejectStay(int host_num) {
		int result = scs.rejectStay(host_num);
		
		return result;
	}
}
