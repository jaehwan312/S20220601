package com.oracle.S20220601.controller.jj;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;
import com.oracle.S20220601.service.jj.PickService;

@Controller
public class MyPickController {
	
	@Autowired
	private PickService ps;
	
	@RequestMapping(value = "myPickList")
	public String myPickList(Model model) {
		
		return "jj/myPickList";
	}
	
	@PostMapping(value = "ajaxMyStoreList")
	public List<HostStorejj> ajaxMyStoreList(HttpServletRequest request, Model model){
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		List<HostStorejj> list = ps.ajaxMyStoreList(mem_num);
		return list;
	}
	
	@PostMapping(value = "ajaxMyStayList")
	public List<HostStayjj> ajaxMyStayList(HttpServletRequest request, Model model){
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		List<HostStayjj> list = ps.ajaxMyStayList(mem_num);
		return list;
	}
	
}
