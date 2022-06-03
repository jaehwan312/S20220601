package com.oracle.S20220601.service.bh;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.bh.StayDao;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.model.bh.HostStay;
import com.oracle.S20220601.model.ih.HostStore;

@Service
public class StayServiceImpl implements StayService {
	
	@Autowired
	private StayDao sd;
	
	@Override
	public HostStay stayRead(int host_num) {
		System.out.println("StayServiceImpl storeRead start...");
		HostStay stayRead=sd.stayRead(host_num);
		return stayRead;
	}

	@Override
	public List<HostPhoto> stayPhoto(int host_num) {
		System.out.println("StayServiceImpl stayPhoto start...");
		List<HostPhoto> stayPhoto=sd.stayPhoto(host_num);
		return stayPhoto;
	}

	@Override
	public List<Room> roomList(int host_num) {
		System.out.println("StayServiceImpl roomList start...");
		List<Room> roomList =sd.roomList(host_num);
		return roomList;
	}


	@Override
	public List<RoomPhoto> roomPhotoList(RoomPhoto roomPhoto) {
		System.out.println("StayServiceImpl roomPhoto start...");
		List<RoomPhoto> roomPhotoList = sd.roomPhotoList(roomPhoto);
		return roomPhotoList;
	}

	@Override
	public Stay stayinfo(int host_num) {
		System.out.println("StayServiceImpl roomPhoto start...");
		Stay stayinfo = sd.stayinfo(host_num);
		return stayinfo;
	}

	@Override
	public List<Review> reviewList(int host_num) {
		System.out.println("StayServiceImpl reviewList start...");
		List<Review> reviewList = sd.reviewList(host_num);
		return reviewList;
	}

	@Override
	public List<RevPhoto> reviewPhotoList(int host_num) {
		System.out.println("StayServiceImpl reviewList start...");
		List<RevPhoto> reviewPhotoList = sd.reviewPhotoList(host_num);
		return reviewPhotoList;
	}

}
