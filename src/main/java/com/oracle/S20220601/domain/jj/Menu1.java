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
@Table(name = "menu")
@IdClass(MenuMultiId.class)
public class Menu1 {
	@Id
	private int host_num;		// 업체 번호
	@Id
	private int menu_num;		// 메뉴 등록번호
	private String menu_name;	// 메뉴 이름
	private int menu_price;		// 가격
}
