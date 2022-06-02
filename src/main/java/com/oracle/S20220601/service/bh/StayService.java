package com.oracle.S20220601.service.bh;

import java.util.List;

import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
import com.oracle.S20220601.model.bh.HostStay;
import com.oracle.S20220601.model.ih.HostStore;

public interface StayService {

	HostStay 			stayRead(int host_num);
	List<HostPhoto> 	stayPhoto(int host_num);
	List<Room> 			roomList(int host_num);
	List<RoomPhoto> 	roomPhotoList(RoomPhoto roomPhoto);
	
}

