package com.oracle.S20220601.domain.jj;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "code")
@IdClass(CodeMultiId.class)
public class Code1 {
	@Id
	private int bcd;		// 대분류
	@Id
	private int mcd;		// 중분류
	private String name;	// 내용
}
