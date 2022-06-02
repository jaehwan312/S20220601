package com.oracle.S20220601.dao.bh;

import java.util.List;

import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
import com.oracle.S20220601.model.bh.HostStay;

public interface StayDao {

	HostStay 			stayRead(int host_num);
	List<HostPhoto> 	stayPhoto(int host_num);
	List<Room> 			roomList(int host_num);
	List<RoomPhoto> 	roomPhotoList(RoomPhoto roomPhoto);

}
