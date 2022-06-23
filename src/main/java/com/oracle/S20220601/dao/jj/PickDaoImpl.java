package com.oracle.S20220601.dao.jj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PickDaoImpl implements PickDao {
	@Autowired
	private SqlSession session;
	
	
}
