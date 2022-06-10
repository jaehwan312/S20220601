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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		model.addAttribute("stay", stayRead);
		model.addAttribute("stayPhoto", stayPhoto);
		model.addAttribute("roomPhoto", roomPhoto);
		return "bh/stayRead";
	}
	
	@RequestMapping(value = "stayInfo")
	public String stayinfo(int host_num, Model model) {//업소 기본정보
		logger.info("StayController stayinfo Start");
		Stay       	stayinfo  		= ss.stayinfo(host_num);
		model.addAttribute("stay", stayinfo);
		
		return "bh/roomInfo";
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
		
//		if(host_photo0.getOriginalFilename()!=null) {
//			stayPhotoInsert.put(0, host_photo0);
//		}
//		if(host_photo1.getOriginalFilename()!=null) {
//			stayPhotoInsert.put(1, host_photo1);
//		}
//		if(host_photo2.getOriginalFilename()!=null) {
//			stayPhotoInsert.put(2, host_photo2);
//		}
//		if(host_photo3.getOriginalFilename()!=null) {
//			stayPhotoInsert.put(3, host_photo3);
//		}
//		if((host_photo4.getOriginalFilename().length() > 0 ) ) {
//			System.out.println("stayInsert host_photo4 무언가 있음  ");
//			System.out.println("stayInsert host_photo4 !=null host_photo4.getOriginalFilename()->"+host_photo4.getOriginalFilename());
//			stayPhotoInsert.put(4, host_photo4);
//		} else {
//			System.out.println("stayInsert host_photo4  NULL 또는 없음 ");
//		}
		
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
		
		
		int uploadPhoto = 0;
		System.out.println("업로드할 사진 갯수 --> " + stayPhotoInsertList.size());
		if (stayPhotoInsertList.size() != 0) {
			uploadPhoto = ss.stayPhotoInsert(stayPhotoInsertList);
		}
		System.out.println("업로드된 사진 갯수 --> " + uploadPhoto);
		
		
		if (stayInsert > 0) {
			model.addAttribute("msg", "성공");
		}else {
			model.addAttribute("msg", "실패");
		}
		
		
		return "bh/roomInsertForm";
	}
	
	@GetMapping(value = "roomInsertForm")
	
	
	
	
	@PostMapping(value = "roomInsert")
	public String roomInsert( HttpServletRequest request,Room room,Model model,MultipartFile stay_photo0,
			  MultipartFile stay_photo1,MultipartFile stay_photo2,
			  MultipartFile stay_photo3,MultipartFile stay_photo4) {
		int roomInsert = ss.roomInsert(room);
		
		if (roomInsert > 0) {
			model.addAttribute("msg", "성공");
		}else {
			model.addAttribute("msg", "실패");
		}
		return "bh/test";
		
	}
}
