package com.oracle.S20220601.controller.bh;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.model.bh.HostStay;
import com.oracle.S20220601.model.bh.Review1;
import com.oracle.S20220601.model.bh.RoomPhotoList;
import com.oracle.S20220601.service.bh.StayService;

@Controller
public class StayController {	//숙소 Controller
	
	private static final Logger logger = LoggerFactory.getLogger(StayController.class);
	
	@Autowired
	private StayService ss;
	
	@RequestMapping(value = "stayRead")
	public String stayRead(RoomPhotoList roomPhotoList,Model model) {//업체 정보 사진 룸정보 사진
		logger.info("StayController stayList Start");
		HostStay       		stayRead  			= ss.stayRead(roomPhotoList.getHost_num());
		List<HostPhoto> 	stayPhoto 			= ss.stayPhoto(roomPhotoList.getHost_num());
		List<RoomPhotoList>	roomPhoto			= ss.roomPhoto(roomPhotoList);
		
		model.addAttribute("stay", stayRead);
		model.addAttribute("stayPhoto", stayPhoto);
		model.addAttribute("roomPhoto", roomPhoto);
		return "bh/stayRead";
	}
	
	@RequestMapping(value = "stayinfo")
	public String stayinfo(int host_num, Model model) {//업소 기본정보
		logger.info("StayController stayinfo Start");
		Stay       	stayinfo  		= ss.stayinfo(host_num);
		model.addAttribute("stay", stayinfo);
		
		return "bh/roominfo";
	}
	
	@RequestMapping(value = "reviewList")
	public String reviewList(Review1 review, Model model) {// 숙소 리뷰
		logger.info("StayController reviwList Start");
		List<Review1> reviewList = ss.reviewList(review.getHost_num());
		Host hostreview	=ss.hostreview(review.getHost_num());
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("hostreview", hostreview);
		return "bh/reviewList";
	}
		
	
}
