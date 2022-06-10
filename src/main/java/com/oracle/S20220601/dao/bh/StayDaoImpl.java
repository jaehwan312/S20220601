package com.oracle.S20220601.dao.bh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.Code;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.RoomPhoto;
import com.oracle.S20220601.model.Stay;
import com.oracle.S20220601.model.bh.HostStay;
import com.oracle.S20220601.model.bh.Review1;
import com.oracle.S20220601.model.bh.RoomPhotoList;

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
			System.out.println("StoreDaoImpl stayPhoto stayPhoto.size() --> " + stayPhoto.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayPhoto Exception->"+e.getMessage());
		}
		return stayPhoto;
	}

	@Override
	public List<RoomPhotoList> roomPhoto(RoomPhotoList roomPhotoList) {
		System.out.println("StayDaoImpl roomPhoto start...");
		List<RoomPhotoList> roomPhotoLists = null;
		List<RoomPhoto> roomPhoto = null;
		try {
			roomPhotoLists = session.selectList("room", roomPhotoList);
			for(RoomPhotoList roomList : roomPhotoLists) {
				roomPhoto = session.selectList("roomPhoto", roomList);
				roomList.setRoomPhotos(roomPhoto);
				
			}
			
			System.out.println("StoreDaoImpl roomPhoto roomPhoto.size() --> " + roomPhoto.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl roomPhoto Exception->"+e.getMessage());
		}
		return roomPhotoLists;
	}

	@Override
	public Stay stayinfo(int host_num) {
		System.out.println("StayDaoImpl stayinfo start...");
		Stay stayinfo = null;
		try {
			stayinfo = session.selectOne("stayinfo", host_num);
			
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayinfo Exception->"+e.getMessage());
		}
		return stayinfo;
	}

	@Override
	public HostStay stayReadreview(int host_num) {
		System.out.println("StayDaoImpl stayReadreview start...");
		HostStay stayReadreview=null;
		try {
			stayReadreview = session.selectOne("stayRead", host_num);
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayReadreview Exception->"+e.getMessage());
		}
		return stayReadreview;
	}

	@Override
	public List<Review1> reviewList(int host_num) {
		System.out.println("StayDaoImpl reviewList start...");
		List<Review1> reviewList = null;
		try {
			reviewList = session.selectList("bhreviewList", host_num);
			List<RevPhoto> rp =null;
			for(Review1 rv : reviewList) {
				rp = session.selectList("bhrevPhotoList", rv);
				rv.setRevPhoto(rp);
			}
		} catch (Exception e) {
			System.out.println("StayDaoImpl reviewList Exception->"+e.getMessage());
		}
		return reviewList;
	}

	@Override
	public Host hostreview(int host_num) {
		System.out.println("StayDaoImpl hostreview start...");
		Host hostreview=null;
		try {
			hostreview = session.selectOne("hostreview", host_num);
		} catch (Exception e) {
			System.out.println("StayDaoImpl hostreview Exception->"+e.getMessage());
		}
		return hostreview;
	}

	@Override
	public List<Code> codeList(int bcd_code) {
		System.out.println("StayDaoImpl codeList start...");
		List<Code> codeList = null;
		try {
			codeList = session.selectList("bhcodeList", bcd_code);
			System.out.println("StoreDaoImpl codeList codeList.size() --> " + codeList.size());
		} catch (Exception e) {
			System.out.println("StayDaoImpl codeList Exception->"+e.getMessage());
		}
		return codeList;
	}

	@Override
	public int stayInsert(HostStay hostStay) {
		System.out.println("StayDaoImpl stayInsert start...");
		int stayInsert =0;
		hostStay.setMem_num(4);
		
		
//		System.out.println("hostStore.getHost_num() --> " + hostStay.getHost_num());
//		System.out.println("hostStore.getHost_num() --> " + hostStay.getHost_name());
//		System.out.println("hostStore.getBcd_code() --> " + hostStay.getBcd_code());
//		System.out.println("hostStore.getBcd_code() --> " + hostStay.getMem_num());
//		System.out.println("hostStore.getHost_addr() --> " + hostStay.getHost_addr());
//		System.out.println("hostStore.getHost_avg() --> " + hostStay.getHost_avg());
//		System.out.println("hostStore.getHost_code() --> " + hostStay.getHost_code());
//		System.out.println("hostStore.getHost_info() --> " + hostStay.getHost_info());
//		System.out.println("hostStore.getHost_name() --> " + hostStay.getRev_count());
//		System.out.println("hostStore.getLike_count() --> " + hostStay.getLike_count());
//		System.out.println("hostStore.getHost_app() --> " + hostStay.getHost_app());
//		System.out.println("hostStore.getConvenient() --> " + hostStay.getConvenient());
//		System.out.println("hostStore.getWay() --> " + hostStay.getWay());
//		System.out.println("hostStore.getCheckin() --> " + hostStay.getCheckin());
//		System.out.println("hostStore.getCheckout() --> " + hostStay.getCheckout());
//		System.out.println("hostStore.getStay_type() --> " + hostStay.getStay_type());
		try {
			stayInsert =session.insert("stayInsert", hostStay);
			stayInsert=1;
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayInsert Exception->"+e.getMessage());
		}
		return stayInsert;
	}

	@Override
	public int stayPhotoInsert(List<MultipartFile> file) {
		System.out.println("StayDaoImpl stayPhotoInsert start...");
		int stayPhotoInsert =0;
		
		try {
			for(MultipartFile multipartFile : file) {
				if(multipartFile.getOriginalFilename() != null) {
					stayPhotoInsert += session.insert("stayPhotoInsert",multipartFile.getOriginalFilename());
					System.out.println(multipartFile.getOriginalFilename());
				}else {
					return stayPhotoInsert;
				}
			}
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayInsert Exception->"+e.getMessage());
		}
		
		return stayPhotoInsert;
	}


}
