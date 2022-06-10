package com.oracle.S20220601.model.jj;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HostStorejj {
	private int host_num;		// 업체 번호
	private int mem_num;		// 회원 번호
	private String host_name;	// 업체명
	private String host_addr;	// 업체 주소
	private String host_info;	// 업체 소개
	private int host_code;		// 업체 코드
	private int rev_count;		// 리뷰 갯수
	private float host_avg;		// 평점
	private int like_count;		// 찜한사람 수
	
	// 가게 버퍼
	private String open_time;	// 영업시간
	private String break_time;	// 브레이크 타임
	private String parking;		// 주차가능
	private String food_type;	// 음식코드
	
	// 가격 정보 + 맛집 타입
	private int min_price;		// 메뉴 최소가격
	private int max_price;		// 메뉴 최대가격
	private String type_name;	// 유형 이름
	
	// 맛집 사진
	private String host_photo;
}
