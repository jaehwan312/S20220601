package com.oracle.S20220601.controller.ji;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.S20220601.model.Pay;
import com.oracle.S20220601.model.Res;
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

	//세션으로 mem_num받기
	int mem_num = 5;
	
	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {
		System.out.println("@GetMapping kakaoPay");
	}

	@PostMapping("/kakaoPay")
	public String kakaoPay(ResInfo resInfo, Model model) {
		System.out.println("KakaoController kakaoPay 시작!");
		resInfo.setMem_num(mem_num);
		System.out.println("resInfo -> " + resInfo.getRoom_name());
		Res r_res = new Res();	
		Pay p_pay = new Pay();
		int total_fee = resInfo.getTotal_fee();

		int insert_res = rs.insertRes(resInfo); // 결제상태 0인 res삽입
		System.out.println("insert_res-> " + insert_res);
		if (insert_res > 0)	System.out.println("예약삽입 성공");
		else				System.out.println("예약삽입 실패");

		int res_num = rs.selectResnumCurrval(); // 마지막 예약번호 = 현재예약번호 가져오기 방금 입력한 예약번호
		System.out.println(" 방금 입력한 예약번호-> " + res_num);

		resInfo.setRes_num(res_num); // resContent에서 가져온 예약정보에 현재 res_num설정
		System.out.println(" resInfo.getRes_num() -> " + resInfo.getRes_num());

		r_res = rs.resByResnum(res_num); // 방금insert한 예약건 select
		p_pay.setRes_num(res_num);
		p_pay.setPrice(total_fee);
		
		int insert_pay = ps.insertPay(p_pay); // 결제상태 0인 res삽입
		if (insert_pay > 0)	System.out.println("결제삽입 성공");
		else				System.out.println("결제삽입 실패");
		//int pay_num = ps.selectPaynumCurrval(); // 마지막 예약번호 = 현재예약번호 가져오기 방금 입력한 예약번호
		//System.out.println(" 방금 입력한 결제번호-> " + pay_num);
		
		//int pay_num = ps.selectPaynumCurrval();
		logger.info("kakaoPay post............................................");
		// 결제번호(결제테이블 번호), 아이템명(객실명), 고객아이디, 총금액
		
//        model.addAttribute("payment", payment);
//        model.addAttribute("member", member);
//        model.addAttribute("order_list", order_list);
//        model.addAttribute("item_name", item_name);
		return "redirect:" + kakaopay.kakaoPayReady();

	}
	//결제성공	
	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("Rescontroller kakaoPaySuccess 시작!");
		logger.info("kakaoPaySuccess get............................................");
		logger.info("kakaoPaySuccess pg_token : " + pg_token);
		System.out.println("pg_token"+pg_token);
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
		
		//RES테이블에 예약상태 1로변경
		//PAY테이블 날짜 변경
		return "ji/kakaoPaySuccess";
	}
	//결제취소	
	@GetMapping("/kakaoPayCancel")
	public String kakaoPayCancel(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("Rescontroller kakaoPayCancel 시작!");
		logger.info("kakaoPayCancel get............................................");
		logger.info("kakaoPayCancel pg_token : " + pg_token);
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));

		return "ji/kakaoPayCancel";

	}//결제실패
	@GetMapping("/kakaoPaySuccessFail")
	public String kakaoPaySuccessFail(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("Rescontroller kakaoPaySuccessFail 시작!");
		logger.info("kakaoPaySuccessFail get............................................");
		logger.info("kakaoPaySuccessFail pg_token : " + pg_token);
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
	
		return "ji/kakaoPaySuccessFail";

	}

}
