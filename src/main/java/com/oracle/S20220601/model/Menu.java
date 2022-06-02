package com.oracle.S20220601.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Menu {
	private int	   host_num;		// 업체 번호
	private int	   menu_num;		// 메뉴 등록번호
	private String menu_name;	    // 메뉴 이름
	private int	   menu_price;		// 가격
}
