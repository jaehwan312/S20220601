package com.oracle.S20220601.dao.bh;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Room;
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
	Host 				hostreview(int host_num);
	List<Code> 			codeList(int bcd_code);
	int 				stayInsert(HostStay hostStay);
	HostPhoto 				stayPhotoInsert(List<MultipartFile> file);
	int 				roomInsert(Room room);
	int 				roomPhotoInsert(List<MultipartFile> roomfile);
	
}
