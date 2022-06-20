package com.oracle.S20220601.controller.bh;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
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
	//숙소 정보
	@RequestMapping(value = "stayRead")
	public String stayRead(RoomPhotoList roomPhotoList,Model model) {//업체 정보 사진 룸정보 사진
		logger.info("StayController stayRead Start");
		HostStay       		stayRead  			= ss.stayRead(roomPhotoList.getHost_num());
		List<HostPhoto> 	stayPhoto 			= ss.stayPhoto(roomPhotoList.getHost_num());
		List<RoomPhotoList>	roomPhoto			= ss.roomPhoto(roomPhotoList);
		Stay       			stayinfo  			= ss.stayinfo(roomPhotoList.getHost_num());
		List<Review1> 		reviewList 			= ss.reviewList(roomPhotoList.getHost_num());
		Host 				hostreview			=ss.hostreview(roomPhotoList.getHost_num());
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("hostreview", hostreview);
		model.addAttribute("stayinfo", stayinfo);
		model.addAttribute("stay", stayRead);
		model.addAttribute("stayPhoto", stayPhoto);
		model.addAttribute("roomPhoto", roomPhoto);
		model.addAttribute("host_num", roomPhotoList.getHost_num());
		return "bh/stayRead";
	}
	//숙소 등록페이지
	@GetMapping(value = "stayInsertForm") 
	public String stayInsertForm(HttpServletRequest request,Model model) {
		logger.info("StayController stayInsert Start");
		HostStay hostStay = new HostStay();
		List<Code>	 codeList	= ss.codeList(hostStay.getBcd_code());
		model.addAttribute("codeList", codeList);
		return "bh/stayInsertForm";
	}
	//업체,숙소 등록
	@PostMapping(value = "stayInsert") //Host.Stay
	public String stayInsert(HostStay hostStay,Model model,MultipartFile host_photo0,
										  MultipartFile host_photo1,MultipartFile host_photo2,
										  MultipartFile host_photo3,MultipartFile host_photo4,
										  HttpServletRequest request) throws IOException, Exception {
		
		int stayInsert = ss.stayInsert(hostStay);
		
		Map<Integer, MultipartFile> filename     = new HashMap<Integer, MultipartFile>();
		List<HostPhoto>				stayPhotoInsertList = new ArrayList<HostPhoto>();
		HostPhoto					hostPhoto			= new HostPhoto();
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/bh/");
	
		
		filename.put(0, host_photo0);
		filename.put(1, host_photo1);
		filename.put(2, host_photo2);
		filename.put(3, host_photo3);
		filename.put(4, host_photo4);
		
		
		System.out.println("stayPhotoInsert.size()->"+filename.size());
		
		for (int i = 0; i < filename.size(); i++) {
			System.out.println("start  stayPhotoInsert.size()->"+i);
			if (filename.get(i).getSize() != 0) {
				stayPhotoInsertList.add(i,hostPhoto);
				uploadFile(filename.get(i).getOriginalFilename(), filename.get(i).getBytes(), uploadPath);
			}
			System.out.println("end  stayPhotoInsert.size()->"+i);
		}
		
		
		HostPhoto roomPhoto = null;
		System.out.println("업로드할 사진 갯수 --> " + stayPhotoInsertList.size());
		if (stayPhotoInsertList.size() != 0) {
			roomPhoto = ss.stayPhotoInsert(stayPhotoInsertList,filename);
		}
		System.out.println("업로드된 사진 --> " + roomPhoto);
		System.out.println("host->"+stayInsert);
		
		if (stayInsert != 0) {
			model.addAttribute("msg", "숙소 등록 성공");
			model.addAttribute("host_num", stayInsert);
		}else {
			model.addAttribute("msg", "숙소 등록 실패");
		}
		
		
		return "bh/roomInsertForm";
	}
	
	

	
	//객실 등록
	@PostMapping(value = "roomInsert")
	public String roomInsert( Room room,Model model,MultipartFile room_photo0,
						  MultipartFile room_photo1,MultipartFile room_photo2,
						  MultipartFile room_photo3,MultipartFile room_photo4,
						  HttpServletRequest request) throws IOException, Exception {
		
		int roomInsert = ss.roomInsert(room);
		Map<Integer, MultipartFile> filename     = new HashMap<Integer, MultipartFile>();
		List<RoomPhoto>			roomPhotoInsertList = new ArrayList<RoomPhoto>();
		RoomPhoto				roomPhoto			= new RoomPhoto();
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/bh/");
		
		filename.put(0, room_photo0);
		filename.put(1, room_photo1);
		filename.put(2, room_photo2);
		filename.put(3, room_photo3);
		filename.put(4, room_photo4);
		
		for (int i = 0; i < filename.size(); i++) {
			System.out.println("start  roomPhotoInsert.size()->"+i);
			if (filename.get(i).getSize() != 0) {
				roomPhotoInsertList.add(i,roomPhoto);
				uploadFile(filename.get(i).getOriginalFilename(), filename.get(i).getBytes(), uploadPath);
			}
			System.out.println("end  roomPhotoInsert.size()->"+i);
		}
		
		
		int uploadPhoto = 0;
		System.out.println("업로드할 사진 갯수 --> " + roomPhotoInsertList.size());
		if (roomPhotoInsertList.size() != 0) {
			uploadPhoto = ss.roomPhotoInsert(roomPhotoInsertList,filename);
		}
		System.out.println("업로드된 사진 갯수 --> " + uploadPhoto);
		System.out.println("host->"+roomInsert);
		
		model.addAttribute("roomInsert", roomInsert);
		
		if (roomInsert > 0) {
			model.addAttribute("msg", "객실 등록 성공");
		}else {
			model.addAttribute("msg", "객실 등록 실패");
		}
		List<Room> roomList = ss.roomList(room);
		
		if(roomList.size() != 0) {
			System.out.println("roomList->"+roomList);
			for(Room aa:roomList) {
				System.out.println("@@ "+aa.getRoom_name());
			}
			System.out.println("host_num---->>>"+room.getHost_num());
			model.addAttribute("roomList", roomList);
		}
		model.addAttribute("host_num", room.getHost_num());
		
		return "bh/roomInsertForm";
	}
	//리뷰 페이지 
	@GetMapping(value = "reviewInsertForm")
	public String reviewInsertForm(HttpServletRequest request, Res res, Model model) {
		logger.info("StayController reviewInsertForm Start");
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		res.setMem_num(mem_num);
		model.addAttribute("resInfo", res);
		return "bh/reviewInsertForm";
	}
	//리뷰 등록
	@RequestMapping(value = "reviewInsert")
	public String revInsert(Review review,Model model,MultipartFile rev_Photo0,
										  MultipartFile rev_Photo1,MultipartFile rev_Photo2,
										  MultipartFile rev_Photo3,MultipartFile rev_Photo4,
										  HttpServletRequest request) {
		
		System.out.println("hostnum->"+review.getHost_num());
		int revInsert = ss.revInsert(review);
		
		System.out.println(rev_Photo0.getOriginalFilename());
		Map<Integer, MultipartFile> revPhotoInsert     = new HashMap<Integer, MultipartFile>();
		List<MultipartFile>			revPhotoInsertList = new ArrayList<MultipartFile>();
	
		
		revPhotoInsert.put(0, rev_Photo0);
		revPhotoInsert.put(1, rev_Photo1);
		revPhotoInsert.put(2, rev_Photo2);
		revPhotoInsert.put(3, rev_Photo3);
		revPhotoInsert.put(4, rev_Photo4);
		
		
		
		for (int i = 0; i < revPhotoInsert.size(); i++) {
			System.out.println("start  roomPhotoInsert.size()->"+i);
			if (revPhotoInsert.get(i).getSize() != 0) {
				revPhotoInsertList.add(revPhotoInsert.get(i));
			}
			System.out.println("end  roomPhotoInsert.size()->"+i);
		}
		
		Review1 review1 = new Review1();
		review1.setHost_num(review.getHost_num());
		review1.setRevPhotolist(revPhotoInsertList);
		
		int uploadPhoto = 0;
		System.out.println("업로드할 사진 갯수 --> " + revPhotoInsertList.size());
		if (revPhotoInsertList.size() != 0) {
			uploadPhoto = ss.revPhotoInsert(review1);
		}
		System.out.println("업로드된 사진 갯수 --> " + uploadPhoto);
		System.out.println("host->"+revInsert);
		
		model.addAttribute("revInsert", revInsert);
		if (revInsert > 0) {
			model.addAttribute("msg", "객실 등록 성공");
		}else {
			model.addAttribute("msg", "객실 등록 실패");
		}
		
		
		return "bh/reviewInsertForm";
	}
	//예약가능여부 확인
	@PostMapping(value = "respossible")
	@ResponseBody
	public List<Res> respossible(Res res,Model model) {
		
		List<Res> responssible = ss.respossible(res);
		
		return responssible;
	}
	//리뷰 업데이트 페이지
	@GetMapping(value = "reviewUpdateForm")
	public String reviewUpdateForm(HttpServletRequest request,Review1 review,Model model) {
		logger.info("StayController reviewUpdateForm Start");
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		review.setMem_num(mem_num);
		model.addAttribute("reviewUpdateForm", review);
		return "bh/reviewUpdateForm";
	}
	//리뷰 업데이트
