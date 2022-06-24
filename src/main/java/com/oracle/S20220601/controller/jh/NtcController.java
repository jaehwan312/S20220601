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
	public String ntcList(String currentPage, Model model) {
		Notice ntc = new Notice();
		int total = ns.getTotalCnt();
		Paging pg = new Paging(total, currentPage);
		ntc.setStart(pg.getStart());
		ntc.setEnd(pg.getEnd());
		List<Notice> ntcList = ns.listNtc(ntc);
		model.addAttribute("ntcList", ntcList);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		return "jh/ntcList";
	}
	
	@GetMapping(value = "ntcContent")
	public String ntcContent(int n_num, int num, Model model) {
		ns.viewCount(n_num);
		Notice ntc = ns.ntcContent(n_num);
		model.addAttribute("ntc", ntc);
		model.addAttribute("num", num);
		return "jh/ntcContent";
	}
	
	
	@GetMapping(value = "ntcUpdateForm")
	public String ntcUpdateForm(int n_num, int num, Model model) {
		Notice ntc = ns.ntcContent(n_num);
		model.addAttribute("ntc", ntc);
		model.addAttribute("num", num);
		return "jh/ntcUpdateForm";
	}
	
	@PostMapping(value = "ntcUpdate")
	public String ntcUpdate(Notice ntc, int num, Model model) {
		int result = ns.ntcUpdate(ntc);
		model.addAttribute("num", num);
		return "redirect:ntcList";
	}
	
	@GetMapping(value = "ntcDelete")
	public String ntcDelete(int n_num, String currentPage, Model model) {
		int result = ns.ntcDelete(n_num);
		return "redirect:ntcList";
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
	}
	
}
