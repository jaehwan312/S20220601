package com.oracle.S20220601.dao.ih;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.HostPhoto;

@Repository
public class StorePhotoDaoImpl implements StorePhotoDao {
	
	@Autowired
	private SqlSession session;
	
	@Override//식당사진
	public List<HostPhoto> storePhoto(int host_num) {
		
		System.out.println("StorePhotoDaoImpl storePhoto Start....");
		
		List<HostPhoto> storePhoto = null;
		
		try {
			storePhoto = session.selectList("storePhoto", host_num);
			System.out.println("StorePhotoDaoImpl storePhoto storePhoto.size() --> " + storePhoto.size());
		} catch (Exception e) {
			System.out.println("StorePhotoDaoImpl storePhoto ErrorMessage --> " + e.getMessage());
		}
		return storePhoto;
	}

	@Override//사진 등록
	public int storePhotoInsert(List<HostPhoto> storePhotoInsertList, Map<Integer, MultipartFile> fileName) {
		
		System.out.println("StorePhotoDaoImpl storePhotoInsert Start....");
		int storePhotoInsert = 0;
		int selectHostMem_num = 0;
		int i = 0;
		try {
			selectHostMem_num = session.selectOne("selectHostMem_num");
			for (HostPhoto hostPhoto : storePhotoInsertList) {
				hostPhoto.setHost_num(selectHostMem_num);
				hostPhoto.setHost_photo(fileName.get(i).getOriginalFilename());
				storePhotoInsert += session.insert("storePhotoInsert", hostPhoto);
				System.out.println(hostPhoto.getHost_photo());
				++i;
			}
		} catch (Exception e) {
			System.out.println("StorePhotoDaoImpl storePhotoInsert ErrorMessage --> " + e.getMessage());
		}
		return storePhotoInsert;
	}
	
	@Override//사진 추가 등록
	public int storePhotoUpdate(List<HostPhoto> storePhotoInsertList, Map<Integer, MultipartFile> fileName,
			int host_num) {
		System.out.println("StorePhotoDaoImpl storePhotoUpdate Start....");
		int storePhotoUpdate = 0;
		int i = 0;
		try {
			for (HostPhoto hostPhoto : storePhotoInsertList) {
				hostPhoto.setHost_num(host_num);
				hostPhoto.setHost_photo(fileName.get(i).getOriginalFilename());
				storePhotoUpdate += session.insert("storePhotoInsert", hostPhoto);
				System.out.println(hostPhoto.getHost_photo());
				++i;
			}
		} catch (Exception e) {
			System.out.println("StorePhotoDaoImpl storePhotoInsert ErrorMessage --> " + e.getMessage());
		}
		return storePhotoUpdate;
	}

	
}
