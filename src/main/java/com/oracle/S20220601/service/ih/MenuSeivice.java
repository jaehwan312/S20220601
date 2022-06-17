package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.Menu;

public interface MenuSeivice {
	List<Menu>      menuList(int host_num);		     //메뉴리스트
	int			    menuInsertList(List<Menu> menus);//메뉴 insert
	int				menuUpdate(List<Menu> menus);    //메뉴 update
	int             menuDelete(int menu_num);		 //메뉴 삭제
}  
