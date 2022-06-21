package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Review {
	private int host_num;			// 업체번호
	private int rev_num;			// 리뷰번호
	private int mem_num;			// 회원번호
	private String rev_content;		// 리뷰내용
	private String rev_date;		// 리뷰 등록일자
	private int rev_point;			// 평점
	private int ref;				// ref
	private int re_step;			// re_step
	
	
	//버퍼 저장용
	private String name; //작성자 이름
	private String photo; //작성자 사진

}
