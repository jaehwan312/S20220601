package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Notice {
	private int n_num;			// 글번호
	private int mem_num;		// 회원번호
	private String n_title;		// 제목
	private String n_date;		// 작성일자
	private int n_view;			// 조회수
	private String n_content;	// 내용
	private String n_photo;		// 사진 Path
	
	// 조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
}
