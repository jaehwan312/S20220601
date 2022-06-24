package com.oracle.S20220601.service.ji;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ji.ResDao;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.ji.ResInfo;
import com.oracle.S20220601.model.ji.ResRoom;
import com.oracle.S20220601.model.ji.RoomPay;

@Service
public class ResServiceImpl implements ResService {
	
	@Autowired
	private ResDao rd;

	@Override
	public int total() {
		System.out.println("ResServiceImpl total Start...");
		int toCnt = rd.total();
		return toCnt;
	}

	@Override
	public List<Res> listRes(Res res) {
		System.out.println("ResServiceImpl listRes Start...");
		List<Res> listRes = rd.listRes(res); 
		return listRes;
	}

	@Override
	public List<Res> listBeforeRes(Res res) {
		System.out.println("ResServiceImpl listBeforeRes Start...");
		List<Res> listBeforeRes = rd.listBeforeRes(res); 
		return listBeforeRes;
	}

	@Override
	public List<Res> listCancleRes(Res res) {
		System.out.println("ResServiceImpl listCancleRes Start...");
		List<Res> listCancleRes = rd.listCancleRes(res); 
		return listCancleRes;
	}

	@Override
	public Res resDetail(int res_num) {
		System.out.println("ResServiceImpl resDetail Start...");
		Res res1 = rd.resDetail(res_num);
		return res1;
	}

	@Override
	public ResRoom resRoom(Res res) {
		System.out.println("ResServiceImpl resRoom Start...");
		ResRoom room1 = rd.resRoom(res);
		return room1;
	}

	@Override
	public Profile profile(int mem_num) {
		System.out.println("ResServiceImpl  profile Start...");
		Profile prof = rd.profile(mem_num);
		return prof;
	}

	@Override
	public int totalFee(RoomPay rp) {
		System.out.println("ResServiceImpl  profile Start...");
		int total = rd.totalFee(rp);
		return total;
	}

	@Override
	public int insertRes(ResInfo resInfo) {
		System.out.println("ResServiceImpl  insertRes Start...");
		int insert_res = rd.insertRes(resInfo);
		return insert_res;

	}

	@Override
	public int selectResnumCurrval() {
		System.out.println("ResServiceImpl selectResnumCurrval Start...");
		int res_num = rd.selectResnumCurrval();
		return res_num;
	}

	@Override
	public Res resByResnum(int res_num) {
		System.out.println("ResServiceImpl resByResnum Start...");
		Res r_res = rd.resByResnum(res_num);
		return r_res;
	}

	@Override
	public int updateStatus(int res_num) {
		System.out.println("ResServiceImpl updateStatus Start...");
		int update_status = rd.updateStatus(res_num);
		return update_status;
	}

	@Override
	public int deleteFailRes(int res_num) {
		System.out.println("ResServiceImpl deleteFailRes Start...");
		int delete_res = rd.deleteFailRes(res_num);
		return delete_res;
	}

	@Override
	public int deleteByResnum(Res res) {
		System.out.println("ResServiceImpl deleteByResnum Start...");
		int delete_res = rd.deleteByResnum(res);
		return delete_res;
	}

	@Override
	public Res statusChange(int res_num) {
		System.out.println("ResServiceImpl statusChange Start...");
		Res res = rd.statusChange(res_num);
		return res;
	}

	@Override
	public int updStatusCanc(int res_num) {
		System.out.println("ResServiceImpl updStatusCanc Start...");
		int upd_res_canc = rd.updStatusCanc(res_num);
		return upd_res_canc;
	
	}
	

}
