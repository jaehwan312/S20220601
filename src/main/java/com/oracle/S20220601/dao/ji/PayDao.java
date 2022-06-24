package com.oracle.S20220601.dao.ji;

import com.oracle.S20220601.model.Pay;

public interface PayDao {

	int insertPay(Pay p_pay);

	int selectPaynumCurrval();

	Pay payByPaynum(Pay p_pay);

	int updatePaydate(Pay p_pay);

	int deleteFailPay(int pay_num);

	int deleteByResnum(Pay p_pay);

	int updateStatus(Pay p_pay);



}
