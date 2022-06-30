package com.oracle.S20220601.controller.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.model.jj.Jjpaging;
import com.oracle.S20220601.service.ih.StoreConfirmService;

@Controller
public class StoreConfirmController {
	
	@Autowired
	private StoreConfirmService service;
	
	//식당 등록 요청 리스트
	@RequestMapping(value = "storeConfirm")
	public String stayConfirm(String currentPage, Model model) {
		int total = service.total();
		
		Jjpaging pg = new Jjpaging(total, currentPage);
		List<HostStore> list = service.storeList(pg);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("food_type --> " + list.get(i).getFood_type());
		}
		
		model.addAttribute("storeList",list);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		if(currentPage==null||currentPage.equals("")) {
			model.addAttribute("currentPage", "1");
			System.out.println("성공");
		}else {
			model.addAttribute("currentPage", currentPage);
			System.out.println("실패");
		}
		
		return "ih/storeConfirm";
	}
	
	//승인 요청 수락
	@PostMapping(value = "approveStore")
	@ResponseBody
	public int approveStore(int host_num) {
		int result = service.approveStore(host_num);
		
		return result;
	}
	
	//승인 요청 거절
	@PostMapping(value = "rejectStore")
	@ResponseBody
	public int rejectStore(int host_num) {
		int result = service.rejectStore(host_num);
		
		return result;
	}
}
