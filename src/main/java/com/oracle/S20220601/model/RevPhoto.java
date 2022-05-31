package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RevPhoto {
	private int host_num;		// 업체번호
	private int rev_num;		// 리뷰번호
	private int photo_number;	// 사진번호
	private String photo;		// 사진
}
