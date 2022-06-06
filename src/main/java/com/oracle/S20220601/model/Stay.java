package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Stay {
	private int host_num;		// 업체번호
	private String convenient;	// 편의시설
	private String way;			// 숙소 오는길
	private String checkin;		// 체크인 시간
	private String checkout;	// 체크아웃 시간
	private String stay_type;   // 숙소코드
}
