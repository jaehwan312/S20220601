package com.oracle.S20220601.model.jj;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HostStayjj {
	private int host_num;		// 업체 번호
	private int mem_num;		// 회원 번호
	private String host_name;	// 업체명
	private String host_addr;	// 업체 주소
	private String host_info;	// 업체 소개
	private int host_code;		// 업체 코드
	private int rev_count;		// 리뷰 갯수
	private float host_avg;		// 평점
	private int like_count;		// 찜한사람 수
	
	//숙소 버퍼
	private String convenient;	// 편의시설
	private String way;			// 숙소 오는길
	private String checkin;		// 체크인 시간
	private String checkout;	// 체크아웃 시간
	private String stay_type;   // 숙소코드
	
	//가격정보 + 숙소타입
	private int min_dayfee;		 // 평일 최소가격
	private int max_dayfee;		 // 평일 최대가격
	private int min_weekfee;	 // 주말 최소가격
	private int max_weekfee;	 // 주말 최대가격
	private String type_name;		 // 유형 이름
	
	// 숙소 사진
	private String host_photo;
}
