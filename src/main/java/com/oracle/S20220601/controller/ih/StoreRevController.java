package com.oracle.S20220601.controller.ih;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oracle.S20220601.model.Review;
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
	public float storeRevPointAvg(int host_num) {
		
		System.out.println("StoreRevController storeRevPointAvg Start...");
		HostStore storeRevPointAvg  = storeService.storeRead(host_num);
//		float storeRevPointAvg = reviewService.storeRevPointAvg(host_num);//삭제시 평점    업데이트
		
		return storeRevPointAvg.getHost_avg();
	}
	
	
	
	@ResponseBody //식당리뷰 작성
	@PostMapping(value = "storeRevInsert" )
	public StoreReview storeRevInsert(StoreReview review, HttpServletRequest request, 
							  MultipartHttpServletRequest  filelist,
							  @RequestParam HashMap<Object, Object> param
							 ) throws Exception {
		
		System.out.println("StoreRevController storeRevInsert Start...");
		
		System.out.println(review.getHost_num());
		System.out.println(review.getMem_num());
		System.out.println(review.getRev_num());
		System.out.println(review.getRev_content());
		System.out.println(review.getRev_point());
//		리뷰저장
		int storeRevInsert = reviewService.storeUserRevInsert(review);
		
		
//		리뷰 사진 등록
		Map<Integer,MultipartFile> RevPhotoInsert     = new HashMap<Integer, MultipartFile>();
		List<StoreReview>    	   RevPhotoInsertList = new ArrayList<StoreReview>();
		Iterator<String>           iter				  = filelist.getFileNames(); 
		MultipartFile    	       revFileName		  = null; 
		String 				 	   fieldName          = "";
		String 			  	 	   uploadPath  		  = request.getSession().getServletContext().getRealPath("/images/ih/");
	    int i = 0;
	    while (iter.hasNext()) { 
	        fieldName   = (String) iter.next(); //파일이름
	        revFileName = filelist.getFile(fieldName);  //저장된 파일 객체
	        RevPhotoInsert.put(i, revFileName);
			System.out.println("revFileName --> " + revFileName.getOriginalFilename());
			++i;
	    }
		
	  //업로드한 사진 갯수 확인 및 Null값 입력 방지
  		for (int j = 0; j < RevPhotoInsert.size(); j++) {
  			if (RevPhotoInsert.get(j).getSize() != 0) {
  				RevPhotoInsertList.add(j,review);
  				uploadFile(RevPhotoInsert.get(j).getOriginalFilename(), RevPhotoInsert.get(j).getBytes(), uploadPath);
  			}
  		}
	    
		//사진 이름 DB저장
		System.out.println("업로드할 사진 갯수 --> " + RevPhotoInsertList.size());
		int uploadPhoto = 0;
		if (RevPhotoInsertList.size() != 0) {
			uploadPhoto = reviewService.storeRevPhotoInsert(RevPhotoInsertList,RevPhotoInsert);
		}
		
		System.out.println("업로드된 사진 갯수 --> " + uploadPhoto);
		
		
		StoreReview reviewSelect = reviewService.reviewSelect(storeRevInsert);
		
		//System.out.println(" reviewSelect --> " + reviewSelect.getRev_content());
		
		
		return reviewSelect;
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
	
		//String savedName = uid.toString() + "_" + originalName;
		String savedName = originalName;
	    logger.info("savedName: " + savedName);
	    File target = new File(uploadPath, savedName);
	    //File target = new File(requestPath, savedName);
	    FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
	    // Service ---> DAO 연결 
	    return savedName;
	  }	


		
	@ResponseBody //식당리뷰 답글 작성
	@PostMapping(value = "hostRevInsert" )
	public int hostRevInsert(@RequestBody Review review) {
		
		System.out.println("StoreRevController hostRevInsert Start...");
		
		System.out.println(review.getHost_num());
		System.out.println(review.getMem_num());
		System.out.println(review.getRev_num());
		System.out.println(review.getRev_content());
		
//			답변등록
		int hostRevInsert = reviewService.hostRevInsert(review);
		System.out.println("답글의 rev_num ==> " + hostRevInsert);
		return hostRevInsert;
	}
	
	
	@ResponseBody //식당리뷰 답글 작성
	@PostMapping(value = "hostRevDelete" )
	public int hostRevDelete(@RequestBody Review review) {
		
		System.out.println("StoreRevController hostRevDelete Start...");
		
		System.out.println(review.getHost_num());
		System.out.println(review.getMem_num());
		System.out.println(review.getRev_num());
		System.out.println(review.getRev_content());
		
//			답변 삭제
		int hostRevDelete = reviewService.hostRevDelete(review);
		
		
		return hostRevDelete;
	}
}
