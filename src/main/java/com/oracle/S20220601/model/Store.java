package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Store {
	private int    host_num;    // 업체번호
	private String open_time;	// 영업시간
	private String break_time;	// 브레이크 타임
	private String parking;		// 주차가능
	private String food_type;	// 음식코드
}
