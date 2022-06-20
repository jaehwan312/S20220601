package com.oracle.S20220601.dao.ji;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Profile;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.ji.ResInfo;
import com.oracle.S20220601.model.ji.ResRoom;
import com.oracle.S20220601.model.ji.RoomPay;
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

	@Override
//	예약페이지 예약한 객실 정보 가져오기
	public ResRoom resRoom(Res res) {
		ResRoom room1 = null;
		System.out.println("ResDaoImpl resRoom Start....");
		try {
			room1 = session.selectOne("jiResRoom",res);
			
		} catch (Exception e) {
			System.out.println("ResDaoImpl resRoom Exception -> "+e.getMessage());
		}
		
		return room1;
	}

	@Override
	public Profile profile(int mem_num) {
		Profile prof = null;
		System.out.println("ResDaoImpl profile Start....");
		try {
			prof = session.selectOne("jiProfile",mem_num);
			
		} catch (Exception e) {
			System.out.println("ResDaoImpl profile Exception -> "+e.getMessage());
		}
		
		return prof;
	}

	@Override
	public int totalFee(RoomPay rp) {
		int totalFee = 0;
		System.out.println("ResDaoImpl totalFee Start....");
		try {
			totalFee = session.selectOne("jiTotalFee",rp);
			
		} catch (Exception e) {
			System.out.println("ResDaoImpl totalFee Exception -> "+e.getMessage());
		}
		
		return totalFee;
	}

	@Override
	public int insertRes(ResInfo resInfo) {
		int insert_res = 0;
		System.out.println("ResDaoImpl insertRes Start....");
		try {
			insert_res = session.insert("jiInsertRes",resInfo);
			
		} catch (Exception e) {
			System.out.println("ResDaoImpl insertRes Exception -> "+e.getMessage());
		}
		
		return insert_res;
	}

	@Override
	public int selectResnumCurrval() {
		int res_num = 0;
		System.out.println("ResDaoImpl selectResnumCurrval Start....");
		try {
			res_num = session.selectOne("jiSelectResnumCurrval");
			
		} catch (Exception e) {
			System.out.println("ResDaoImpl selectResnumCurrval Exception -> "+e.getMessage());
		}
		
		return res_num;
	}

	@Override
	public Res resByResnum(int res_num) {
		Res r_res = null;
		System.out.println("ResDaoImpl resByResnum Start....");
		try {
			r_res = session.selectOne("jiResByResnum",res_num);
			
		} catch (Exception e) {
			System.out.println("ResDaoImpl resByResnum Exception -> "+e.getMessage());
		}
		
		return r_res;
	}


}
