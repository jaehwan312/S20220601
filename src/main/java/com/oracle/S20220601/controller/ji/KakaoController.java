package com.oracle.S20220601.controller.ji;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.S20220601.model.Pay;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.ji.KakaoPayApprovalVO;
import com.oracle.S20220601.model.ji.ResInfo;
import com.oracle.S20220601.service.ji.KakaoPay;
import com.oracle.S20220601.service.ji.PayService;
import com.oracle.S20220601.service.ji.ResService;


import lombok.Setter;

@Controller
public class KakaoController {
	
	private static final Logger logger = LoggerFactory.getLogger(KakaoController.class);
	@Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
	@Autowired
	private ResService rs;
	@Autowired
	private PayService ps;


	
	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {
		System.out.println("@GetMapping kakaoPay");
	}

	@PostMapping("/kakaoPay")
	public String kakaoPay(ResInfo resInfo, Model model,HttpServletRequest request) {
		/* res --> stayRead에서 받아온 정보 */
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		
		
		System.out.println("KakaoController kakaoPay 시작!");
		resInfo.setMem_num(mem_num);
		System.out.println("resInfo -> " + resInfo.getRoom_name());
		Res r_res = new Res();	
		Pay p_pay = new Pay();
		String item = resInfo.getRoom_name();
		
		int total_fee = resInfo.getTotal_fee();

		int insert_res = rs.insertRes(resInfo); // 결제상태 0인 res삽입
		System.out.println("insert_res-> " + insert_res);
		if (insert_res > 0)	System.out.println("예약삽입 성공");
		else				System.out.println("예약삽입 실패");

		int res_num = rs.selectResnumCurrval(); // 마지막 예약번호 = 현재예약번호 가져오기 방금 입력한 예약번호
		System.out.println(" 방금 입력한 예약번호-> " + res_num);

		resInfo.setRes_num(res_num); // resContent에서 가져온 예약정보에 현재 res_num설정
		System.out.println(" resInfo.getRes_num() -> " + resInfo.getRes_num());

		r_res = rs.resByResnum(res_num); // 방금 insert한 예약건 select
		
		p_pay.setRes_num(res_num);	// 예약번호 set
		p_pay.setPrice(total_fee);
		
		int insert_pay = ps.insertPay(p_pay); // 결제상태 0인 res삽입
		if (insert_pay > 0)	System.out.println("결제삽입 성공");
		else				System.out.println("결제삽입 실패");
		int pay_num = ps.selectPaynumCurrval(); // 마지막 예약번호 = 현재예약번호 가져오기 방금 입력한 예약번호
		System.out.println(" 방금 입력한 결제번호-> " + pay_num);
		p_pay.setPay_num(pay_num);
		Pay p_pay2 = ps.payByPaynum(p_pay);	//방금 insert한 결제건 select
		
		//int pay_num = ps.selectPaynumCurrval();
		logger.info("kakaoPay post............................................");
		// 결제번호(결제테이블 번호), 아이템명(객실명), 고객아이디, 총금액
		
		model.addAttribute("item", item);
        model.addAttribute("res", r_res);
        model.addAttribute("pay", p_pay2);
        model.addAttribute("id", resInfo.getId());
		return "redirect:" + kakaopay.kakaoPayReady(model);

	}

