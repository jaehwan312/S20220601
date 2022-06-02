package com.oracle.S20220601.domain.jj;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
@Embeddable
// menu1 테이블 복수키 설정 클래스
public class MenuMultiId implements Serializable {
	private int host_num;		// 업체 번호
	private int menu_num;		// 메뉴 등록번호
}
