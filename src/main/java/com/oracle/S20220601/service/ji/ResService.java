package com.oracle.S20220601.service.ji;

import java.util.List;

import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.ji.ResRoom;
import com.oracle.S20220601.model.ji.RoomPay;

public interface ResService {

	int total();

	List<Res> listRes(Res res);

	List<Res> listBeforeRes(Res res);

	List<Res> listCancleRes(Res res);

	Res resDetail(int res_num);

	ResRoom resRoom(Res res);

	Profile profile(int mem_num);

	int totalFee(RoomPay rp);





}
