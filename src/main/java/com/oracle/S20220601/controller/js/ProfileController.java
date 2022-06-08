package com.oracle.S20220601.controller.js;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 로그인 페이지
	@RequestMapping(value = "loginPage")	
	public String loginPage() {
		System.out.println("loginPage Start...");
		return "js/loginPage";
	}
	
	// 로그인 눌렀을때 처리
	@RequestMapping(value = "loginCheck")
	public ModelAndView loginCheck(@ModelAttribute Profile profile, HttpSession session, HttpServletRequest request) {
		System.out.println("----------- ProfileController Start -----------");
		profile = ps.loginCheck(profile, session);
		ModelAndView mav = new ModelAndView();
		if (profile != null) { // 로그인 성공
			session = request.getSession();
			int mem_num = (int)session.getAttribute("mem_num");
			String grade = (String) session.getAttribute("grade");
			mav.setViewName("redirect:main");
			mav.addObject("mem_num", mem_num);
			mav.addObject("grade", grade);
		} else {	        // 로그인 실패
			mav.setViewName("js/loginPage");
			mav.addObject("message", "error");
		}
		return mav;
	}

	
	// 로그아웃
	@RequestMapping(value = "logout")
	public ModelAndView	logout(HttpSession session, ModelAndView mav) {
		System.out.println("----------- logout Start -----------");
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
	
	//회원가입 페이지
	@RequestMapping(value = "signUpPage")	
	public String signUpPage() {
		System.out.println("----------- signUpPage Start -----------");
		return "js/signUpPage";
	}
	
	//회원가입
	@RequestMapping(value = "signUp")	
	public String signUp() {
		System.out.println("----------- signUp Start -----------");
		return "main";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "kjs9502@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return Integer.toString(checkNum);
 
	}
	
	// 이용약관 페이지
	@RequestMapping(value = "signUpCheckPage")	
	public String checkPage() {
		System.out.println("----------- signUpCheckPage Start -----------");
		return "js/signUpCheckPage";
	}
	
}
