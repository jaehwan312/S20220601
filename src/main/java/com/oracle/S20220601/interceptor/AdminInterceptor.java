package com.oracle.S20220601.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor {
	public AdminInterceptor() {
	}
 	
	@Override
	public boolean preHandle(HttpServletRequest request, 
	                         HttpServletResponse response, 
	                         Object handler) throws Exception 
	{
	    System.out.println("pre handle..........................");
	    HandlerMethod method = (HandlerMethod) handler;
	    Method methodObj = method.getMethod();
	    String grade =  request.getSession().getAttribute("grade").toString();
	    System.out.println("grade ***************"+grade);
	    if (grade.equals("1")) {
	    	return true; 
	    } else {
	    	response.sendRedirect("main?msg=1");
	    	return false;
		}
	   
	}	
	
	
	
}
