package com.oracle.S20220601.controller.jj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;
import com.oracle.S20220601.service.jj.PickService;

@Controller
public class MyPickController {
	
	@Autowired
	private PickService ps;
	
	@RequestMapping(value = "myPickList")
	public String myPickList(HttpServletRequest request, Model model) {
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		
		Map<String, Object> host = new HashMap<String, Object>();
		
		List<HostStorejj> store = ps.ajaxMyStoreList(mem_num);
		List<HostStayjj> stay = ps.ajaxMyStayList(mem_num);
		host.put("store", store);
		host.put("stay", stay);
		
		model.addAttribute("host", host);
		
		return "jj/myPickList";
	}
	
	@PostMapping(value = "myPickDel")
	@ResponseBody
	public int myPickDel(int host_num, HttpServletRequest request, Model model) {
		int mem_num = (int)request.getSession().getAttribute("mem_num");
		int result = ps.myPickDel(host_num, mem_num);
		return result;
	}
	
}