	//결제성공	
	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,HttpServletRequest request) {
		/* res --> stayRead에서 받아온 정보 */
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		System.out.println("KakaoController kakaoPaySuccess 시작!");
		logger.info("kakaoPaySuccess get............................................");
		logger.info("kakaoPaySuccess pg_token : " + pg_token);
        // DB에서 결제, 결제상세테이블 정보 가져와서 kakaoPayInfo에 모델로 껴주기
		Profile prof = rs.profile(mem_num);
		String id = prof.getId();
		System.out.println("prof.getId() -> "+prof.getId());
		int res_num = rs.selectResnumCurrval();
		System.out.println(" kakaoPaySuccess 방금 입력한 예약번호-> " + res_num);
		
		int pay_num = ps.selectPaynumCurrval();
		System.out.println(" kakaoPaySuccess 방금 입력한 결제번호-> " + pay_num);
		Pay p_pay = new Pay();
		p_pay.setPay_num(pay_num);
		Pay p_pay2 = ps.payByPaynum(p_pay);
		int price = p_pay.getPrice();	//총 결제금액
		
		
		//sysdate로 변경
		KakaoPayApprovalVO kakaoPayApprovalVO = kakaopay.kakaoPayInfo(pg_token, p_pay2, id);
	    System.out.println("결제일시 -> "+kakaoPayApprovalVO.getApproved_at());
	    kakaoPayApprovalVO.getApproved_at();
     	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        String pay_date = format.format(kakaoPayApprovalVO.getApproved_at());
        System.out.println(pay_date);
        p_pay.setPay_date(pay_date);
        
        
        
        
        
     // 결제 	date바꾸기
        int update_paydate = ps.updatePaydate(p_pay);
    	if(update_paydate > 0)	System.out.println("결제일 수정 성공");
    	else					System.out.println("결제일 수정 실패");
        int update_status = rs.updateStatus(res_num);
    	if(update_status > 0)	System.out.println("예약상태 수정 성공");
    	else					System.out.println("예약상태 수정 실패");
	    
	    // 예약은 res_status 1로 바꾸고
	    
	    
		
		
        // pay pay_num, price, id가져가기
		
		//RES테이블에 예약상태 1로변경
		//PAY테이블 날짜 변경
		return "redirect:/resList";
	}
	//결제취소	
	@GetMapping("/kakaoPayCancel")
	public String kakaoPayCancel(HttpServletRequest request, Model model) throws ParseException {
		System.out.println("KakaoController kakaoPayCancel 시작!");
		/* res --> stayRead에서 받아온 정보 */
//		int mem_num = (int)request.getSession().getAttribute("mem_num");
//		Profile prof = rs.profile(mem_num);
//		String id = prof.getId();
//		System.out.println("prof.getId() -> "+prof.getId());
		
		int res_num = rs.selectResnumCurrval();
		System.out.println(" kakaoPayCancel 방금 입력한 예약번호-> " + res_num);
		Res r_res = rs.resByResnum(res_num); // room_num을 얻기 위한 RES SELECT
		System.out.println("r_res.getRoom_num -> "+r_res.getRoom_num());
		
		int pay_num = ps.selectPaynumCurrval();
		System.out.println(" kakaoPayCancel 방금 입력한 결제번호-> " + pay_num);
		Pay p_pay = new Pay();
		p_pay.setPay_num(pay_num);
		Pay p_pay2 = ps.payByPaynum(p_pay);
		int price = p_pay.getPrice();	//총 결제금액
		String start = r_res.getRes_start().substring(0,4)+"-"+r_res.getRes_start().substring(4,6)+"-"+r_res.getRes_start().substring(6,8);
    	String end = r_res.getRes_end().substring(0,4)+"-"+r_res.getRes_end().substring(4,6)+"-"+r_res.getRes_end().substring(6,8);
    	
    	System.out.println(start);
    	System.out.println(end);
		//결제테이블 삭제
		int delete_pay = ps.deleteFailPay(pay_num);
		if(delete_pay>0)		System.out.println("kakaoPayCancel 결제 삭제 성공");
		else 					System.out.println("kakaoPayCancel 결제 삭제 실패");
		//예약테이블 삭제
    	int delete_res = rs.deleteFailRes(res_num);
    	if(delete_res>0)		System.out.println("kakaoPayCancel 예약 삭제 성공");
    	else 					System.out.println("kakaoPayCancel 예약 삭제 실패");
    	
    	
    	System.out.println("getRes_start()-->" +r_res.getRes_start());
    	System.out.println();
    	//로그인이라도 되어 있어야 하는데.....;;;
    	return "redirect:/resContent?room_num="+r_res.getRoom_num()+"&res_start="+start+"&res_end="+end+"&sale_price="+price;
	}
	//결제실패
	@GetMapping("/kakaoPaySuccessFail")
	public String kakaoPaySuccessFail(HttpServletRequest request) {
		System.out.println("KakaoController kakaoPaySuccessFail 시작!");
		/* res --> stayRead에서 받아온 정보 */
//		int mem_num = (int)request.getSession().getAttribute("mem_num");
//		Profile prof = rs.profile(mem_num);
//		String id = prof.getId();
//		System.out.println("prof.getId() -> "+prof.getId());
		
		int res_num = rs.selectResnumCurrval();
		System.out.println(" kakaoPayCancel 방금 입력한 예약번호-> " + res_num);
		Res r_res = rs.resByResnum(res_num); // room_num을 얻기 위한 RES SELECT
		System.out.println("r_res.getRoom_num -> "+r_res.getRoom_num());
		
		int pay_num = ps.selectPaynumCurrval();
		System.out.println(" kakaoPayCancel 방금 입력한 결제번호-> " + pay_num);
		Pay p_pay = new Pay();
		p_pay.setPay_num(pay_num);
		Pay p_pay2 = ps.payByPaynum(p_pay);
		int price = p_pay.getPrice();	//총 결제금액
		String start = r_res.getRes_start().substring(0,4)+"-"+r_res.getRes_start().substring(4,6)+"-"+r_res.getRes_start().substring(6,8);
    	String end = r_res.getRes_end().substring(0,4)+"-"+r_res.getRes_end().substring(4,6)+"-"+r_res.getRes_end().substring(6,8);
    	
    	System.out.println(start);
    	System.out.println(end);
		//결제테이블 삭제
		int delete_pay = ps.deleteFailPay(pay_num);
		if(delete_pay>0)		System.out.println("kakaoPayCancel 결제 삭제 성공");
		else 					System.out.println("kakaoPayCancel 결제 삭제 실패");
		//예약테이블 삭제
    	int delete_res = rs.deleteFailRes(res_num);
    	if(delete_res>0)		System.out.println("kakaoPayCancel 예약 삭제 성공");
    	else 					System.out.println("kakaoPayCancel 예약 삭제 실패");
    	
    	
    	System.out.println("getRes_start()-->" +r_res.getRes_start());
    	System.out.println();
    	//로그인이라도 되어 있어야 하는데.....;;;
    	return "redirect:/resContent?room_num="+r_res.getRoom_num()+"&res_start="+start+"&res_end="+end+"&sale_price="+price;

	}

}
