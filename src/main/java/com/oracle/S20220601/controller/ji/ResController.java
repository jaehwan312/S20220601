package com.oracle.S20220601.controller.ji;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220601.model.Pay;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Res;

import com.oracle.S20220601.model.ji.ResRoom;
import com.oracle.S20220601.model.ji.RoomPay;
import com.oracle.S20220601.service.ji.PayService;
import com.oracle.S20220601.service.ji.ResService;


@Controller
public class ResController {
	private static final Logger logger = LoggerFactory.getLogger(ResController.class);


	@Autowired
	private ResService rs;
	@Autowired
	private PayService ps;

	// 예약하기 화면
	@GetMapping("resContent")
	public String resContent(Res res, Model model, HttpServletRequest request) {
		/* res --> stayRead에서 받아온 정보 */
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		// 프로필
		Profile prof = rs.profile(mem_num);
		
		// 선택한 객실 정보
		ResRoom room1 = rs.resRoom(res);
		int dayfee = room1.getDayfee();
		int weekfee = room1.getWeekfee();
		String start = res.getRes_start();
		String end = res.getRes_end();

		// 숙박일 계산
		long nday = 0;
		try {
			nday = diffOfDate(start, end);
		} catch (Exception e) {

			e.printStackTrace();
		}
		// 날짜 형식 변환 함수
		String checkin = "";
		String checkout = "";
		try {
			checkin = diffOfDate2(start);
			checkout = diffOfDate2(end);
		} catch (Exception e) {

			e.printStackTrace();
		}

		// 총금액 계산 예약날짜 , 평일금액, 주말금액
		RoomPay rp = new RoomPay();
		rp.setDayfee(room1.getDayfee());
		rp.setWeekfee(room1.getWeekfee());
		rp.setRes_start(res.getRes_start());
		rp.setRes_end(res.getRes_end());
		int total_fee = rs.totalFee(rp);

//		System.out.println("checkin -> "+checkin);
//		System.out.println("checkout -> "+checkout);
//		System.out.println("start -> "+start);
//		System.out.println("end -> "+end);

		System.out.println("rp.setDayfee -> " + room1.getDayfee());
		System.out.println("rp.setWeekfee -> " + room1.getWeekfee());
		System.out.println("rp.setRes_start -> " + res.getRes_start());
		System.out.println("rp.setRes_end -> " + res.getRes_end());
		System.out.println("total_fee -> " + total_fee);

		model.addAttribute("total_fee", total_fee);	//	총 결제금액
		model.addAttribute("checkin", checkin);		//	체크인	날짜 형변환 	YYYY-MM-DD -> MM.dd E
		model.addAttribute("checkout", checkout);	//	체크아웃	날짜 형변환 	YYYY-MM-DD -> MM.dd E
		model.addAttribute("res", res);				//	res --> stayRead에서 받아온 정보 
		model.addAttribute("nday", nday); 			//	숙박일 ex)3박
		model.addAttribute("room1", room1); 		//	선택한 객실 정보
		model.addAttribute("prof", prof);			// 프로필(이름, 휴대폰 번호)
		model.addAttribute("mem_num", mem_num); 	// mem_num
		System.out.println("resContent Start...");
		return "ji/resContent";
	}
	
	//테스트용 
	@RequestMapping("resContent2")
	public String resContent2() {
		String ret = "";
		try {
			ret = diffOfDate2("2022-06-08");// 테스트
		} catch (Exception e) {

			e.printStackTrace();
		}
		System.out.println("ret2 -> " + ret);
		System.out.println("resContent2 Start...");
		return "ji/resContent2";
	}
	@RequestMapping("payments")
	public String payments() {
		
		
		return "ji/payment";
	}

	// 예약 상세
	@RequestMapping("resDetail")
	public String resDetail(Model model, int res_num, HttpServletRequest request) {
		/* res --> stayRead에서 받아온 정보 */
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		String grade = (String)request.getSession().getAttribute("grade");
		
		System.out.println("resDetail Start...");
		System.out.println("res_num -> " + res_num); // 예약 번호
		Res res1 = rs.resDetail(res_num);
		model.addAttribute("res", res1);
		model.addAttribute("grade", grade);

		return "ji/resDetail";
	}
	
	//예약상세에서 다시예약 버튼 
	@RequestMapping("reReserve")
	public String reReserve() {
		System.out.println("reReserve Start...");
		return "ji/reReserve";
	}

