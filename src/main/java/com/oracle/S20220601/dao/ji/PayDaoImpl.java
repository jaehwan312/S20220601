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

	@Override
	public int selectPaynumCurrval() {
		int pay_num = 0;
		System.out.println("PayDaoImpl selectPaynumCurrval Start....");
		try {
			pay_num = session.selectOne("jiSelectPaynumCurrval");
			
		} catch (Exception e) {
			System.out.println("PayDaoImpl selectPaynumCurrval Exception -> "+e.getMessage());
		}
		
		return pay_num;
	}

	@Override
	public Pay payByPaynum(Pay p_pay) {
		Pay p_pay2 = null;
		System.out.println("PayDaoImpl payByPaynum Start....");
		try {
			p_pay2 = session.selectOne("jiPayByPaynum",p_pay);
			
		} catch (Exception e) {
			System.out.println("PayDaoImpl payByPaynum Exception -> "+e.getMessage());
		}
		
		return p_pay2;
	}
	
	
	@Override
	public int updatePaydate(Pay p_pay) {
		int update_paydate = 0;
		System.out.println("PayDaoImpl updatePaydate Start....");
		try {
			update_paydate = session.update("jiUpdatePayDate",p_pay);
			
		} catch (Exception e) {
			System.out.println("PayDaoImpl updatePaydate Exception -> "+e.getMessage());
		}
		
		return update_paydate;
	}

	@Override
	public int deleteFailPay(int pay_num) {
		int delete_pay = 0;
		System.out.println("PayDaoImpl deleteFailPay Start....");
		try {
			delete_pay = session.delete("jiDeleteFailPay",pay_num);
			
		} catch (Exception e) {
			System.out.println("PayDaoImpl deleteFailPay Exception -> "+e.getMessage());
		}
		
		return delete_pay;
	}

	@Override
	public int deleteByResnum(Pay p_pay) {
		int delete_pay = 0;
		System.out.println("PayDaoImpl deleteByResnum Start....");
		try {
			delete_pay = session.delete("jiDelPayByResnum",p_pay);
			
		} catch (Exception e) {
			System.out.println("PayDaoImpl deleteByResnum Exception -> "+e.getMessage());
		}
		
		return delete_pay;
	}
	@Override
	public int updateStatus(Pay p_pay) {
		int upd_pay_status = 0;
		System.out.println("PayDaoImpl updateStatus Start....");
		try {
			upd_pay_status = session.update("jiUpdStatusCanc",p_pay);
			
		} catch (Exception e) {
			System.out.println("PayDaoImpl updateStatus Exception -> "+e.getMessage());
		}
		
		return upd_pay_status;
	}



}
