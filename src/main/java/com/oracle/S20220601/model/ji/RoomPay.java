package com.oracle.S20220601.model.ji;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
// 총결제금액 구하는 mapper에 가져갈 요소들 
public class RoomPay {
	private String res_start;	// 예약첫날
	private String res_end;		// 예약마지막날
	private int dayfee;			// 평일요금
	private int weekfee;		// 주말요금

}
