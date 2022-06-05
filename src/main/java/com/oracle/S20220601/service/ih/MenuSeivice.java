package com.oracle.S20220601.service.ih;

import java.util.List;

import com.oracle.S20220601.model.Menu;

public interface MenuSeivice {
	List<Menu>      menuList(int host_num);			  //메뉴리스트
}
