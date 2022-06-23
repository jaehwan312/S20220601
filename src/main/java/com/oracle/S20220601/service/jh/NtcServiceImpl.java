package com.oracle.S20220601.service.jh;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jh.NtcDao;
import com.oracle.S20220601.model.Notice;

@Service
public class NtcServiceImpl implements NtcService {
	@Autowired
	private NtcDao nd;
	
	@Override
	public int getTotalCnt() {
		int total = nd.getTotalCnt();
		return total;
	}

	@Override
	public List<Notice> listNtc(Notice ntc) {
		List<Notice> ntcList = null;
		ntcList = nd.listNtc(ntc);
		return ntcList;
	}

	@Override
	public Notice ntcContent(int n_num) {
		Notice ntc = nd.ntcContent(n_num);
		return ntc;
	}

	@Override
	public int ntcDelete(int n_num) {
		int result = 0;
		result = nd.ntcDelete(n_num);
		return result;
	}

}
