package com.oracle.S20220601.dao.ih;

import java.util.List;

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

	@Override
	public int storePhotoInsert(List<MultipartFile> filename) {
		
		System.out.println("StorePhotoDaoImpl storePhotoInsert Start....");
		int storePhotoInsert = 0;
		try {
			for (MultipartFile multipartFile : filename) {
				if (multipartFile.getOriginalFilename() != null) {
					storePhotoInsert += session.insert("storePhotoInsert", multipartFile.getOriginalFilename());
					System.out.println(multipartFile.getOriginalFilename());
				}else {
					return storePhotoInsert;
				}
			}
		} catch (Exception e) {
			System.out.println("StorePhotoDaoImpl storePhotoInsert ErrorMessage --> " + e.getMessage());
		}
		return storePhotoInsert;
	}

	
}
