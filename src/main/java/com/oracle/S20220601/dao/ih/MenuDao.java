package com.oracle.S20220601.dao.ih;

import java.util.List;

import com.oracle.S20220601.model.Menu;

public interface MenuDao {
	List<Menu>      menuList(int host_num);			  //메뉴리스트
	int             menuInsertList(List<Menu> menu);  //메뉴 정보 등록
}
