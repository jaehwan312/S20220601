package com.oracle.S20220601.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Menu {
	private int	   host_num;		// 업체 번호
	private int	   menu_num;		// 메뉴 등록번호
	private String menu_name;	    // 메뉴 이름
	private int	   menu_price;		// 가격
	
	List<Menu>     menu_list;
	
	//버퍼 저장용
	
	private int	   in_host_num;		// 업체 번호
	private int	   in_menu_num;		// 메뉴 등록번호
	private String in_menu_name;	    // 메뉴 이름
	private int	   in_menu_price;		// 가격
	
	public int getIn_host_num() {
		return host_num;
	}

	public int getIn_menu_num() {
		return menu_num;
	}

	public String getIn_menu_name() {
		return menu_name;
	}

	public int getIn_menu_price() {
		return menu_price;
	}
}
