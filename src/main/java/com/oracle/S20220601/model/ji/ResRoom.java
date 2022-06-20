package com.oracle.S20220601.model.ji;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
/* 예약페이지 객실정보 */
public class ResRoom {
	private int host_num;		// 업체번호
	private int room_num;		// 객실번호
	private String room_name;	// 객실이름
	private int allow;			// 가용인원
	private String room_info;	// 객실소개글
	private int dayfee;			// 평일요금
	private int weekfee;		// 주말요금
	
	
	private String host_name;	// 업체명
	private String checkin;		// 체크인 시간
	private String checkout;	// 체크아웃 시간
	private int price;
}
