package com.oracle.S20220601.controller.ih;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
		
		
		model.addAttribute("store",storeRead);
		model.addAttribute("storePhoto",storePhoto);
		model.addAttribute("menuList",menuList);
		
		return "ih/storeRead";
	}
}
