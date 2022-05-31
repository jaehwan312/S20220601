package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Search {
	private String search_code;		// 검색어 코드
	private int search_num;			// 검색어 번호
	private String keyword;			// 키워드
	private String search_day;		// 검색일자
	private int search_count;		// 검색 횟수
}
