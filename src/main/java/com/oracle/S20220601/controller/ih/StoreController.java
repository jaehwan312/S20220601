package com.oracle.S20220601.controller.ih;

import java.util.List;

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
import com.oracle.S20220601.service.ih.StoreService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Autowired
	private StoreService storeService;
	@Autowired
	private CodeService  codeService;
	 
	@GetMapping(value = "storeRead")
	public String storeRead(int host_num, Model model) {
		logger.info("StoreController storeRead Start..");
		
		HostStore       storeRead  = storeService.storeRead(host_num);
		List<HostPhoto> storePhoto = storeService.storePhoto(host_num);
		List<Menu>      menuList   = storeService.menuList(host_num);
		
		Code      		foodcode   = codeService.foodcode(storeRead);
		
		model.addAttribute("store",storeRead);
		model.addAttribute("storePhoto",storePhoto);
		model.addAttribute("menuList",menuList);
		
		
		model.addAttribute("foodcode",foodcode);
		
		return "ih/storeRead";
	}
	
	@GetMapping(value = "storeInsertForm")
	public String storeInsertForm(Model model) {
		
		logger.info("StoreController storeInsertForm Start..");
		
		HostStore hostStore = new HostStore();
		List<Code> foodcodeList = codeService.foodcodeList(hostStore.getBcd_code());
		model.addAttribute("foodcodeList",foodcodeList);
		
		return "ih/storeInsertForm";
	}
	
	@PostMapping(value = "storeInsert")
	public String storeInsert(HostStore hostStore,/* MultipartHttpServletRequest request*/ Model model,
								@RequestParam("host_photo") List<MultipartFile> list) {
		
		int storeInsert = storeService.storeInsert(hostStore);
		System.out.println(storeInsert);
		
		System.out.println("size --> " + list.size());
		
//		List<MultipartFile> hostPhotos = request.getFiles("host_photo");
//		System.out.println("size --> " + hostPhotos.size());
//		for (MultipartFile multipartFile : hostPhotos) {
//			String originFileName = multipartFile.getOriginalFilename();
//			System.out.println(originFileName);
			
			try {
				System.out.println("사진성공");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
//		}
		
		
		
		if (storeInsert > 0) {
			System.out.println("성공");
			model.addAttribute("msg", "등록 요청 성공");
		}else {
			System.out.println("실패");
			model.addAttribute("msg", "등록 요청 실패");
		}
		
		return "ih/test"; //현재 리스트가 존재 하지 않으 므로 main으로 이동
	}
}
