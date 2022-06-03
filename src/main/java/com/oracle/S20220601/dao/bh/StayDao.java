package com.oracle.S20220601.dao.bh;

import java.util.List;

import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.model.bh.HostStay;

public interface StayDao {

	HostStay 			stayRead(int host_num);
	List<HostPhoto> 	stayPhoto(int host_num);
	List<Room> 			roomList(int host_num);
	List<RoomPhoto> 	roomPhotoList(RoomPhoto roomPhoto);
	Stay 				stayinfo(int host_num);
	List<Review> 		reviewList(int host_num);
	List<RevPhoto> 		reviewPhotoList(int host_num);

}