//	@RequestMapping(value = "reviewUpdate")
//	public String reviewUpdate(Review1 review, Model model){
//		
//		return reviewUpdate;
//	}
	
	//숙소 업데이트 페이지
	@GetMapping(value = "stayUpdateForm")
	public String stayUpdateForm(int host_num, Model model) {
		System.out.println("StayController stayUpdateForm Start");
		HostStay       		stayRead  			= ss.stayRead(host_num);
		List<HostPhoto> 	stayPhoto 			= ss.stayPhoto(host_num);
		List<Code>	 		codeList			= ss.codeList(stayRead.getBcd_code());
		
		for (int i = 0; i < stayPhoto.size(); i++) {
			System.out.println(stayPhoto.get(i).getHost_photo());
		}
		model.addAttribute("stay", stayRead);
		model.addAttribute("stayPhoto", stayPhoto);
		model.addAttribute("codeList", codeList);
		return "bh/stayUpdateForm";
	}
	
	private String uploadFile(String originalName, byte[] fileData , String uploadPath) 
			  throws Exception {
		 // universally unique identifier 
	     UUID uid = UUID.randomUUID();
	    // requestPath = requestPath + "/resources/image";
	    System.out.println("uploadPath->"+uploadPath);
	    // Directory 생성 
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}
	
		//	    String savedName = uid.toString() + "_" + originalName;
		String savedName = originalName;
	    logger.info("savedName: " + savedName);
	    File target = new File(uploadPath, savedName);
	    //	    File target = new File(requestPath, savedName);
	    FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
	    // Service ---> DAO 연결 
	    return savedName;
	  }
	
	//숙소업데이트
	@RequestMapping(value = "stayUpdate")
	public String stayUpdate(HostStay hostStay,Model model,MultipartFile host_photo0,
							 MultipartFile host_photo1,MultipartFile host_photo2,
							 MultipartFile host_photo3,MultipartFile host_photo4,HttpServletRequest request) throws IOException, Exception {
		
		System.out.println("StoreController stayUpdate Start..");
		
		int stayUpdate = ss.stayUpdate(hostStay);
		
		List<HostPhoto>     stayPhoto 	   = ss.stayPhoto(hostStay.getHost_num());//식당사진
		for (int i = 0; i < stayPhoto.size(); i++) {
			System.out.println(stayPhoto.get(i).getHost_photo());
		}
		
		Map<Integer, MultipartFile> fileName     = new HashMap<Integer, MultipartFile>();
		List<HostPhoto>			    stayPhotoInsertList = new ArrayList<HostPhoto>();
		HostPhoto                   hostPhoto            = new HostPhoto();
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/bh/");
		
		int x = 0;
		if (host_photo0.getSize() != 0) {fileName.put(x, host_photo0); x += 1;}
		if (host_photo1.getSize() != 0) {fileName.put(x, host_photo1); x += 1;}
		if (host_photo2.getSize() != 0) {fileName.put(x, host_photo2); x += 1;}
		if (host_photo3.getSize() != 0) {fileName.put(x, host_photo3); x += 1;}
		if (host_photo4.getSize() != 0) {fileName.put(x, host_photo4); x += 1;}
		System.out.println("x --> " + x);
		
		for (int i = 0; i < fileName.size(); i++) {
			if (fileName.get(i).getSize() != 0) {
				stayPhotoInsertList.add(i, hostPhoto);
				uploadFile(fileName.get(i).getOriginalFilename(), fileName.get(i).getBytes(), uploadPath);
			}
		}
		
		
		
		
		
		//하다가 끊김
		
		return "";
		
	}
}
