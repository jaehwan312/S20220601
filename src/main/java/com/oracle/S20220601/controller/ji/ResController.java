package com.oracle.S20220601.controller.ji;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220601.model.Res;
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
	@RequestMapping("resContent")
	public String resContent() {
		System.out.println("resContent Start...");
		return "ji/resContent";
	}
	@RequestMapping("resContent2")
	public String resContent2() {
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
	
}
