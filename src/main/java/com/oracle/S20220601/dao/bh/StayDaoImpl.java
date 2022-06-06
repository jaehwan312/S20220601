package com.oracle.S20220601.dao.bh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.model.bh.HostStay;
import com.oracle.S20220601.model.bh.Review1;
import com.oracle.S20220601.model.bh.RoomPhotoList;

@Repository
public class StayDaoImpl implements StayDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public HostStay stayRead(int host_num) {
		System.out.println("StayDaoImpl stayRead start...");
		HostStay stayRead=null;
		try {
			stayRead = session.selectOne("stayRead", host_num);
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayRead Exception->"+e.getMessage());
		}
		return stayRead;
	}

	@Override
	public List<HostPhoto> stayPhoto(int host_num) {
		System.out.println("StayDaoImpl stayPhoto start...");
		List<HostPhoto> stayPhoto=null;
		try {
			stayPhoto = session.selectList("stayPhoto", host_num);
			System.out.println("StoreDaoImpl stayPhoto stayPhoto.size() --> " + stayPhoto.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayPhoto Exception->"+e.getMessage());
		}
		return stayPhoto;
	}

	@Override
	public List<RoomPhotoList> roomPhoto(RoomPhotoList roomPhotoList) {
		System.out.println("StayDaoImpl roomPhoto start...");
		List<RoomPhotoList> roomPhoto = null;
		try {
			roomPhoto = session.selectList("roomPhoto", roomPhotoList);
			System.out.println("StoreDaoImpl roomPhoto roomPhoto.size() --> " + roomPhoto.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl roomPhoto Exception->"+e.getMessage());
		}
		return roomPhoto;
	}

	@Override
	public Stay stayinfo(int host_num) {
		System.out.println("StayDaoImpl stayinfo start...");
		Stay stayinfo = null;
		try {
			stayinfo = session.selectOne("stayinfo", host_num);
			
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayinfo Exception->"+e.getMessage());
		}
		return stayinfo;
	}

	@Override
	public HostStay stayReadreview(int host_num) {
		System.out.println("StayDaoImpl stayReadreview start...");
		HostStay stayReadreview=null;
		try {
			stayReadreview = session.selectOne("stayRead", host_num);
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayReadreview Exception->"+e.getMessage());
		}
		return stayReadreview;
	}

	@Override
	public List<Review1> reviewList(int host_num) {
		System.out.println("StayDaoImpl reviewList start...");
		List<Review1> reviewList = null;
		try {
			reviewList = session.selectList("reviewList", host_num);
			List<RevPhoto> rp =null;
			for(Review1 rv : reviewList) {
				rp = session.selectList("revPhotoList", rv);
				rv.setRevPhoto(rp);
			}
		} catch (Exception e) {
			System.out.println("StayDaoImpl reviewList Exception->"+e.getMessage());
		}
		return reviewList;
	}

	@Override
	public Host hostreview(int host_num) {
		System.out.println("StayDaoImpl hostreview start...");
		Host hostreview=null;
		try {
			hostreview = session.selectOne("hostreview", host_num);
		} catch (Exception e) {
			System.out.println("StayDaoImpl hostreview Exception->"+e.getMessage());
		}
		return hostreview;
	}


}
