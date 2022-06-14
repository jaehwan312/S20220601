package com.oracle.S20220601.controller.js;

import java.io.File;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
		System.out.println("----------- ProfileController loginCheck Start -----------");
		profile = ps.loginCheck(profile, session);
		ModelAndView mav = new ModelAndView();
		if (profile != null) { // 로그인 성공
			session = request.getSession();
			session.setAttribute("mem_num", session.getAttribute("mem_num"));
			session.setAttribute("grade",  session.getAttribute("grade"));
			mav.setViewName("redirect:main");
			
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
		mav.setViewName("redirect:loginPage");	// 로그아웃 적용된 메인페이지로 이동이 좋아보임
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
	
	
	//회원가입 로직 처리
	@PostMapping(value = "signUp")
	public String signUp(Profile profile, HttpServletRequest request, MultipartFile profilePhoto) throws Exception {
		System.out.println("-------------signUp Start-------------	");
		System.out.println(profilePhoto.getOriginalFilename());
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/js/");
		
		logger.info("originalName: " + profilePhoto.getOriginalFilename());
	    logger.info("size: " + profilePhoto.getSize());
	    logger.info("contentType: " + profilePhoto.getContentType());
	    logger.info("uploadPath: " + uploadPath);	    String savedName = uploadFile(profilePhoto.getOriginalFilename(), profilePhoto.getBytes(), uploadPath);
        logger.info("savedName: " + savedName);
	    
        profile.setPhoto(savedName);
	    
		int result =  ps.signUp(profile);
		
		System.out.println(result);
		if(result > 0) {
			return "redirect:loginPage";
		}else {
			return "redirect:signUpPage";
		}
		
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

	    String savedName = uid.toString() + "_" + originalName;
	    logger.info("savedName: " + savedName);
	    File target = new File(uploadPath, savedName);
//	    File target = new File(requestPath, savedName);
	    FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
	    // Service ---> DAO 연결 
	    
	    return savedName;
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
	
	// 아이디/비밀번호 찾기 페이지
	@RequestMapping(value = "userSearch")
	public String userSearch() {
		System.out.println("----------------- userSearch Start --------------");
		return "js/userSearch";
		
	}

	// 아이디 찾기
	@RequestMapping(value = "SearchId", method = RequestMethod.POST)
	@ResponseBody
	public String SearchId(Profile profile, @RequestParam("name") String name, @RequestParam("phone") String phone ) {
		System.out.println("----------------- Controller SearchId Start --------------");
		String result = ps.searchId(profile);
		
		return result;
		
	}
	
	
	// 비밀번호 찾기
	@RequestMapping(value = "SearchPw", method = RequestMethod.POST)
	@ResponseBody
	public int SearchPw(Profile profile, @RequestParam("id")String id, @RequestParam("email")String email) {
		System.out.println("----------------- Controller SearchPw Start --------------");
		int cnt = ps.emailCheck(profile);

		if (cnt == 1) {
			int leftLimit = 48; // numeral '0'
			int rightLimit = 122; // letter 'z'
			int targetStringLength = 10;
			Random random = new Random();

			String generatedString = random.ints(leftLimit,rightLimit + 1)
			  .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
			  .limit(targetStringLength)
			  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
			  .toString();

			profile.setPw(generatedString);
			// 임시비밀번호 DB 저장
			ps.pwSave(profile);

			/* 이메일 보내기 */
	        String setFrom = "kjs9502@gmail.com";
	        String toMail = email;
	        String title = "제주 감수광 비밀번호찾기 이메일 입니다.";
	        String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" +
	                id+"님의"+
	                "<br>" + 
	                "임시 비밀번호는 " + generatedString + " 입니다." + 
	                "<br>" + 
	                "로그인후 비밀번호를 변경 해주세요."+
	                "<br>" +
	                "<a href='http://localhost:8908/loginPage'>로그인 페이지</a>";
	        
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
		}
		
		return cnt;
	}
	
	
	
}