	//예약내역 리스트
	@RequestMapping("/resList")
	public String resList(Res res, Model model,HttpServletRequest request) {
		/* res --> stayRead에서 받아온 정보 */
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		String grade = (String)request.getSession().getAttribute("grade");
		
		res.setMem_num(mem_num);
		System.out.println("res.getMem_num()"+res.getMem_num());
		System.out.println("resList Start...");
		// 예약확정 내역
		List<Res> listRes = rs.listRes(res);
		System.out.println("Rescontroller resList listRes.size() ->" + listRes.size());
		// 이용완료 내역
		List<Res> listBeforeRes = rs.listBeforeRes(res);
		System.out.println("Rescontroller resList listBeforeRes.size() ->" + listBeforeRes.size());
		// 취소내역
		List<Res> listCancleRes = rs.listCancleRes(res);
		System.out.println("Rescontroller resList listCancleRes.size() ->" + listCancleRes.size());


		model.addAttribute("listRes", listRes);
		model.addAttribute("listBeforeRes", listBeforeRes);
		model.addAttribute("listCancleRes", listCancleRes);
		model.addAttribute("mem_num", mem_num);
		model.addAttribute("grade", grade);

		return "ji/resList";
	}
	
	@RequestMapping(value = "statusChange")
	public Res statusChange(int res_num, Model model) {
		Res res = rs.statusChange(res_num);
		return res;
		
	}
	@RequestMapping(value = "statusChange2")
	public String resCancle(Pay pay, Model model) {	//예약번호, 캔슬이유 받아옴
		//pay 결제취소일, 결제취소이유 update
		Pay p_pay = new Pay();
		p_pay.setRes_num(pay.getRes_num());
		p_pay.setCanc_reason(pay.getCanc_reason());
		int upd_pay_status = ps.updateStatus(p_pay);
		if (upd_pay_status > 0)	System.out.println("updateStatus 성공");
		else					System.out.println("updateStatus 실패");
		
		//res상태 3으로
		int res_num = pay.getRes_num();
		int upd_res_canc = rs.updStatusCanc(res_num);
		
		if (upd_res_canc > 0)	System.out.println("예약상태3 UPDATE 성공");
		else					System.out.println("예약상태3 UPDATE 실패");
		return "redirect:/resList";
		
	}

	@RequestMapping("resDelete")
	public String resDelete(Res res, Model model,HttpServletRequest request) {
		System.out.println("Rescontroller resDelete Start...");
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		String grade = (String)request.getSession().getAttribute("grade");
		
		int res_num1 = res.getRes_num();	//받아온 예약번호
		System.out.println("삭제할 res_num -> "+res_num1);
		
		//res_num으로 Pay Delete
		Pay p_pay = new Pay();
		p_pay.setRes_num(res_num1);
		int delete_pay = ps.deleteByResnum(p_pay);
		if (delete_pay > 0)	System.out.println("resDelete 결제삭제 성공");
		else				System.out.println("결제삭제 실패");
		
		//res_num으로 Pay에서 삭제할 p_num찾기
		int delete_res = rs.deleteByResnum(res); // 결제상태 0인 res삽입
		if (delete_res > 0)	System.out.println("resDelete 예약삭제 성공");
		else				System.out.println("예약삭제 실패");
		
		
		return  "redirect:/resList";
	}
		
	/* 							컨트롤러에서 사용한 함수 							*/
	
	
	//숙박일 구하기 몇박인지 String을 date로 변환  ex) 2박
	public static long diffOfDate(String start, String end) throws Exception {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        
        Date stDt = format.parse(start);
        Date edDt = format.parse(end);
        long diff = edDt.getTime() - stDt.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        
        return diffDays;
    }
	//체크인 체크아웃 형식 변환	 ex) 2022-02-02 -> 02.02 월
	public static String diffOfDate2(String date) throws Exception {
		String strNewDtFormat="";
		try {
			String strDate = date;
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat newDtFormat = new SimpleDateFormat("MM.dd E");
			// String 타입을 Date 타입으로 변환
			Date formatDate = dtFormat.parse(strDate);
			// Date타입의 변수를 새롭게 지정한 포맷으로 변환
			strNewDtFormat = newDtFormat.format(formatDate);
			System.out.println("포맷 전 : " + strDate);
			System.out.println("포맷 후 : " + strNewDtFormat);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return strNewDtFormat;
	}


}
