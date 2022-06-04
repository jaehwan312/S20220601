package com.oracle.S20220601.controller.ih;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.service.ih.CodeService;
import com.oracle.S20220601.service.ih.MenuSeivice;
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
	
	 
	@GetMapping(value = "storeRead")//식당상세정보
	public String storeRead(int host_num, Model model) {
		logger.info("StoreController storeRead Start..");
		
		HostStore       storeRead  = storeService.storeRead(host_num);
		List<HostPhoto> storePhoto = storePhotoService.storePhoto(host_num);
		List<Menu>      menuList   = menuSeivice.menuList(host_num);
		Code      		foodcode   = codeService.foodcode(storeRead);
		
		model.addAttribute("store",storeRead);
		model.addAttribute("storePhoto",storePhoto);
		model.addAttribute("menuList",menuList);
		model.addAttribute("foodcode",foodcode);
		
		return "ih/storeRead";
	}
	
	@GetMapping(value = "storeInsertForm")//insertForm 이동
	public String storeInsertForm(Model model) {
		
		logger.info("StoreController storeInsertForm Start..");
		
		HostStore hostStore = new HostStore();
		List<Code> foodcodeList = codeService.foodcodeList(hostStore.getBcd_code());
		model.addAttribute("foodcodeList",foodcodeList);
		
		return "ih/storeInsertForm";
	}
	
	@PostMapping(value = "storeInsert")//식당정보 insert
	public String storeInsert(HostStore hostStore,Model model, MultipartFile host_photo0,
							  MultipartFile host_photo1,       MultipartFile host_photo2,
				              MultipartFile host_photo3,       MultipartFile host_photo4) {

		//식당정보 등록
		int storeInsert = storeService.storeInsert(hostStore);
		 
		//사진 업로드
		List<MultipartFile> storePhotoInsertList = new ArrayList<MultipartFile>();
		storePhotoInsertList.add(host_photo0);
		storePhotoInsertList.add(host_photo1);
		storePhotoInsertList.add(host_photo2);
		storePhotoInsertList.add(host_photo3);
		storePhotoInsertList.add(host_photo4);
		
		int a = 0;
		
		if (storePhotoInsertList.get(0).getOriginalFilename().equals("")) {
			System.out.println("업로드할 사진 갯수 --> " + storePhotoInsertList.size());
			
			a = storePhotoService.storePhotoInsert(storePhotoInsertList);
			System.out.println("업로드된 사진 갯수 --> " + a);
		}else {
			a = 0;
			System.out.println("업로드한 사진이 없습니다.");
		}
		
		
		
		if (storeInsert > 0) {
			model.addAttribute("msg", "등록 요청 성공");
		}else {
			model.addAttribute("msg", "등록 요청 실패");
		}
		
		return "ih/test"; //현재 리스트가 존재 하지 않으 므로 test으로 이동
	}
}
