package com.oracle.S20220601.dao.jh;

import java.util.List;

import com.oracle.S20220601.model.Notice;


public interface NtcDao {

	int getTotalCnt();

	List<Notice> listNtc(Notice ntc);

	Notice ntcContent(int n_num);
	
	void viewCount(int n_num);
	
	int ntcUpdate(Notice ntc);

	int ntcDelete(int n_num);

	int ntcInsert(Notice ntc);

}
