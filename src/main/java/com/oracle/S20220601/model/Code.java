package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Code {
	private int bcd;		// 대분류
	private int mcd;		// 중분류
	private String name;	// 내용
}
