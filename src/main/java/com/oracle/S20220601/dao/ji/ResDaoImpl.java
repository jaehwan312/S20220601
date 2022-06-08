package com.oracle.S20220601.dao.ji;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Res;
@Repository
public class ResDaoImpl implements ResDao {
	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		int tot = 0;
		System.out.println("ResDaoImpl total Start....");
		try {
			tot = session.selectOne("jiResTotal");
			
		} catch (Exception e) {
			System.out.println("ResDaoImpl total Exception -> "+e.getMessage());
		}
		
		return tot;
	}

	@Override //예약확정
	public List<Res> listRes(Res res) {
		List<Res> listRes = null;
		System.out.println("ResDaoImpl listRes Start......");
		try {

			listRes = session.selectList("jiResList", res);
			System.out.println("ResDaoImpl listRes listRes.size() -> " + listRes.size());

		} catch (Exception e) {
			System.out.println("ResDaoImpl listRes Exception - > " + e.getMessage());
		}
		return listRes;
	}

	@Override
	public List<Res> listBeforeRes(Res res) {
		List<Res> listBeforeRes = null;
		System.out.println("ResDaoImpl listBeforeRes Start......");
		try {

			listBeforeRes = session.selectList("jiBeforeResList", res);
			System.out.println("ResDaoImpl listBeforeRes listBeforeRes.size() -> " + listBeforeRes.size());

		} catch (Exception e) {
			System.out.println("ResDaoImpl listBeforeRes Exception - > " + e.getMessage());
		}
		return listBeforeRes;
	}

	@Override
	public List<Res> listCancleRes(Res res) {
		List<Res> listCancleRes = null;
		System.out.println("ResDaoImpl listCancleRes Start......");
		try {

			listCancleRes = session.selectList("jiCancleResList", res);
			System.out.println("ResDaoImpl listCancleRes listCancleRes.size() -> " + listCancleRes.size());

		} catch (Exception e) {
			System.out.println("ResDaoImpl listCancleRes Exception - > " + e.getMessage());
		}
		return listCancleRes;
	}

	@Override
	public Res resDetail(int res_num) {
		Res res1 = null;
		System.out.println("ResDaoImpl resDetail Start....");
		try {
			res1 = session.selectOne("jiResDetail",res_num);
			
		} catch (Exception e) {
			System.out.println("ResDaoImpl resDetail Exception -> "+e.getMessage());
		}
		
		return res1;
	}
}
