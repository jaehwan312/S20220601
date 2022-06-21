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
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.service.ih.CodeService;
import com.oracle.S20220601.service.ih.MenuSeivice;
import com.oracle.S20220601.service.ih.ReviewService;
import com.oracle.S20220601.service.ih.StorePhotoService;
import com.oracle.S20220601.service.ih.StoreService;
import com.oracle.S20220601.service.js.ProfileService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Autowired	private StoreService      storeService;      @Autowired	private CodeService       codeService;
	@Autowired	private StorePhotoService storePhotoService; @Autowired	private MenuSeivice 	  menuSeivice;
	@Autowired	private ReviewService     reviewService;	 @Autowired	private ProfileService    profileService;
	
//====================================식당정보 불러오기================================================================  
	@GetMapping(value = "storeRead")//식당상세정보
	public String storeRead(int host_num, Model model, HttpSession session, HttpServletRequest request) {
		
		logger.info("StoreController storeRead Start..");
		
		session     = request.getSession();
		int mem_num = 0;
		if (session.getAttribute("mem_num") == null) {
			mem_num = 0;
		}else {
			mem_num = (int) session.getAttribute("mem_num"); //로그이 성공시 회원번호 값
		}
		
		
		
		System.out.println("현재 로그인한 mem_num --> " + mem_num);
		
		//DB에서 받아올 정보들
		HostStore       storeRead  	   = storeService.storeRead(host_num);      //식당정보
		List<HostPhoto> storePhoto 	   = storePhotoService.storePhoto(host_num);//식당사진
		List<Menu>      menuList   	   = menuSeivice.menuList(host_num);        //메뉴정보
		Code      		foodcode   	   = codeService.foodcode(storeRead);	 	//음식종류
		List<Review>    revList   	   = reviewService.revList(host_num);		//리뷰
		HostStore 		storeRevcount  = storeService.storeRead(host_num);		//리뷰갯수
		
		
		if (mem_num != 0) {
			Profile     profile        = profileService.selectProfile(mem_num); //회원정보 불러오기
			String		maxReviewDate  = reviewService.maxReviewDate(host_num,mem_num);
			model.addAttribute("name", profile.getName());
			model.addAttribute("userphoto",profile.getPhoto());
			model.addAttribute("maxReviewDate",maxReviewDate);
			
		}
		
		
		if (revList.size() != 0) {
			List<RevPhoto>	revPhotos  = reviewService.storeRevPhoto(revList);  //리뷰 사진
			model.addAttribute("revPhotos", revPhotos);
			
			Profile     profile        = profileService.selectProfile(mem_num); //회원정보 불러오기
			String		maxReviewDate  = reviewService.maxReviewDate(host_num,mem_num);
			
			for (int i = 0; i < revList.size(); i++) {
				revList.get(i).setPhoto(profileService.selectProfile(revList.get(i).getMem_num()).getPhoto());
				revList.get(i).setName(profileService.selectProfile(revList.get(i).getMem_num()).getName());
			}
			
		}
		
		//view로 보여질 정보들
		model.addAttribute("store",storeRead);
		model.addAttribute("storePhoto",storePhoto);
		model.addAttribute("menuList",menuList);
		model.addAttribute("foodcode",foodcode);
		model.addAttribute("revList", revList);
		model.addAttribute("storeRevcount", storeRevcount);
		model.addAttribute("mem_num", mem_num);
		
		return "ih/storeRead";
	}
	
	
//==========================식당 등록 페이지로 이동=============================================	
	@GetMapping(value = "storeInsertForm")//insertForm 이동
	public String storeInsertForm(Model model, HttpServletRequest request) {
		
		logger.info("StoreController storeInsertForm Start..");
		
		//식당의 음식 코드 리스트
		HostStore  hostStore 	= new HostStore();
		List<Code> foodcodeList = codeService.foodcodeList(hostStore.getBcd_code());
		
		model.addAttribute("foodcodeList",foodcodeList);
		
		return "ih/storeInsertForm";
	}
	
	
	
	
