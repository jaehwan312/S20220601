package com.oracle.S20220601.controller.ih;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.model.ih.StoreReview;
import com.oracle.S20220601.service.ih.ReviewService;

@Controller
public class StoreRevController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreRevController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@ResponseBody
	@RequestMapping(value = "/storeUserRevDel", method = RequestMethod.POST)
	public int storeUserRevDel(@RequestBody StoreReview review) {
		
		System.out.println("Host_num --> " + review.getHost_num());
		System.out.println("Mem_num  --> " + review.getMem_num());
		System.out.println("Rev_num  --> " + review.getRev_num());
		
		int storeRevDel = reviewService.storeUserRevDel(review);
		
		if (storeRevDel > 0) {
			int storeRevcount    = reviewService.storeRevcount(review.getHost_num());
			int storeRevPointAvg = reviewService.storeRevPointAvg(review.getHost_num());
		}
		
		return storeRevDel;
	}
}
