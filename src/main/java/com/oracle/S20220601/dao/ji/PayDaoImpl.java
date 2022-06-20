package com.oracle.S20220601.dao.ji;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Pay;

@Repository
public class PayDaoImpl implements PayDao {
	@Autowired
	private SqlSession session;

	@Override
	public int insertPay(Pay p_pay) {
		int insert_pay = 0;
		System.out.println("PayDaoImpl insertPay Start....");
		try {
			insert_pay = session.insert("jiInsertPay",p_pay);
			
		} catch (Exception e) {
			System.out.println("PayDaoImpl insertPay Exception -> "+e.getMessage());
		}
		
		return insert_pay;
	}



}
