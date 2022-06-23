package com.oracle.S20220601.service.jj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.jj.PickDao;

@Service
public class PickServiceImpl implements PickService {
	
	@Autowired
	private PickDao pd;
}
