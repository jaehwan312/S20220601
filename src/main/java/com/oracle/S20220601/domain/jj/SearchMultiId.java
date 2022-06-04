package com.oracle.S20220601.domain.jj;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Embeddable
public class SearchMultiId implements Serializable {
	
	private String search_code;		// 검색어 코드
	private int search_num;			// 검색어 번호
}
