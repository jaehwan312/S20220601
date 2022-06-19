package com.oracle.S20220601.model.ji;



import lombok.Data;

@Data
public class KakaoInfo {
	private int host_num;		// 업체번호
	private int room_num;		// 객실번호
	private String room_name;	// 객실이름
	private String res_start;	// 예약첫날
	private String res_end;		// 예약마지막날
	private int price;			//총결제금액
	private String name;		//예약자 이름
	private String phone;		//핸드폰번호
	private String id;			//id	
	private String email;		//email

}
