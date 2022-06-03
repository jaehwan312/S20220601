package com.oracle.S20220601.controller.js;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.service.js.ProfileService;

@Controller
public class ProfileController {

	private final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@Autowired
	private ProfileService ps;
	
	// 로그인 페이지
	@RequestMapping(value = "loginPage")	
	public String loginPage() {
		System.out.println("loginPage Start...");
		return "js/loginPage";
	}
	
	// 로그인 눌렀을때 처리
	@RequestMapping(value = "loginCheck")
	public ModelAndView loginCheck(@ModelAttribute Profile profile, HttpSession session) {
		System.out.println("----------- ProfileController Start -----------");
		String name = ps.loginCheck(profile, session);
		ModelAndView mav = new ModelAndView();
		if (name != null) { // 로그인 성공
			mav.setViewName("main");			
		} else {	        // 로그인 실패
			mav.setViewName("js/loginPage");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	// 로그아웃
	@RequestMapping(value = "logout")
	public ModelAndView	logout(HttpSession session, ModelAndView mav) {
		ps.logout(session);
		mav.setViewName("js/loginPage");	// 로그아웃 적용된 메인페이지로 이동이 좋아보임
		mav.addObject("message", "logout");
		return mav;
	}
	
	// 아이디 중복 체크
	@PostMapping(value = "idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		System.out.println("----------- idCheck Start -----------");
		System.out.println("전달받은 id = "+ id);
		int cnt = ps.idCheck(id);
		return cnt;
		
	}
	
	@RequestMapping(value = "signUpPage")	//회원가입 페이지
	public String signUpPage() {
		System.out.println("----------- signUpPage Start -----------");
		return "js/signUpPage";
	}
	
	
	
	@RequestMapping(value = "signUpCheckPage")	// 이용약관 페이지
	public String checkPage() {
		System.out.println("----------- signUpCheckPage Start -----------");
		return "js/signUpCheckPage";
	}
	
}
