package com.oracle.S20220601.dao.ih;

import java.util.List;

import javax.mail.Session;

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
			System.out.println("MenuDaoImpl menuList storePhoto.size() --> " + menuList.size());
		} catch (Exception e) {
			System.out.println("MenuDaoImpl menuList ErrorMessage --> " + e.getMessage());
		}
		return menuList;
	}

	@Override
	public int menuInsertList(List<Menu> menu) {
		
		System.out.println("MenuDaoImpl menuInsertList Start....");
		
		int  menuInsert = 0;
		
		try {
			for (int i = 0; i < menu.size(); i++) {
//				System.out.println("i --> " + i);
//				System.out.println(menu.get(i).getMenu_name());
//				System.out.println(menu.get(i).getMenu_price());
				menuInsert += session.insert("menuInsert", menu.get(i));
			}
		} catch (Exception e) {
			System.out.println("MenuDaoImpl menuInsertList ErrorMessage --> " + e.getMessage());
		}
		return menuInsert;
	}
}
