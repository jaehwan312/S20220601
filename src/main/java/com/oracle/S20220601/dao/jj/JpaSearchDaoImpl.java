package com.oracle.S20220601.dao.jj;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Search1;

@Repository
public class JpaSearchDaoImpl implements JpaSearchDao {
	@Autowired
	private EntityManager em;

	@Override
	public List<Host1> getHostList() {
		List<Host1> host1 =null;
		try {
			host1 = em.createQuery("select h from Host1 h", Host1.class).getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return host1;
	}

	@Override
	public List<Search1> getRecList() {
		List<Search1> search1 = null;
		try {
			search1 = em.createQuery("select s from Search1 s where s.search_code=:code").setParameter("code", "1").getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return search1;
	}

	@Override
	public List<Search1> getPopList() {
		List<Search1> search1 = null;
		try {
			search1 = em.createQuery("select s from Search1 s where s.search_code=:code order by s.search_count desc, s.search_num").setParameter("code", "2").getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return search1;
	}


}
