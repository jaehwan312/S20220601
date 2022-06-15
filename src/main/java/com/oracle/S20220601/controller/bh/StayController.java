package com.oracle.S20220601.controller.bh;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Room;
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
		logger.info("StayController stayRead Start");
		HostStay       		stayRead  			= ss.stayRead(roomPhotoList.getHost_num());
		List<HostPhoto> 	stayPhoto 			= ss.stayPhoto(roomPhotoList.getHost_num());
		List<RoomPhotoList>	roomPhoto			= ss.roomPhoto(roomPhotoList);
		Stay       	stayinfo  		= ss.stayinfo(roomPhotoList.getHost_num());
		List<Review1> reviewList = ss.reviewList(roomPhotoList.getHost_num());
		Host hostreview	=ss.hostreview(roomPhotoList.getHost_num());
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("hostreview", hostreview);
		model.addAttribute("stayinfo", stayinfo);
		model.addAttribute("stay", stayRead);
		model.addAttribute("stayPhoto", stayPhoto);
		model.addAttribute("roomPhoto", roomPhoto);
		return "bh/stayRead";
	}
	
//	@PostMapping(value = "stayinfo")
//	public String stayinfo(@RequestParam int host_num, Model model) {//업소 기본정보
//		logger.info("StayController stayinfo Start");
//		System.out.println("host_num --> " + host_num);
//		Stay       	stayinfo  		= ss.stayinfo(host_num);
//		model.addAttribute("stayinfo", stayinfo);
//		
//		return "bh/stayRead";
//	}
	
//	@RequestMapping(value = "reviewList")
//	public String reviewList(Review1 review, Model model) {// 숙소 리뷰
//		logger.info("StayController reviwList Start");
//		List<Review1> reviewList = ss.reviewList(review.getHost_num());
//		Host hostreview	=ss.hostreview(review.getHost_num());
//		model.addAttribute("reviewList", reviewList);
//		model.addAttribute("hostreview", hostreview);
//		return "bh/stayRead";
//	}
	
	
	@GetMapping(value = "stayInsertForm") //숙소 등록페이지
	public String stayInsertForm(HttpServletRequest request,Model model) {
		logger.info("StayController stayInsert Start");
		HostStay hostStay = new HostStay();
		List<Code>	 codeList	= ss.codeList(hostStay.getBcd_code());
		model.addAttribute("codeList", codeList);
		return "bh/stayInsertForm";
	}
	
	@PostMapping(value = "stayInsert") //Host.Stay
	public String stayInsert(HostStay hostStay,Model model,MultipartFile host_photo0,
										  MultipartFile host_photo1,MultipartFile host_photo2,
										  MultipartFile host_photo3,MultipartFile host_photo4) {
		int stayInsert = ss.stayInsert(hostStay);
		
		System.out.println(host_photo0.getOriginalFilename());
		System.out.println(host_photo1.getOriginalFilename());
		System.out.println(host_photo2.getOriginalFilename());
		System.out.println(host_photo3.getOriginalFilename());
		System.out.println(host_photo4.getOriginalFilename());
		
	
		Map<Integer, MultipartFile> stayPhotoInsert     = new HashMap<Integer, MultipartFile>();
		List<MultipartFile>			stayPhotoInsertList = new ArrayList<MultipartFile>();
	
		
		stayPhotoInsert.put(0, host_photo0);
		stayPhotoInsert.put(1, host_photo1);
		stayPhotoInsert.put(2, host_photo2);
		stayPhotoInsert.put(3, host_photo3);
		stayPhotoInsert.put(4, host_photo4);
		
		
		System.out.println("stayPhotoInsert.size()->"+stayPhotoInsert.size());
		
		for (int i = 0; i < stayPhotoInsert.size(); i++) {
			System.out.println("start  stayPhotoInsert.size()->"+i);
			if (stayPhotoInsert.get(i).getSize() != 0) {
				stayPhotoInsertList.add(stayPhotoInsert.get(i));
			}
			System.out.println("end  stayPhotoInsert.size()->"+i);
		}
		
		
		HostPhoto roomPhoto = null;
		System.out.println("업로드할 사진 갯수 --> " + stayPhotoInsertList.size());
		if (stayPhotoInsertList.size() != 0) {
			roomPhoto = ss.stayPhotoInsert(stayPhotoInsertList);
		}
		System.out.println("업로드된 사진 --> " + roomPhoto);
		System.out.println("host->"+stayInsert);
		System.out.println("room->");
		
		if (stayInsert != 0) {
			model.addAttribute("msg", "성공");
			model.addAttribute("host_num", stayInsert);
		}else {
			model.addAttribute("msg", "실패");
		}
		
		
		return "bh/roomInsertForm";
	}
	
	
	
	
	
	
	@PostMapping(value = "roomInsert")
	public String roomInsert( Room room,Model model,MultipartFile room_photo0,
						  MultipartFile room_photo1,MultipartFile room_photo2,
						  MultipartFile room_photo3,MultipartFile room_photo4) {
		
		int roomInsert = ss.roomInsert(room);
		
		Map<Integer, MultipartFile> roomPhotoInsert     = new HashMap<Integer, MultipartFile>();
		List<MultipartFile>			roomPhotoInsertList = new ArrayList<MultipartFile>();
	
		
		roomPhotoInsert.put(0, room_photo0);
		roomPhotoInsert.put(1, room_photo1);
		roomPhotoInsert.put(2, room_photo2);
		roomPhotoInsert.put(3, room_photo3);
		roomPhotoInsert.put(4, room_photo4);
		
		for (int i = 0; i < roomPhotoInsert.size(); i++) {
			System.out.println("start  roomPhotoInsert.size()->"+i);
			if (roomPhotoInsert.get(i).getSize() != 0) {
				roomPhotoInsertList.add(roomPhotoInsert.get(i));
			}
			System.out.println("end  roomPhotoInsert.size()->"+i);
		}
		
		
		int uploadPhoto = 0;
		System.out.println("업로드할 사진 갯수 --> " + roomPhotoInsertList.size());
		if (roomPhotoInsertList.size() != 0) {
			uploadPhoto = ss.roomPhotoInsert(roomPhotoInsertList);
		}
		System.out.println("업로드된 사진 갯수 --> " + uploadPhoto);
		System.out.println("host->"+roomInsert);
		
		
		if (roomInsert > 0) {
			model.addAttribute("msg", "성공");
		}else {
			model.addAttribute("msg", "실패");
		}
		return "bh/test1";
		
	}
}
