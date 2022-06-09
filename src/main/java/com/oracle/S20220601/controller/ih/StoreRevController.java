package com.oracle.S20220601.controller.ih;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.model.ih.StoreReview;
import com.oracle.S20220601.service.ih.ReviewService;
import com.oracle.S20220601.service.ih.StoreService;

@Controller
public class StoreRevController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreRevController.class);
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private StoreService  storeService;
	
	@ResponseBody//리뷰 삭제
	@RequestMapping(value = "/storeRevInsert", method = RequestMethod.POST)
	public int storeRevInsert(@RequestBody StoreReview review) {
		
		System.out.println("StoreRevController storeRevInsert Start...");
		int storeRevDel = reviewService.storeUserRevInsert(review);
		
		return storeRevDel;
	}
	
	
	@ResponseBody//리뷰 삭제
	@RequestMapping(value = "/storeUserRevDel", method = RequestMethod.POST)
	public int storeUserRevDel(@RequestBody StoreReview review) {
		
		System.out.println("StoreRevController storeUserRevDel Start...");
		int storeRevDel = reviewService.storeUserRevDel(review);
		
		return storeRevDel;
	}
	
	@ResponseBody//리뷰 갯수 업데이트
	@RequestMapping(value = "/StoreRevCount", method = RequestMethod.POST)
	public int StoreRevCountSelect(@RequestParam int host_num) {
		System.out.println("StoreRevController StoreRevCount Start...");
		
		HostStore storeRevcount  = storeService.storeRead(host_num);
//		int storeRevcount    = reviewService.storeRevcount(host_num);   //삭제시 리뷰갯수 업데이트
		
		return storeRevcount.getRev_count();
	}
	
	@ResponseBody//식당 평점 업데이트
	@RequestMapping(value = "/storeRevPointAvg", method = RequestMethod.POST)
	public float storeRevPointAvg(@RequestParam int host_num) {
		
		System.out.println("StoreRevController storeRevPointAvg Start...");
		HostStore storeRevPointAvg  = storeService.storeRead(host_num);
//		float storeRevPointAvg = reviewService.storeRevPointAvg(host_num);//삭제시 평점    업데이트
		
		return storeRevPointAvg.getHost_avg();
	}
}
