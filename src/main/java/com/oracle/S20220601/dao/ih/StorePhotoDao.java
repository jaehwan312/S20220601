package com.oracle.S20220601.dao.ih;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.HostPhoto;

public interface StorePhotoDao {
	
	List<HostPhoto> storePhoto(int host_num);						//등록된사진확인	
	int             storePhotoInsert(List<HostPhoto> storePhotoInsertList, Map<Integer, MultipartFile> fileName); //식당사진 등록


}
