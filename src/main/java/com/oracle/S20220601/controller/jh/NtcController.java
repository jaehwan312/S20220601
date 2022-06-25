package com.oracle.S20220601.controller.jh;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oracle.S20220601.model.Notice;
import com.oracle.S20220601.service.jh.NtcService;
import com.oracle.S20220601.service.jh.Paging;

@Controller
public class NtcController {
	private static final Logger logger = LoggerFactory.getLogger(NtcController.class);
	
	@Autowired
	private NtcService ns;
	
	@GetMapping(value="ntcList")
	public String ntcList(Notice ntc, String currentPage, Model model) {
		int total = ns.getTotalCnt();
		Paging pg = new Paging(total, currentPage);
		ntc.setStart(pg.getStart());
		ntc.setEnd(pg.getEnd());
		List<Notice> ntcList = ns.listNtc(ntc);
		model.addAttribute("ntcList", ntcList);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		model.addAttribute("currentPage", currentPage);
		return "jh/ntcList";
	}
	
	@GetMapping(value = "ntcContent")
	public String ntcContent(int n_num, int num, String currentPage, Model model) {
		ns.viewCount(n_num);
		Notice ntc = ns.ntcContent(n_num);
		model.addAttribute("ntc", ntc);
		model.addAttribute("num", num);
		model.addAttribute("currentPage", currentPage);
		return "jh/ntcContent";
	}
	
	
	@GetMapping(value = "ntcUpdateForm")
	public String ntcUpdateForm(int n_num, int num, String currentPage, Model model) {
		Notice ntc = ns.ntcContent(n_num);
		model.addAttribute("ntc", ntc);
		model.addAttribute("num", num);
		model.addAttribute("currentPage", currentPage);
		return "jh/ntcUpdateForm";
	}
	
	@PostMapping(value = "ntcUpdate")
	public String ntcUpdate(Notice ntc, int num, String currentPage, Model model) {
		int result = ns.ntcUpdate(ntc);
		model.addAttribute("n_num", ntc.getN_num());
		model.addAttribute("num", num);
		model.addAttribute("currentPage", currentPage);
		System.out.println("끝끝끝끝끝끝끝끝끝끝끝끝");
		return "redirect:ntcContent";
		// 여기 경로 잘못됨(수정 후, 수정된 컨텐트로 가고 싶음) 수정 실패?
	}
	
	@GetMapping(value = "ntcDelete")
	public String ntcDelete(int n_num, String currentPage, Model model) {
		int result = ns.ntcDelete(n_num);
		return "redirect:ntcList";
		// 삭제 후, 해당페이지로 가고 싶음
	}
	
	@GetMapping(value = "ntcWriteForm")
	public String ntcWriteForm() {
		return "jh/ntcWriteForm";
	}
	
	@PostMapping(value = "ntcWrite")
	public String ntcWrite(Notice ntc, Model model) {
		int result = ns.ntcInsert(ntc);
		if (result > 0) return "redirect:ntcList";
		else {
			model.addAttribute("msg","작성을 실패하였습니다.");
			return "forward:ntcWriteForm";
		}
		// 작성 실패???
	}
	
}
