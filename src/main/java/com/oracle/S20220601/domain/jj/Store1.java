package com.oracle.S20220601.domain.jj;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "store")
public class Store1 {
	@Id
	private int     host_num;    // 업체번호
	private String open_time;	// 영업시간
	private String break_time;	// 브레이크 타임
	private String parking;		// 주차가능
	private String food_type;	// 음식코드
	
	@Transient
	private String name; 		// 코드번호로 이름 불러오는 버퍼
}
