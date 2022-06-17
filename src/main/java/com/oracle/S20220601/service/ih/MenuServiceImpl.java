package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ih.MenuDao;
import com.oracle.S20220601.model.Menu;

@Service
public class MenuServiceImpl implements MenuSeivice {
	
	@Autowired
	private MenuDao menuDao;
	
	@Override//메뉴리스트 
	public List<Menu> menuList(int host_num) {
		System.out.println("MenuServiceImpl menuList Start....");
		
		List<Menu> menuList = menuDao.menuList(host_num);
		
		return menuList;
	}

	@Override//메뉴 insert
	public int menuInsertList(List<Menu> menu) {
		
		System.out.println("MenuServiceImpl menuInsertList Start....");
		
		int menuInsert = menuDao.menuInsertList(menu);
		
		return menuInsert;
	}

	@Override
	public int menuUpdate(List<Menu> menus) {
		System.out.println("MenuServiceImpl menuUpdate Start....");
		
		int menuUpdate = menuDao.menuUpdate(menus);
		
		return menuUpdate;
	}

	@Override
	public int menuDelete(int menu_num) {
		System.out.println("MenuServiceImpl menuDelete Start....");
		
		int menuDelete = menuDao.menuDelete(menu_num);
		
		return menuDelete;
	}

}
