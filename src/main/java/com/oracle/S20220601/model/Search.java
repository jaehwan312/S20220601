package com.oracle.S20220601.model;

import java.util.List;

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
	
	//검색조건 
	private String min_price;
	private List<String> food_type;
	private String total_food_type;
	private List<String> stay_type;
	private String total_stay_type;
	
	//페이지 상세검색 조건
	private String order;
	private String selection;
	private List<String> region;
	private String stayprice;
	private String storeprice;
	
	//나의 찜하기 유무 호출을 위한 mem_num
	private int mem_num;
	
}
