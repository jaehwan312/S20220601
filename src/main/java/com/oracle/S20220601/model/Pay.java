package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay {
	private int pay_num;			// 결제 번호
	private int res_num;			// 예약 번호
	private String pay_status;		// 결제 상태
	private String pay_date;		// 결제 일자
	private int price;				// 결제 금액
	private String canc_reason;		// 취소 사유
	private String canc_date;		// 결제 취소일자	
}
