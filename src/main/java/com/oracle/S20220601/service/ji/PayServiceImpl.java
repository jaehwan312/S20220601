package com.oracle.S20220601.service.ji;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ji.PayDao;
import com.oracle.S20220601.model.Pay;
import com.oracle.S20220601.model.Res;

@Service
public class PayServiceImpl implements PayService {
	@Autowired
	private PayDao pd;
	
	@Override
	public int insertPay(Pay p_pay) {
		System.out.println("PayServiceImpl insertPay Start...");
		int insert_pay = pd.insertPay(p_pay); 
		return insert_pay; 
	}

	@Override
	public int selectPaynumCurrval() {
		System.out.println("ResServiceImpl selectPaynumCurrval Start...");
		int pay_num = pd.selectPaynumCurrval();
		return pay_num;
	}

	@Override
	public Pay payByPaynum(Pay p_pay) {
		System.out.println("PayServiceImpl payByPaynum Start...");
		Pay p_pay2 = pd.payByPaynum(p_pay);
		return p_pay2;
	}

	@Override
	public int updatePaydate(Pay p_pay) {
		System.out.println("PayServiceImpl updatePaydate Start...");
		int update_paydate = pd.updatePaydate(p_pay);
		return update_paydate;
	}

	@Override
	public int deleteFailPay(int pay_num) {
		System.out.println("PayServiceImpl deleteFailPay Start...");
		int delete_pay = pd.deleteFailPay(pay_num);
		return delete_pay;
	}
}
