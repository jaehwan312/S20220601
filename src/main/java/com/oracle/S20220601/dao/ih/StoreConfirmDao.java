package com.oracle.S20220601.dao.ih;

import java.util.List;

import com.oracle.S20220601.model.ih.HostStore;
import com.oracle.S20220601.model.jj.Jjpaging;

public interface StoreConfirmDao {

	int total();

	List<HostStore> storeList(Jjpaging pg);

	int approveStore(int host_num);

	int rejectStore(int host_num);
}
