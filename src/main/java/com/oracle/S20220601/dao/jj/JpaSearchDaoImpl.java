package com.oracle.S20220601.dao.jj;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Menu1;
import com.oracle.S20220601.domain.jj.Stay1;

@Repository
public class JpaSearchDaoImpl implements JpaSearchDao {
	@Autowired
	private EntityManager em;

	@Override
	public List<Host1> getHostList() {
		List<Host1> hostList = em.createQuery("select h from Host1 h", Host1.class).getResultList();
		return hostList;
	}


	@Override
	public List<Menu1> getMenuList() {
		List<Menu1> menuList = em.createQuery("select m from Menu1 m", Menu1.class).getResultList();
		return menuList;
	}


	@Override
	public List<Stay1> getStayList() {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}
}
