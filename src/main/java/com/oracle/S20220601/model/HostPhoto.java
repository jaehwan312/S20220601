package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HostPhoto {
	private int host_num;		// 업체 번호
	private int photo_number;	// 사진 번호
	private String photo;		// 사진
}
