package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.HostPhoto;

public interface StorePhotoDao {
	
	List<HostPhoto> storePhoto(int host_num);						//등록된사진확인	

	int             storePhotoInsert(List<MultipartFile> filename); //식당사진 등록


}