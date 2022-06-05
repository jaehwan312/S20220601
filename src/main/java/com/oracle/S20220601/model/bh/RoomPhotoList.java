package com.oracle.S20220601.model.bh;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomPhotoList {
	//공통
	private int 		host_num;		// 업체번호
	private int 		room_num;		// 객실번호
	//room
	private String 		room_name;		// 객실이름
	private int 		allow;			// 가용인원
	private String 		room_info;		// 객실소개글
	private int 		dayfee;			// 평일요금
	private int 		weekfee;		// 주말요금
	//roomphoto
	private int 		room_photo_num;	// 사진번호
	private String  	room_photo;		// 사진
}
