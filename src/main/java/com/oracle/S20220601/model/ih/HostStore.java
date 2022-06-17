package com.oracle.S20220601.model.ih;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HostStore {
	
	// 공통
	private int    host_num;		// 업체 번호
	//Host
	private int    mem_num;		// 회원 번호
	private String host_name;	// 업체명
	private String host_addr;	// 업체 주소
	private String host_info;	// 업체 소개
	private int    host_code;		// 업체 코드
	private int    rev_count;		// 리뷰 갯수
	private float  host_avg;		// 평점
	private int    like_count;		// 찜한사람 수
	private int    host_app;		// 관리자 승인 여부
	
	//코드 구분
	private int	   bcd_code = 200;	// bcd코드
	
	//시간구분
	private String start_time;
	private String end_time;
	
	private String break_start_time;
	private String break_end_time;
	
	//Store
	private String open_time;	// 영업시간
	private String break_time;	// 브레이크 타임
	private String parking;		// 주차가능
	private String food_type;	// 음식코드
	
	
	//버퍼 저장
	
	// 공통
	private int    in_host_num   = host_num;		// 업체 번호
	//Host
	private int    in_mem_num    = mem_num;		// 회원 번호
	private String in_host_name;	// 업체명
	private String in_host_addr;	// 업체 주소
	private String in_host_info;	// 업체 소개
	private int    in_host_code;		// 업체 코드
	private int    in_rev_count;		// 리뷰 갯수
	private float  in_host_avg;		// 평점
	private int    in_like_count;		// 찜한사람 수
	private int    in_host_app;		// 관리자 승인 여부
	               
	//코드 구분    
	private int	   in_bcd_code = 200;	// bcd코드
	               
	//시간구분     
	private String in_start_time;
	private String in_end_time;
	               
	private String in_break_start_time;
	private String in_break_end_time;
	               
	//Store        
	private String in_open_time;	// 영업시간
	private String in_break_time;	// 브레이크 타임
	private String in_parking;		// 주차가능
	private String in_food_type;	// 음식코드
	
	
	public int getIn_host_num() {
		return host_num;
	}
	public int getIn_mem_num() {
		return mem_num;
	}
	public String getIn_host_name() {
		return host_name;
	}
	public String getIn_host_addr() {
		return host_addr;
	}
	public String getIn_host_info() {
		return host_info;
	}
	public int getIn_host_code() {
		return host_code;
	}
	public int getIn_rev_count() {
		return rev_count;
	}
	public float getIn_host_avg() {
		return host_avg;
	}
	public int getIn_like_count() {
		return like_count;
	}
	public int getIn_host_app() {
		return host_app;
	}
	public int getIn_bcd_code() {
		return bcd_code;
	}
	public String getIn_start_time() {
		return start_time;
	}
	public String getIn_end_time() {
		return end_time;
	}
	public String getIn_break_start_time() {
		return break_start_time;
	}
	public String getIn_break_end_time() {
		return break_end_time;
	}
	public String getIn_parking() {
		return parking;
	}
	public String getIn_food_type() {
		return food_type;
	}
	    
	
	
}