//====================================식당정보 등록==================================================	  
	@PostMapping(value = "storeInsert")//식당정보 insert
	public String storeInsert(HostStore     hostStore,       Menu menu ,   Model model,
							  MultipartFile host_photo0,     MultipartFile host_photo1,       
							  MultipartFile host_photo2,     MultipartFile host_photo3,      
							  MultipartFile host_photo4,     HttpServletRequest request) throws Exception {
		
		System.out.println("StoreController storeInsert Start..");
		//식당정보 등록(DB저장)
		int storeInsert  = storeService.storeInsert(hostStore);
		
		System.out.println("storeInsert --> " + storeInsert);
		
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
		Map<Integer, MultipartFile> fileName     = new HashMap<Integer, MultipartFile>();
		List<HostPhoto>			    storePhotoInsertList = new ArrayList<HostPhoto>();
		HostPhoto                   hostPhoto            = new HostPhoto();
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/ih/");
	    
	    //사진 이름 put
		fileName.put(0, host_photo0);
		fileName.put(1, host_photo1);
		fileName.put(2, host_photo2);
		fileName.put(3, host_photo3);
		fileName.put(4, host_photo4);
		System.out.println(hostStore.getHost_num());
		//업로드한 사진 갯수 확인 및 Null값 입력 방지
		for (int i = 0; i < fileName.size(); i++) {
			if (fileName.get(i).getSize() != 0) {
				storePhotoInsertList.add(i, hostPhoto);
				uploadFile(fileName.get(i).getOriginalFilename(), fileName.get(i).getBytes(), uploadPath);
			}
		}
		
		//사진 이름 DB저장
		System.out.println("업로드할 사진 갯수 --> " + storePhotoInsertList.size());
		int uploadPhoto = 0;
		if (storePhotoInsertList.size() != 0) {
			uploadPhoto = storePhotoService.storePhotoInsert(storePhotoInsertList,fileName);
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

//====================================파일 업로드==================================================	  
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

	  
//====================================식당정보 업데이트==================================================	  
	@GetMapping(value = "storeUpdateForm")
	public String storeUpdateForm(int host_num, Model model) {
		
		System.out.println("StoreController storeUpdateForm Start...");
		HostStore       storeRead  	   = storeService.storeRead(host_num);      //식당정보
		List<HostPhoto> storePhoto 	   = storePhotoService.storePhoto(host_num);//식당사진
		List<Menu>      menuList   	   = menuSeivice.menuList(host_num);        //메뉴정보
		List<Code> 	    foodcodeList   = codeService.foodcodeList(storeRead.getBcd_code());
		
		for (int i = 0; i < storePhoto.size(); i++) {
			System.out.println(storePhoto.get(i).getHost_photo());
		}
		
		model.addAttribute("store",storeRead);
		model.addAttribute("storePhoto",storePhoto);
		model.addAttribute("menuList",menuList);
		model.addAttribute("foodcode",foodcodeList);
		
		return "ih/storeUpdateForm";
	}
	
	@PostMapping(value = "storeUpdate")
	public String storeUpdate(HostStore     hostStore,       Menu menu ,   Model model,
							  MultipartFile host_photo0,     MultipartFile host_photo1,       
							  MultipartFile host_photo2,     MultipartFile host_photo3,      
							  MultipartFile host_photo4,     HttpServletRequest request) throws Exception {
		
		System.out.println("StoreController storeUpdate Start..");
	
		//식당정보 등록(DB저장)
		int storeUpdate  = storeService.storeUpdate(hostStore);
		
		

		List<Menu>      menuList   	   = menuSeivice.menuList(hostStore.getHost_num()); 
		//등록할 메뉴 List 변환
		List<Menu> menus = new ArrayList<Menu>();
		int menuDelete = 0;
		for (int i = 0; i < menu.getMenu_list().size(); i++) {
			menu.getMenu_list().get(i).setHost_num(hostStore.getHost_num());
			System.out.println("menu_num --> " + menu.getMenu_list().get(i).getIn_menu_num());
			System.out.println("host_num --> " + menu.getMenu_list().get(i).getIn_host_num());
			System.out.println("menu_name --> " + menu.getMenu_list().get(i).getIn_menu_name());	
			System.out.println("menu_price --> " + menu.getMenu_list().get(i).getIn_menu_price());
			menus.add(menu.getMenu_list().get(i));
		}
		
		//메뉴 삭제
		for (int i = 0; i < menuList.size(); i++) {
			System.out.println("업데이트전" + i + "번째 메뉴 번호" + menuList.get(i).getMenu_num());
			if(menu.getMenu_list().size() <= i){
				System.out.println(i + "번째 메뉴 삭제");
				menuDelete = menuSeivice.menuDelete(menuList.get(i).getMenu_num());
			}else if(menu.getMenu_list().size() >= i) {
				if (menuList.get(i).getMenu_num() != menu.getMenu_list().get(i).getIn_menu_num()) {
					menuDelete = menuSeivice.menuDelete(menuList.get(i).getMenu_num());
				}
			}
		}
		
		
		
		//메뉴 등록(DB저장)
		int menuUpdate = menuSeivice.menuUpdate(menus);		
		

		
		//현재 등록 되어 있는 사진
		List<HostPhoto>     storePhoto 	   = storePhotoService.storePhoto(hostStore.getHost_num());//식당사진
		for (int i = 0; i < storePhoto.size(); i++) {
			System.out.println(storePhoto.get(i).getHost_photo());
		}
		
		//저장할 사진 Map저장 및 리스트 변환 및 업로드
		Map<Integer, MultipartFile> fileName     = new HashMap<Integer, MultipartFile>();
		List<HostPhoto>			    storePhotoInsertList = new ArrayList<HostPhoto>();
		HostPhoto                   hostPhoto            = new HostPhoto();
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/ih/");
	    
		
		//사진 이름 put
		int x = 0;
		if (host_photo0.getSize() != 0) {fileName.put(x, host_photo0); x += 1;}
		if (host_photo1.getSize() != 0) {fileName.put(x, host_photo1); x += 1;}
		if (host_photo2.getSize() != 0) {fileName.put(x, host_photo2); x += 1;}
		if (host_photo3.getSize() != 0) {fileName.put(x, host_photo3); x += 1;}
		if (host_photo4.getSize() != 0) {fileName.put(x, host_photo4); x += 1;}
		System.out.println("x --> " + x);
		
		//업로드한 사진 갯수 확인 및 Null값 입력 방지
		for (int i = 0; i < fileName.size(); i++) {
			if (fileName.get(i).getSize() != 0) {
				storePhotoInsertList.add(i, hostPhoto);
				uploadFile(fileName.get(i).getOriginalFilename(), fileName.get(i).getBytes(), uploadPath);
			}
		}
		System.out.println("fileName.size() --> " + fileName.size());
		for (int i = 0; i < fileName.size(); i++) {
			System.out.println(fileName.get(i).getSize());
		}
		
		//사진 이름 DB저장
		  System.out.println("업로드할 사진 갯수 --> " + storePhotoInsertList.size());
		  int uploadPhoto = 0; 
		  if (storePhotoInsertList.size() != 0) {uploadPhoto =  storePhotoService.storePhotoUpdate(storePhotoInsertList,fileName,hostStore.getHost_num());}
		  System.out.println("업로드된 사진 갯수 --> " + uploadPhoto);
		  
		//식당정보 등록 요청 확인 msg 보냄
		if (storeUpdate > 0 || menuUpdate > 0 || uploadPhoto > 0) {
			model.addAttribute("msg", "등록 요청 성공");
		}else {
			model.addAttribute("msg", "등록 요청 실패");
		}
		
		
		return "ih/test";
	}
}
