package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Host {
	private int host_num;		// 업체 번호
	private int mem_num;		// 회원 번호
	private String host_name;	// 업체명
	private String host_addr;	// 업체 주소
	private String host_info;	// 업체 소개
	private int host_code;		// 업체 코드
	private int rev_count;		// 리뷰 갯수
	private float host_avg;		// 평점
	private int like_count;		// 찜한사람 수
	
	// 내가 찜했는지 유무
	private int my_like;
	private int rev_point;
}
