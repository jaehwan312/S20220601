package com.oracle.S20220601.service.bh;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Res;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.Room;
import com.oracle.S20220601.model.RoomPhoto;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.model.bh.HostStay;
import com.oracle.S20220601.model.bh.Review1;
import com.oracle.S20220601.model.bh.RoomPhotoList;

public interface StayService {

	HostStay 			stayRead(int host_num);
	List<HostPhoto> 	stayPhoto(int host_num);
	List<RoomPhotoList> roomPhoto(RoomPhotoList roomPhotoList);
	Stay 				stayinfo(int host_num);
	HostStay 			stayReadreview(int host_num);
	List<Review1> 		reviewList(int host_num);
	Host 				hostreview(int host_num);
	List<Code> 			codeList(int bcd_code);
	int 				stayInsert(HostStay hostStay);
	HostPhoto 			stayPhotoInsert(List<HostPhoto> stayPhotoInsertList, Map<Integer, MultipartFile> filename);
	int 				roomInsert(Room room);
	int 				roomPhotoInsert(List<RoomPhoto> roomPhotoInsertList, Map<Integer, MultipartFile> filename);
	List<Room> 			roomList(Room room);
	int 				revInsert(Review1 review);
	int 				revPhotoInsert(List<RevPhoto> RevPhotoInsertList, Map<Integer, MultipartFile> filename, int host_num);
	Res 				resInfo(Res res);
	List<Res> 			respossible(Res res);
	int 				stayUpdate(HostStay hostStay);
	int 				stayPhotoUpdate(List<HostPhoto> stayPhotoInsertList, Map<Integer, MultipartFile> fileName, int host_num);
	int 				roomUpdate(Room room);
	int					roomPhotoUpdate(List<RoomPhoto> roomPhotoInsertList, Map<Integer, MultipartFile> filename, Room room);
	Room 				stayRead(Room room);
	int 				stayDelete(HostStay hostStay);
	int 				roomDelete(Room room);
	int 				reviewUpdate(Review1 review);
	int 				revPhotoUpdate(List<RevPhoto> revPhotoInsertList, Map<Integer, MultipartFile> filename, Review1 review);
	int 				reviewDelete(Review1 review);
	
}

