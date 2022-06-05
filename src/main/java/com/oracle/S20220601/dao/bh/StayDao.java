package com.oracle.S20220601.dao.bh;

import java.util.List;

import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.model.bh.HostStay;
import com.oracle.S20220601.model.bh.Review1;
import com.oracle.S20220601.model.bh.RoomPhotoList;

public interface StayDao {

	HostStay 			stayRead(int host_num);
	List<HostPhoto> 	stayPhoto(int host_num);
	List<RoomPhotoList> roomPhoto(RoomPhotoList roomPhotoList);
	Stay 				stayinfo(int host_num);
	HostStay 			stayReadreview(int host_num);
	List<Review1> 		reviewList(int host_num);

}
