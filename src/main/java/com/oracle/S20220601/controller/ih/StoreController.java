package com.oracle.S20220601.controller.ih;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.S20220601.model.Store;
import com.oracle.S20220601.service.ih.StoreServiceImpl;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Autowired
	private StoreServiceImpl storeService;
	
	
	@GetMapping(value = "storeList")
	public String storeList(Store store, Model model) {
		logger.info("StoreController storeList Start..");
		
		List<Store> storeList = null;
		
		storeList =	storeService.storeList(store);
		
		model.addAttribute("storeList", storeList);
		
		System.out.println("StoreController storeList storeList.size --> " + storeList.size());
		return "ih/storeList";
	}
}
