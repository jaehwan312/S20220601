package com.oracle.S20220601.controller.ih;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.oracle.S20220601.model.ih.StoreReview;
import com.oracle.S20220601.service.ih.ReviewService;

@Controller
public class StoreRevController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreRevController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping(value = "/storeUserRevDel")
	public int storeUserRevDel(Model model, StoreReview review) {
		
		return reviewService.storeUserRevDel(review);
	}
}
