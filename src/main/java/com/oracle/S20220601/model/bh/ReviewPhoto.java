package com.oracle.S20220601.model.bh;

public class ReviewPhoto {
	//공통
	private int host_num;			// 업체번호
	private int rev_num;			// 리뷰번호
	//review
	private int mem_num;			// 회원번호
	private String rev_content;		// 리뷰내용
	private String rev_date;		// 리뷰 등록일자
	private int rev_point;			// 평점
	private int ref;				// ref
	private int re_step;			// re_step
	//revphoto
	private int rev_photo_num;		// 사진번호
	private String rev_photo;		// 사진
}
