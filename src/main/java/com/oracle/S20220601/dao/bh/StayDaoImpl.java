package com.oracle.S20220601.dao.bh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.model.bh.HostStay;

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
	public List<Room> roomList(int host_num) {
		System.out.println("StayDaoImpl roomList start...");
		List<Room> roomList = null;
		try {
			roomList = session.selectList("roomList", host_num);
			System.out.println("StoreDaoImpl roomList roomList.size() --> " + roomList.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl roomList Exception->"+e.getMessage());
		}
		return roomList;
	}

	@Override
	public List<RoomPhoto> roomPhotoList(RoomPhoto roomPhoto) {
		System.out.println("StayDaoImpl roomPhoto start...");
		List<RoomPhoto> roomPhotoList = null;
		try {
			roomPhotoList = session.selectList("roomPhotoList", roomPhoto);
			
			System.out.println("StoreDaoImpl roomPhoto roomPhotoList.size() --> " + roomPhotoList.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl roomPhotoList Exception->"+e.getMessage());
		}
		return roomPhotoList;
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
	public List<Review> reviewList(int host_num) {
		System.out.println("StayDaoImpl reviewList start...");
		List<Review> reviewList = null;
		try {
			reviewList = session.selectList("reviewList", host_num);
			
			System.out.println("StoreDaoImpl reviewList reviewList.size() --> " + reviewList.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl reviewList Exception->"+e.getMessage());
		}
		return reviewList;
	}

	@Override
	public List<RevPhoto> reviewPhotoList(int host_num) {
		System.out.println("StayDaoImpl reviewPhotoList start...");
		List<RevPhoto> reviewPhotoList = null;
		try {
			reviewPhotoList = session.selectList("reviewPhotoList", host_num);
			
			System.out.println("StoreDaoImpl reviewPhotoList roomPhotoList.size() --> " + reviewPhotoList.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl reviewPhotoList Exception->"+e.getMessage());
		}
		return reviewPhotoList;	
	}

}
