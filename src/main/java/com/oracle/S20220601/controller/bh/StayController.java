package com.oracle.S20220601.controller.bh;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
import com.oracle.S20220601.model.bh.HostStay;
import com.oracle.S20220601.service.bh.StayService;

@Controller
public class StayController {	//숙소 Controller
	
	private static final Logger logger = LoggerFactory.getLogger(StayController.class);
	
	@Autowired
	private StayService ss;
	
	@RequestMapping(value = "stayRead")
	public String stayRead(RoomPhoto roomPhoto,Model model) {
		logger.info("StayController stayList Start");
		HostStay       	stayRead  		= ss.stayRead(roomPhoto.getHost_num());
		System.out.println("stayRead roomPhoto.getHost_num()->"+roomPhoto.getHost_num());
		List<HostPhoto> stayPhoto 		= ss.stayPhoto(roomPhoto.getHost_num());
		List<Room>      roomList   		= ss.roomList(roomPhoto.getHost_num());
		List<RoomPhoto>	roomPhotoList	= ss.roomPhotoList(roomPhoto);
		model.addAttribute("stay", stayRead);
		model.addAttribute("stayPhoto", stayPhoto);
		model.addAttribute("room", roomList);
		model.addAttribute("roomPhoto", roomPhotoList);
		return "bh/stayRead";
	}
	
	
		
		
	
}
