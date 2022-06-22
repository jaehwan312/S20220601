package com.oracle.S20220601.service.jh;

import java.util.List;

import com.oracle.S20220601.model.Notice;


public interface NtcService {

	int getTotalCnt();

	List<Notice> listNtc(Notice ntc);

	Notice ntcContent(int n_num);

	int ntcDelete(int n_num);

}
