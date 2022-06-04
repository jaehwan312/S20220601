package com.oracle.S20220601.domain.jj;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
@Embeddable
// menu1 테이블 복수키 설정 클래스
public class CodeMultiId implements Serializable {
	private int bcd;		// 대분류
	private int mcd;		// 중분류
}
