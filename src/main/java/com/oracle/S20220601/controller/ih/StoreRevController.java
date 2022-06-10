package com.oracle.S20220601.controller.ih;

import java.io.File;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.RevPhoto;
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
	
	@ResponseBody
	@PostMapping(value = "storeRevInsert")
	public int storeRevInsert(StoreReview review, RevPhoto photo, HttpServletRequest request,MultipartFile store_rev_photo0,
							  MultipartFile store_rev_photo1,MultipartFile store_rev_photo2,
							  MultipartFile store_rev_photo3,MultipartFile store_rev_photo4) throws Exception {
		
		System.out.println("StoreRevController storeRevInsert Start...");
		int storeRevDel = reviewService.storeUserRevInsert(review);
		
		
		Map<Integer, MultipartFile> storeRevPhotoInsert     = new HashMap<Integer, MultipartFile>();
		List<MultipartFile>			storeRevPhotoInsertList = new ArrayList<MultipartFile>();
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/ih/");
	    
	    //사진 이름 put
		storeRevPhotoInsert.put(0, store_rev_photo0);
		storeRevPhotoInsert.put(1, store_rev_photo1);
		storeRevPhotoInsert.put(2, store_rev_photo2);
		storeRevPhotoInsert.put(3, store_rev_photo3);
		storeRevPhotoInsert.put(4, store_rev_photo4);
		
		//업로드한 사진 갯수 확인 및 Null값 입력 방지
		for (int i = 0; i < storeRevPhotoInsert.size(); i++) {
			if (storeRevPhotoInsert.get(i).getSize() != 0) {
				storeRevPhotoInsertList.add(storeRevPhotoInsert.get(i));
				uploadFile(storeRevPhotoInsert.get(i).getOriginalFilename(), storeRevPhotoInsert.get(i).getBytes(), uploadPath);
			}
		}
		
		//사진 이름 DB저장
		System.out.println("업로드할 사진 갯수 --> " + storeRevPhotoInsertList.size());
		int uploadPhoto = 0;
		if (storeRevPhotoInsertList.size() != 0) {
			uploadPhoto = reviewService.storeRevPhotoInsert(storeRevPhotoInsertList);
		}
		System.out.println("업로드된 사진 갯수 --> " + uploadPhoto);
		return 0;
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
}
