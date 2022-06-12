package com.oracle.S20220601.service.ji;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ji.ResDao;
import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.ji.ResRoom;

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

}
