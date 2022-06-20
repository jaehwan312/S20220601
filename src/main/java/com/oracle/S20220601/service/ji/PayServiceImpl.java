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
	
}
