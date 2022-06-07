package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Res {
	private int res_num;		// 예약번호
	private int host_num;		// 업체번호
	private int room_num;		// 객실번호
	private int mem_num;		// 회원번호
	private String res_start;	// 예약시작일(체크인)
	private String res_end;		// 예약종료일(체크아웃)
	private String pay;			// 결제방식
	private String res_status;	// 진행상태
	
	//join 조회용
	private String name;
	private String host_name;	//  업체명
	private String host_photo;
	private String room_name;
	private String nday;	//숙박일수
	private String sday;	//예약시작일 to_char
	private String eday;	//예약종료일 to_char
	
}
