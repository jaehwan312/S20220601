package com.oracle.S20220601.dao.jj;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.domain.jj.Code1;
import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Menu1;
import com.oracle.S20220601.domain.jj.Stay1;
import com.oracle.S20220601.domain.jj.Store1;

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
		List<Stay1> stayList = em.createQuery("select s from Stay1 s", Stay1.class).getResultList();
		for(Stay1 st : stayList) {
			Code1 code1 = (Code1) em.createQuery("select c from Code1 c where c.mcd=:stay_type and c.bcd=:stay", Code1.class).setParameter("stay_type", Integer.parseInt(st.getStay_type())).setParameter("stay", 300).getSingleResult(); 
			st.setName(code1.getName());
		}
		return stayList;
	}

	@Override
	public List<Store1> getStoreList() {
		List<Store1> storeList = em.createQuery("select s from Store1 s", Store1.class).getResultList();
		for(Store1 sr : storeList) {
			Code1 code1 = (Code1) em.createQuery("select c from Code1 c where c.mcd=:food_type and c.bcd=:store", Code1.class).setParameter("food_type", Integer.parseInt(sr.getFood_type())).setParameter("store", 200).getSingleResult();
			sr.setName(code1.getName());
		}
		return storeList;
	}
}
