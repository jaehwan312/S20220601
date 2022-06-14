package com.oracle.S20220601.service.ih;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.HostPhoto;

public interface StorePhotoService {
	List<HostPhoto> storePhoto(int host_num);		  			//식당사진
	int 			storePhotoInsert(List<HostPhoto> storePhotoInsertList, Map<Integer, MultipartFile> fileName); //식당 사진 등록
	
}
