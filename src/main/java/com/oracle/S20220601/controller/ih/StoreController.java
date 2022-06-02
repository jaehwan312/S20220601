package com.oracle.S20220601.controller.ih;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.Store;
import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.service.ih.StoreService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Autowired
	private StoreService storeService;
	
	 
	@GetMapping(value = "storeRead")
	public String storeRead(int host_num, Model model) {
		logger.info("StoreController storeRead Start..");
		
		HostStore       storeRead  = storeService.storeRead(host_num);
		List<HostPhoto> storePhoto = storeService.storePhoto(host_num);
		List<Menu>      menuList   = storeService.menuList(host_num);
		Code      		foodcode   = storeService.foodcode(storeRead);
		
		model.addAttribute("store",storeRead);
		model.addAttribute("storePhoto",storePhoto);
		model.addAttribute("menuList",menuList);
		
		
		model.addAttribute("foodcode",foodcode);
		
		return "ih/storeRead";
	}
	
	@GetMapping(value = "storeInsertForm")
	public String storeInsertForm(Model model) {
		logger.info("StoreController storeInsertForm Start..");
		return "ih/storeInsertForm";
	}
	
	@PostMapping(value = "storeInsert")
	public String storeInsert(HostStore hostStore, Model model) {
		
		int storeInsert = storeService.storeInsert(hostStore);
		
		if (storeInsert > 0) {
			model.addAttribute("msg", "등록 요청 성공");
		}else {
			model.addAttribute("msg", "등록 요청 실패");
		}
		
		return "storeInsertForm"; //현재 리스트가 존재 하지 않으 므로 main으로 이동
	}
}
