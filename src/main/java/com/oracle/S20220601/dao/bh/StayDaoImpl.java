package com.oracle.S20220601.dao.bh;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
			System.out.println("StayDaoImpl codeList codeList.size() --> " + codeList.size());
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
			int result =session.insert("stayInsert", hostStay);
			stayInsert = session.selectOne("bhgetHost_num",hostStay);
			System.out.println("현재 host_num --> " + stayInsert);
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayInsert Exception->"+e.getMessage());
		}
		return stayInsert;
	}

	@Override
	public HostPhoto stayPhotoInsert(List<HostPhoto> stayPhotoInsertList, Map<Integer, MultipartFile> filename) {
		System.out.println("StayDaoImpl stayPhotoInsert start...");
		HostPhoto stayPhotoInsert =null;
		int result = 0;
		int i =0;
		try {
			for(HostPhoto hostPhoto : stayPhotoInsertList) {
					stayPhotoInsert = new HostPhoto();
					stayPhotoInsert.setHost_photo(filename.get(i).getOriginalFilename());
					int host_num = session.selectOne("bhgetHost_num");
					stayPhotoInsert.setHost_num(host_num);
					result += session.insert("stayPhotoInsert", stayPhotoInsert);
					System.out.println(stayPhotoInsert.getHost_photo());
					++i;
			}
		} catch (Exception e) {
			System.out.println("StayDaoImpl stayInsert Exception->"+e.getMessage());
		}
		
		return stayPhotoInsert;
	}

	@Override
	public int roomInsert(Room room) {
		System.out.println("StayDaoImpl roomInsert start...");
		int roomInsert =0;
		System.out.println(room.getHost_num());
		try {
			roomInsert =session.insert("roomInsert", room);
			roomInsert=1;
		} catch (Exception e) {
			System.out.println("StayDaoImpl roomInsert Exception->"+e.getMessage());
		}
		return roomInsert;
	}

	@Override
	public int roomPhotoInsert(List<RoomPhoto> roomPhotoInsertList, Map<Integer, MultipartFile> filename) {
		System.out.println("StayDaoImpl roomPhotoInsert start...");
			int result = 0;
			int i = 0;
		try {
			for(RoomPhoto roomPhoto : roomPhotoInsertList) {
					roomPhoto = new RoomPhoto();
					int host_num = session.selectOne("bhgetHost_num");
					int room_num = session.selectOne("bhgetRoom_num");
					roomPhoto.setHost_num(host_num);
					roomPhoto.setRoom_num(room_num);
					roomPhoto.setRoom_photo(filename.get(i).getOriginalFilename());
					result += session.insert("roomPhotoInsert", roomPhoto);
					System.out.println(roomPhoto.getRoom_photo());
			}
		} catch (Exception e) {
			System.out.println("StayDaoImpl roomPhotoInsert Exception->"+e.getMessage());
		}
		
		return result;
	}

	@Override
	public List<Room> roomList(Room room) {
		System.out.println("StayDaoImpl roomList start...");
		List<Room> roomList = null;
		try {
			roomList=session.selectList("roomList", room);
		} catch (Exception e) {
			System.out.println("StayDaoImpl roomList Exception->"+e.getMessage());
		}
		return roomList;
	}

	@Override
	public int revInsert(Review1 review) {
		System.out.println("StayDaoImpl revInsert start...");
		int revInsert = 0;
		try {
			revInsert =session.insert("revInsert", review);
			revInsert=1;
		} catch (Exception e) {
			System.out.println("StayDaoImpl revInsert Exception->"+e.getMessage());
		}
		return revInsert;
	}

	@Override
	   public int revPhotoInsert(List<RevPhoto> RevPhotoInsertList, Map<Integer, MultipartFile> filename, int host_num) {
	      System.out.println("StayDaoImpl revPhotoInsert start...");
	      int result = 0;
	      int i = 0;
	   try {
	      for(RevPhoto revPhoto : RevPhotoInsertList) {
	    	    revPhoto.setHost_num(host_num);
	    	    revPhoto.setRev_photo(filename.get(i).getOriginalFilename());
	    	    System.out.println("host_num --> " + revPhoto.getHost_num());
	            System.out.println("photo --> " + revPhoto.getRev_photo());
	            result += session.insert("revPhotoInsert", revPhoto);
	            ++i;
	      }
	   } catch (Exception e) {
	      System.out.println("StayDaoImpl revPhotoInsert Exception->"+e.getMessage());
	   }
	   
	   return result;

	   }

	@Override
	public Res resInfo(Res res) {
		System.out.println("StayDaoImpl resInfo start...");
		Res resInfo = null;
		try {
			resInfo = session.selectOne("resInfo", res);
		} catch (Exception e) {
			System.out.println("StayDaoImpl resInfo Exception->"+e.getMessage());
		}
		return resInfo;
	}

	@Override
	public List<Res> respossible(Res res) {
		System.out.println("StayDaoImpl respossible start...");
		List<Res> respossible =null;
		try {
			respossible =session.selectList("respossible", res);
		} catch (Exception e) {
			System.out.println("StayDaoImpl respossible Exception->"+e.getMessage());
		}
		return respossible;
	}

	@Override
	public int stayUpdate(HostStay hostStay) {
		System.out.println("StayDaoImpl stayUpdate start...");
		int stayUpdate =0;
		try {
			stayUpdate =session.update("stayUpdate", hostStay);
			stayUpdate=1;
		} catch (Exception e) {
			System.out.println("StayDaoImpl respossible Exception->"+e.getMessage());
		}
		return stayUpdate;
	}

	@Override
	public int stayPhotoUpdate(List<HostPhoto> stayPhotoInsertList, Map<Integer, MultipartFile> fileName,
			int host_num) {
		System.out.println("StayDaoImpl stayPhotoUpdate start...");
		int stayPhotoUpdate = 0;
		int i = 0;
		try {
			session.delete("stayPhotoDelete", host_num);
			for(HostPhoto hostPhoto : stayPhotoInsertList) {
				hostPhoto.setHost_num(host_num);
				System.out.println("photo_num->"+hostPhoto.getHost_photo_num());
				hostPhoto.setHost_photo(fileName.get(i).getOriginalFilename());
				
				stayPhotoUpdate += session.insert("stayPhotoInsert", hostPhoto);
				++i;
			}
		} catch (Exception e) {
			System.out.println("StorePhotoDaoImpl stayPhotoUpdate ErrorMessage --> " + e.getMessage());
		}
		return stayPhotoUpdate;
	}


}
