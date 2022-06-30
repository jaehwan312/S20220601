package com.oracle.S20220601.controller.js;

import java.io.File;
import java.io.IOException;
import java.util.List;
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
import org.springframework.ui.Model;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Search;
import com.oracle.S20220601.service.js.Paging;
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
	public String loginPage(Model model, HttpServletRequest request, String msg) {
		System.out.println("loginPage Start...");
		if (request.getSession().getAttribute("mem_num") == null) {
			if(msg != null) {
				if (msg.equals("1")) {
					model.addAttribute("msg", "로그인이후 이용이 가능합니다.");
				}
			}
			return "js/loginPage";
		} else {
			model.addAttribute("msg", "이미 로그인된 상태입니다. 메인화면으로 이동합니다.");
			return "forward:main";
		}
		
		
	}
	
	// 로그인 눌렀을때 처리
	@RequestMapping(value = "loginCheck")
	public ModelAndView loginCheck(@ModelAttribute Profile profile, HttpSession session, HttpServletRequest request) {
		System.out.println("----------- ProfileController loginCheck Start -----------");
		profile = ps.loginCheck(profile, session);
		ModelAndView mav = new ModelAndView();
		if (profile != null) { // 로그인 성공
			session = request.getSession();
			System.out.println("grade-------->"+ session.getAttribute("grade"));
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
		
		
	// 핸드폰 중복 체크
	@PostMapping(value = "phoneCheck")
	@ResponseBody
	public int phoneCheck(@RequestParam("phone") String phone) {
		System.out.println("----------- phoneCheck Start -----------");
		System.out.println("전달받은 phone = "+ phone);
		int cnt = ps.phnoeCheck(phone);
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
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/profile/");
		
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
	
	@RequestMapping(value = "myPage")
	public String myPage(HttpSession session,HttpServletRequest request, Model model) {
		System.out.println("myPage Start...");
		session = request.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		Profile profile = ps.selectProfile(mem_num);
//		System.out.println("확인용------> " + profile.getId());
		
		  System.out.println(profile.getJoin_date().length());
		  if(profile.getJoin_date().length()>10) {
		  System.out.println(profile.getJoin_date().substring(0,11));
		  profile.setJoin_date(profile.getJoin_date().substring(0,11)); }
		 
		model.addAttribute("profile", profile);
		
		return "js/myPage";
	}

	@RequestMapping(value = "updateProfile")
	public String updateProfile(HttpSession session,HttpServletRequest request, Model model) {
		System.out.println("------------ updateProfile Start ----------");
		session = request.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		Profile profile = ps.selectProfile(mem_num);
		model.addAttribute("profile", profile);
		
		return "js/updateProfile";
	}
	
	@ResponseBody
	@RequestMapping(value = "/profileAuth", method = RequestMethod.POST)
	public String profileAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "kjs9502@gmail.com";
        String toMail = email;
        String title = "프로필 수정 인증 이메일 입니다.";
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
	
	
	@RequestMapping(value = "updateInfo", method = RequestMethod.POST)
	public String updateInfo(Profile profile, HttpSession session,HttpServletRequest request , MultipartFile profilePhoto, Model model) throws IOException, Exception {
		System.out.println("------------ Controller updateInfo -------------");
		System.out.println("파일 확인 ---------------"+ profilePhoto.getOriginalFilename());
		session = request.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		profile.setMem_num(mem_num);
		
		if(profilePhoto.getSize() != 0) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/images/profile/");
		
		logger.info("originalName: " + profilePhoto.getOriginalFilename());
	    logger.info("size: " + profilePhoto.getSize());
	    logger.info("contentType: " + profilePhoto.getContentType());
	    logger.info("uploadPath: " + uploadPath);	    String savedName = uploadFile(profilePhoto.getOriginalFilename(), profilePhoto.getBytes(), uploadPath);
        logger.info("savedName: " + savedName);
		profile.setPhoto(savedName);
		
		
		
		int result = ps.updatePhoto(profile); 
		
		}
		
			int result = ps.updateInfo(profile);
			
			if(result > 0) {
				session.invalidate();
				model.addAttribute("msg", "회원정보가 수정 되었습니다! 다시 로그인 해주세요.");
				return "forward:loginPage";
			}else {
				return "redirect:updateProfile";
			}
		}
	
	@RequestMapping(value = "adminPage")
	public String adminPage(Profile profile, Search search, Host host, Model model) {
		System.out.println("------------ Controller adminPage -------------");
		String resultUser      = ps.userCnt(profile);
		String resultSleepUser = ps.sleepUserCnt(profile);
		String resultSearch    = ps.searchCnt(search);
		String reusltStore     = ps.storeCnt(host);
		String reusltStay      = ps.stayCnt(host);
		
		model.addAttribute("resultUser", resultUser);
		model.addAttribute("resultSleepUser", resultSleepUser);
		model.addAttribute("resultSearch", resultSearch);
		model.addAttribute("reusltStore", reusltStore);
		model.addAttribute("reusltStay", reusltStay);
		
		return "js/adminPage"; 
		
	}
	
	@RequestMapping(value = "userSleep")
	public String userSleep() {
		System.out.println("------------ Controller userSleep -------------");
		
		return "js/userSleep";
	}
	
	@RequestMapping(value = "userSleepUpdate")
	public String userSleepUpdate(Profile profile, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println("------------ Controller userSleepUpdate -------------");
		session = request.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		profile.setMem_num(mem_num);
		int result = ps.userSleepUpdate(profile);
		
		if (result > 0) {
			model.addAttribute("msg", "회원탈퇴가 정상적으로 처리되었습니다.");
			return "forward:main";
		} else {
			model.addAttribute("msg", "회원탈퇴에 실패했습니다. 다시 로그인해주세요");
			return "forward:loginPage";
		}
	}
		
	
	@RequestMapping(value="/pwCheck" , method=RequestMethod.POST)
	@ResponseBody
	public String pwCheck(Profile profile, HttpServletRequest request, HttpSession session) throws Exception{
		session = request.getSession();
		int mem_num = (int) session.getAttribute("mem_num");
		profile.setMem_num(mem_num);
		String result = ps.pwCheck(profile);
		return result;
	}
	
	@PostMapping(value = "gradeCheck")
	@ResponseBody
	public String gradeCheck(Profile profile) {
		System.out.println("------------ Controller gradeCheck -------------");
		String grade = ps.gradeCheck(profile);
		
		return grade;
	}
	
	
	@RequestMapping(value = "exampleMyPage")
	public String exampleMyPage(HttpSession session,HttpServletRequest request) {
		System.out.println("exampleMyPage ---------------");
		session = request.getSession();
		
		
		return "exampleMyPage";
	}
	
	@RequestMapping(value="userList")
	public String userList(Profile profile, String currentPage, Model model) {
		logger.info("ProfileController Start userList");

		int total = ps.total();   
	
		System.out.println("userListController total=>" + total);
		Paging pg = new Paging(total, currentPage); 
		profile.setStart(pg.getStart());   // 시작시 1
		profile.setEnd(pg.getEnd());       // 시작시 10 
		List<Profile> profileList = ps.profileList(profile); 
		System.out.println("userListController userList listProfile()=>" + profileList.size());
		model.addAttribute("profileList",profileList);
		model.addAttribute("pg",pg);
		model.addAttribute("total", total);
		return "js/userList";
	}
    // keyword(조건) 조회
	@RequestMapping(value="userListKeyword")
	public String listKeyword(Profile profile, String currentPage, Model model) {
		logger.info("listProfileKeyword Start listKeyword 조건 조회  ...");

		int total = ps.totalKeyword(profile);
		System.out.println("listProfileKeyword total=>" + total);
		Paging pg = new Paging(total, currentPage);
		profile.setStart(pg.getStart());   // 시작시 1
		profile.setEnd(pg.getEnd());       // 시작시 10 
		System.out.println("listProfileKeyword pg.getTotal=>" + pg.getTotal());
		System.out.println("listProfileKeyword pg.getStart()=>" + pg.getStart());
		List<Profile> listProfileKeyword = ps.listProfileKeyword(profile); 
		System.out.println("listProfileKeyword.size()=>" + listProfileKeyword.size());
		model.addAttribute("profileList",listProfileKeyword);
		model.addAttribute("pg",pg);
		model.addAttribute("total", total);
		model.addAttribute("keyword", profile.getKeyword());
		
		return "js/userListKeyword";
	}
	
	@PostMapping(value = "updateUser1")
	@ResponseBody
	public Profile updateUser1(Profile profile) {
		Profile result = ps.updateUser(profile);
		return result;
	}
	
	@PostMapping(value = "updateAdmin1")
	@ResponseBody
	public Profile updateAdmin1(Profile profile) {
		Profile result = ps.updateAdmin(profile);
		return result;
	}
	
	@RequestMapping(value="userSleepList")
	public String userSleepList(Profile profile, String currentPage, Model model) {
		logger.info("ProfileController Start userList");

		int total1 = ps.total1();   
	
		System.out.println("userListController total=>" + total1);
		Paging pg = new Paging(total1, currentPage); 
		profile.setStart(pg.getStart());   // 시작시 1
		profile.setEnd(pg.getEnd());       // 시작시 10 
		List<Profile> userSleepList = ps.userSleepList(profile); 
		System.out.println("userListController userList listProfile()=>" + userSleepList.size());
		model.addAttribute("profileList",userSleepList);
		model.addAttribute("pg",pg);
		model.addAttribute("total", total1);
		return "js/userSleepList";
	}
	
	
}
