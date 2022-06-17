package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Menu;

@Repository
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	private SqlSession session;
	
	@Override//메뉴리스트
	public List<Menu> menuList(int host_num) {
		System.out.println("MenuDaoImpl menuList Start....");
		
		List<Menu> menuList = null;
		
		try {
			menuList = session.selectList("menuList", host_num);
//			System.out.println("MenuDaoImpl menuList storePhoto.size() --> " + menuList.size());
		} catch (Exception e) {
			System.out.println("MenuDaoImpl menuList ErrorMessage --> " + e.getMessage());
		}
		return menuList;
	}

	@Override//메뉴 정보 등록
	public int menuInsertList(List<Menu> menu) {
		
		System.out.println("MenuDaoImpl menuInsertList Start....");
		
		int  menuInsert = 0;
		
		try {
			for (int i = 0; i < menu.size(); i++) {
				menuInsert += session.insert("menuInsert", menu.get(i));
			}
		} catch (Exception e) {
			System.out.println("MenuDaoImpl menuInsertList ErrorMessage --> " + e.getMessage());
		}
		return menuInsert;
	}

	@Override
	public int menuUpdate(List<Menu> menus) {
		
		System.out.println("MenuDaoImpl menuUpdate Start....");
		
		int  menuUpdate = 0;
		
		try {
			for (int i = 0; i < menus.size(); i++) {
				menuUpdate += session.update("menuUpdate", menus.get(i));
			}
		} catch (Exception e) {
			System.out.println("MenuDaoImpl menuUpdate ErrorMessage --> " + e.getMessage());
		}
		return menuUpdate;
	}

	@Override
	public int menuDelete(int menu_num) {
		
		System.out.println("MenuDaoImpl menuDelete Start....");
		
		int  menuDelete = 0;
		
		try {
				menuDelete += session.delete("menuDelete",menu_num);
		} catch (Exception e) {
			System.out.println("MenuDaoImpl menuDelete ErrorMessage --> " + e.getMessage());
		}
		return menuDelete;
	}
}
