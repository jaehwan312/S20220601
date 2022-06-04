package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomPhoto {
	private int 	host_num;		// 업체번호
	private int 	room_num;		// 객실번호
	private int 	room_photo_num;	// 사진번호
	private String  room_photo;		// 사진
}
