package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Room {
	private int host_num;		// 업체번호
	private int room_num;		// 객실번호
	private String room_name;	// 객실이름
	private int allow;			// 가용인원
	private int mem_num;		// 회원번호
	private String room_info;	// 객실소개글
	private int dayfee;			// 평일요금
	private int weekfee;		// 주말요금
}
