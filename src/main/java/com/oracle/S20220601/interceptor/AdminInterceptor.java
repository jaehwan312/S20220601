package com.oracle.S20220601.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

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
	    if (request.getSession().getAttribute("grade") != null && request.getSession().getAttribute("grade").equals("1")) {
	    	  return true; 
	      } else if (request.getSession().getAttribute("grade") == null) {
	          response.sendRedirect("loginPage?msg=1");
	          return false;
	      } else {
	          response.sendRedirect("main?msg=1");
	          return false;
	      }
	   
	}	
	
	
	
}
