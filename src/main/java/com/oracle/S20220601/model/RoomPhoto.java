package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomPhoto {
	private int host_num;		// 업체번호
	private int room_num;		// 객실번호
	private int photo_number;	// 사진번호
	private String photo;		// 사진
}
