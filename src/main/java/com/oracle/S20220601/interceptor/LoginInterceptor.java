package com.oracle.S20220601.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	public LoginInterceptor() {
	}
 	
	@Override
	public boolean preHandle(HttpServletRequest request, 
	                         HttpServletResponse response, 
	                         Object handler) throws Exception 
	{
	    System.out.println("pre handle..........................");
	    HandlerMethod method = (HandlerMethod) handler;
	    Method methodObj = method.getMethod();
//	    String mem_num =  request.getSession().getAttribute("mem_num").toString();
	   
	    if (request.getSession().getAttribute("mem_num") != null && request.getSession().getAttribute("mem_num").equals("1")) {
	    	return true; 
	    } else {
	    	response.sendRedirect("loginPage?msg=1");
	    	return false;
		}
	    
	}	
	
	
	
}
