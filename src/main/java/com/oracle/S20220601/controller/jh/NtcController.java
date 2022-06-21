package com.oracle.S20220601.controller.jh;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
}
