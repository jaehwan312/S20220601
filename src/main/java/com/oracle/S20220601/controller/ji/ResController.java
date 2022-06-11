package com.oracle.S20220601.controller.ji;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.ji.ResRoom;
import com.oracle.S20220601.service.ji.ResService;



@Controller
public class ResController {
	private static final Logger logger = LoggerFactory.getLogger(ResController.class);
	//세션으로 받을 예정
	int mem_num = 5;
	/* int mem_num = (int)session.getAttribute("mem_num"); */
	
    @Autowired
	private ResService rs;
	

	@RequestMapping("res")
	public String res() {
		System.out.println("res Start...");
		return "ji/res";
	}
	//예약하기 화면
	@PostMapping("resContent")
	public String resContent(Res res, Model model) {
		/*res --> stayRead에서 받아온 정보 */
		//프로필
		Profile prof = rs.profile(mem_num);
		//선택한 객실 정보
		ResRoom room1 = rs.resRoom(res);
		String start = res.getRes_start();
		String end = res.getRes_end();
		//숙박일 계산
		long nday = 0;
		try {
			nday = diffOfDate(start,end);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		//날짜 형식 변환 함수
		String checkin  ="";
		String checkout  ="";
		try {
			checkin= diffOfDate2(start);
			checkout = diffOfDate2(end);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		System.out.println("checkin -> "+checkin);
		System.out.println("checkout -> "+checkout);
		model.addAttribute("checkin",checkin);
		model.addAttribute("checkout",checkout);
		model.addAttribute("res",res);
		model.addAttribute("nday",nday);	//숙박일
		model.addAttribute("room1",room1);	//선택한 객실 정보
		model.addAttribute("prof",prof);	//프로필
		System.out.println("resContent Start...");
		return "ji/resContent";
	}
	
	
	@RequestMapping("resContent2")
	public String resContent2() {
		String ret ="";
		try {
			ret = diffOfDate2("2022-06-08");//테스트
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		System.out.println("ret2 -> "+ret);
		System.out.println("resContent2 Start...");
		return "ji/resContent2";
	}
	//예약 상세
	@RequestMapping("resDetail")
	public String resDetail(Model model,int res_num) {
		System.out.println("res_num -->"+res_num);

		System.out.println("resDetail Start...");
		Res res1 = rs.resDetail(res_num);
		model.addAttribute("res", res1);
		
		
		return "ji/resDetail";
	}
	@RequestMapping("reReserve")
	public String reReserve() {
		System.out.println("reReserve Start...");
		return "ji/reReserve";
	}
	
	@RequestMapping("/resList")
	public String resList(Res res, Model model) {
		res.setMem_num(mem_num);
		System.out.println(res.getMem_num());
		System.out.println("resList Start...");
		//예약확정
		List<Res> listRes = rs.listRes(res);
		System.out.println("Rescontroller resList listRes.size() ->"+listRes.size());
		//이용완료
		List<Res> listBeforeRes = rs.listBeforeRes(res);
		System.out.println("Rescontroller resList listBeforeRes.size() ->"+listBeforeRes.size());
		//취소내역
		List<Res> listCancleRes = rs.listCancleRes(res);
		System.out.println("Rescontroller resList listCancleRes.size() ->"+listCancleRes.size());
		
		model.addAttribute("listRes", listRes);
		model.addAttribute("listBeforeRes", listBeforeRes);
		model.addAttribute("listCancleRes", listCancleRes);
		model.addAttribute("mem_num", mem_num);
	
		
		return "ji/resList";
	}
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
