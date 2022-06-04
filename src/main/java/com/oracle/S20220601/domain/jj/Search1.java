package com.oracle.S20220601.domain.jj;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "search")
@IdClass(SearchMultiId.class)
public class Search1{
	@Id
	private String search_code;		// 검색어 코드
	@Id
	private int search_num;			// 검색어 번호
	private String keyword;			// 키워드
	private String search_day;		// 검색일자
	private int search_count;		// 검색 횟수
}
