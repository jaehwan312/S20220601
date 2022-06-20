package com.oracle.S20220601.service.bh;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.dao.bh.StayDao;
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
	public List<RoomPhotoList> roomPhoto(RoomPhotoList roomPhotoList) {
		System.out.println("StayServiceImpl roomPhoto start...");
		List<RoomPhotoList> roomPhoto = sd.roomPhoto(roomPhotoList);
		return roomPhoto;
	}

	@Override
	public Stay stayinfo(int host_num) {
		System.out.println("StayServiceImpl roomPhoto start...");
		Stay stayinfo = sd.stayinfo(host_num);
		return stayinfo;
	}


	@Override
	public HostStay stayReadreview(int host_num) {
		System.out.println("StayServiceImpl stayReadreview start...");
		HostStay stayReadreview=sd.stayReadreview(host_num);
		return stayReadreview;
	}

	@Override
	public List<Review1> reviewList(int host_num) {
		System.out.println("StayServiceImpl reviewList start...");
		List<Review1> reviewList =sd.reviewList(host_num);
		return reviewList;
	}

	@Override
	public Host hostreview(int host_num) {
		System.out.println("StayServiceImpl hostreview start...");
		Host hostreview =sd.hostreview(host_num);
		return hostreview;
	}

	@Override
	public List<Code> codeList(int bcd_code) {
		System.out.println("StayServiceImpl codeList start...");
		List<Code> codeList = sd.codeList(bcd_code);
		return codeList;
	}

	@Override
	public int stayInsert(HostStay hostStay) {
		System.out.println("StayServiceImpl stayInsert start...");
		int stayInsert = sd.stayInsert(hostStay);
		return stayInsert;
	}

	@Override
	public HostPhoto stayPhotoInsert(List<HostPhoto> stayPhotoInsertList, Map<Integer, MultipartFile> filename) {
		System.out.println("StayServiceImpl stayPhotoInsert start...");
		HostPhoto stayPhotoInsert = sd.stayPhotoInsert(stayPhotoInsertList,filename);
		return stayPhotoInsert;
	}

	@Override
	public int roomInsert(Room room) {
		System.out.println("StayServiceImpl roomInsert start...");
		int roomInsert = sd.roomInsert(room);
		return roomInsert;
	}

	@Override
	public int roomPhotoInsert(List<RoomPhoto> roomPhotoInsertList, Map<Integer, MultipartFile> filename) {
		System.out.println("StayServiceImpl roomPhotoInsert start...");
		int roomPhotoInsert = sd.roomPhotoInsert(roomPhotoInsertList,filename);
		return roomPhotoInsert;
	}

	@Override
	public List<Room> roomList(Room room) {
		System.out.println("StayServiceImpl roomList start...");
		List<Room> roomList = sd.roomList(room);
		return roomList;
	}

	@Override
	public int revInsert(Review1 review) {
		System.out.println("StayServiceImpl revInsert start...");
		int revInsert = sd.revInsert(review);
		return revInsert;
	}

	@Override
	public int revPhotoInsert(List<RevPhoto> revPhotoInsertList, Map<Integer, MultipartFile> filename) {
		System.out.println("StayServiceImpl revPhotoInsert start...");
		int revPhotoInsert = sd.revPhotoInsert(revPhotoInsertList,filename);
		return revPhotoInsert;
	}

	@Override
	public Res resInfo(Res res) {
		System.out.println("StayServiceImpl resInfo start...");
		Res resInfo = sd.resInfo(res);
		return resInfo;
	}

	@Override
	public List<Res> respossible(Res res) {
		System.out.println("StayServiceImpl respossible start...");
		List<Res> respossible = sd.respossible(res);
		return respossible;
	}

	@Override
	public int stayUpdate(HostStay hostStay) {
		System.out.println("StayServiceImpl stayUpdate start...");
		int stayUpdate =sd.stayUpdate(hostStay);
		return stayUpdate;
	}


	


}
