package com.oracle.S20220601.service.bh;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.bh.StayDao;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
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


	


}
