package com.oracle.S20220601.model.bh;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HostStay {
	//pk
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
	private int host_app;		// 관리자승인
	//Stay
	private String convenient;	// 편의시설
	private String way;			// 숙소 오는길
	private String checkin;		// 체크인 시간
	private String checkout;	// 체크아웃 시간
	private String stay_type;	// 숙소코드
	//room
	private String room_name;	// 객실이름
	private String	 allow;			// 가용인원
	private String room_info;	// 객실소개글
	private String dayfee;			// 평일요금
	private String weekfee;		// 주말요금
	//코드
	private int	   bcd_code = 300;	// bcd코드
	//res
	private int res_num;		// 예약번호
	private int room_num;		// 객실번호
	private String res_start;	// 예약시작일(체크인)
	private String res_end;		// 예약종료일(체크아웃)
	private String res_status;	// 진행상태
	//hostPhoto
	private int    host_photo_num;	// 사진 번호
	private String host_photo;		// 사진
}
