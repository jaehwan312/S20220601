package com.oracle.S20220601.dao.bh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
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
			System.out.println("StoreDaoImpl storePhoto stayPhoto.size() --> " + stayPhoto.size());
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
			System.out.println("StoreDaoImpl storePhoto roomList.size() --> " + roomList.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayPhoto Exception->"+e.getMessage());
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

}
