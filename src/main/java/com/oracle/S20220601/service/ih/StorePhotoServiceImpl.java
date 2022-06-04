package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.dao.ih.StorePhotoDao;
import com.oracle.S20220601.model.HostPhoto;

@Service
public class StorePhotoServiceImpl implements StorePhotoService{
	
	@Autowired
	private StorePhotoDao storePhotoDao;
	
	@Override//식당사진
	public List<HostPhoto> storePhoto(int host_num) {
		System.out.println("StorePhotoServiceImpl storePhoto Start....");
		
		List<HostPhoto> storePhoto = storePhotoDao.storePhoto(host_num);
		
		return storePhoto;
	}
	
	@Override
	public int storePhotoInsert(List<MultipartFile> filename) {
		System.out.println("StorePhotoServiceImpl storePhotoInsert Start....");
		
		int storePhotoInsert = storePhotoDao.storePhotoInsert(filename);
		
		return storePhotoInsert;
	}
}
