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
@Table(name = "stay")
public class Stay1 {
	@Id
	private int host_num;		// 업체번호
	private String convenient;	// 편의시설
	private String way;			// 숙소 오는길
	private String checkin;		// 체크인 시간
	private String checkout;	// 체크아웃 시간
	
	@Transient
	private String name; 		// 코드번호로 이름 불러오는 버퍼
}
