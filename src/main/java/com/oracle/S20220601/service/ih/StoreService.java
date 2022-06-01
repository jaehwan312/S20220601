package com.oracle.S20220601.service.ih;

import java.util.List;

import com.oracle.S20220601.model.HostPhoto;
import com.oracle.S20220601.model.Menu;
import com.oracle.S20220601.model.ih.HostStore;

public interface StoreService {

	HostStore       storeRead(int host_num);
	List<HostPhoto> storePhoto(int host_num);
	List<Menu>      menuList(int host_num);


}
