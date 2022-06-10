package com.oracle.S20220601.controller.ih;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.service.ih.CodeService;
import com.oracle.S20220601.service.ih.MenuSeivice;
import com.oracle.S20220601.service.ih.ReviewService;
import com.oracle.S20220601.service.ih.StorePhotoService;
import com.oracle.S20220601.service.ih.StoreService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Autowired
	private StoreService      storeService;
	@Autowired
	private CodeService       codeService;
	@Autowired
	private StorePhotoService storePhotoService;
	@Autowired
	private MenuSeivice 	  menuSeivice;
	@Autowired
	private ReviewService     reviewService;
	 
	@GetMapping(value = "storeRead")//식당상세정보
	public String storeRead(int host_num, Model model, HttpSession session, HttpServletRequest request) {
		logger.info("StoreController storeRead Start..");
		session = request.getSession();
		System.out.println("----------------------->> mem_num "+ session.getAttribute("mem_num"));
		
		HostStore       storeRead  	   = storeService.storeRead(host_num);      //식당정보
		List<HostPhoto> storePhoto 	   = storePhotoService.storePhoto(host_num);//식당사진
		List<Menu>      menuList   	   = menuSeivice.menuList(host_num);        //메뉴정보
		Code      		foodcode   	   = codeService.foodcode(storeRead);	 	//음식종류
		List<Review>    revList   	   = reviewService.revList(host_num);		//리뷰
		HostStore 		storeRevcount  = storeService.storeRead(host_num);		//리뷰갯수
		
		if (revList.size() != 0) {
			List<RevPhoto>	revPhotos  = reviewService.storeRevPhoto(revList);  //리뷰 사진
			model.addAttribute("revPhotos", revPhotos);
		}
		session = request.getSession();
		int mem_num = (int) session.getAttribute("mem_num");
		System.out.println("현재 mem_num --> " + mem_num);
		System.out.println();
		model.addAttribute("store",storeRead);
		model.addAttribute("storePhoto",storePhoto);
		model.addAttribute("menuList",menuList);
		model.addAttribute("foodcode",foodcode);
		model.addAttribute("revList", revList);
		
		return "ih/storeRead";
	}
	
	@GetMapping(value = "storeInsertForm")//insertForm 이동
	public String storeInsertForm(Model model, HttpServletRequest request) {
		
		logger.info("StoreController storeInsertForm Start..");
		
		//식당의 음식 코드 리스트
		HostStore  hostStore 	= new HostStore();
		List<Code> foodcodeList = codeService.foodcodeList(hostStore.getBcd_code());
		
		model.addAttribute("foodcodeList",foodcodeList);
		
		return "ih/storeInsertForm";
	}
	
	
	@PostMapping(value = "storeInsert")//식당정보 insert
	public String storeInsert(HostStore     hostStore,       Menu menu ,   Model model,
							  MultipartFile host_photo0,     MultipartFile host_photo1,       
							  MultipartFile host_photo2,     MultipartFile host_photo3,      
							  MultipartFile host_photo4,     HttpServletRequest request) throws Exception {
		System.out.println("StoreController storeInsert Start..");
		
		//식당정보 등록(DB저장)
		int storeInsert = storeService.storeInsert(hostStore);
		
		//등록할 메뉴 List 변환
		List<Menu> menus = new ArrayList<Menu>();
		for (int i = 0; i < menu.getMenu_list().size(); i++) {
//			System.out.println("menu_name --> " + menu.getMenu_list().get(i).getMenu_name());	
//			System.out.println("menu_price --> " + menu.getMenu_list().get(i).getMenu_price());
			menus.add(menu.getMenu_list().get(i));
		}
		
		//메뉴 등록(DB저장)
		int menuInsert = menuSeivice.menuInsertList(menus);
		System.out.println("추가한 메뉴 갯수 --> " + menuInsert);
		
		//저장할 사진 Map저장 및 리스트 변환 및 업로드
		Map<Integer, MultipartFile> storePhotoInsert     = new HashMap<Integer, MultipartFile>();
		List<MultipartFile>			storePhotoInsertList = new ArrayList<MultipartFile>();
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/ih/");
	    
	    //사진 이름 put
		storePhotoInsert.put(0, host_photo0);
		storePhotoInsert.put(1, host_photo1);
		storePhotoInsert.put(2, host_photo2);
		storePhotoInsert.put(3, host_photo3);
		storePhotoInsert.put(4, host_photo4);
		
		//업로드한 사진 갯수 확인 및 Null값 입력 방지
		for (int i = 0; i < storePhotoInsert.size(); i++) {
			if (storePhotoInsert.get(i).getSize() != 0) {
				storePhotoInsertList.add(storePhotoInsert.get(i));
				uploadFile(storePhotoInsert.get(i).getOriginalFilename(), storePhotoInsert.get(i).getBytes(), uploadPath);
			}
		}
		
		//사진 이름 DB저장
		System.out.println("업로드할 사진 갯수 --> " + storePhotoInsertList.size());
		int uploadPhoto = 0;
		if (storePhotoInsertList.size() != 0) {
			uploadPhoto = storePhotoService.storePhotoInsert(storePhotoInsertList);
		}
		System.out.println("업로드된 사진 갯수 --> " + uploadPhoto);
		
		
		//식당정보 등록 요청 확인 msg 보냄
		if (storeInsert > 0 && menuInsert > 0) {
			model.addAttribute("msg", "등록 요청 성공");
		}else {
			model.addAttribute("msg", "등록 요청 실패");
		}
		
		return "ih/test"; //현재 리스트가 존재 하지 않으 므로 test으로 이동
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
