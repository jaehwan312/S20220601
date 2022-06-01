package com.oracle.S20220601.model.ih;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HostStore {
	
	// 공통
	private int host_num;		// 업체 번호
	//Host
	private int mem_num;		// 회원 번호
	private String host_name;	// 업체명
	private String host_addr;	// 업체 주소
	private String host_info;	// 업체 소개
	private int host_code;		// 업체 코드
	private int rev_count;		// 리뷰 갯수
	private float host_avg;		// 평점
	private int like_count;		// 찜한사람 수
	
	//Store
	private String open_time;	// 영업시간
	private String break_time;	// 브레이크 타임
	private String parking;		// 주차가능
	private String food_type;	// 음식코드
	
	//Menu
	private int menu_num;		// 메뉴 등록번호
	private String menu_name;	// 메뉴 이름
	private int menu_price;		// 가격
}
