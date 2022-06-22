package com.oracle.S20220601.controller.jj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.oracle.S20220601.service.jj.PickService;

@Controller
public class MyPickController {
	
	@Autowired
	private PickService ps;
	
}
