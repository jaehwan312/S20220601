package com.oracle.S20220601.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;



@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	// interCeptor
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/adminPage")
													   .addPathPatterns("/chatList")
													   .addPathPatterns("/keywordList")
													   .addPathPatterns("/keywordInsert")
													   .addPathPatterns("/keywordDelete")
													   .addPathPatterns("/keywordSearch")
													   .addPathPatterns("/keywordUpdate")
													   .addPathPatterns("/userList")
													   .addPathPatterns("/userListKeyword")
													   .addPathPatterns("/userSleepList")
		;
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/myPage")
													   .addPathPatterns("/updateProfile")
													   .addPathPatterns("/userSleep")
													   .addPathPatterns("/storeInsertForm")
													   .addPathPatterns("/storeUpdateForm")
													   .addPathPatterns("/stayInsertForm")
													   .addPathPatterns("/resContent")
													   .addPathPatterns("/resList")
													   .addPathPatterns("/resDetail")
		;
		
	}
}
