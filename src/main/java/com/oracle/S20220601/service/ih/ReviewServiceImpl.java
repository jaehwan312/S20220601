package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ih.ReviewDao;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<Review> revList(int host_num) {

		System.out.println("ReviewServiceImpl revList Start...");
		List<Review> revList = reviewDao.revList(host_num);
				
		return revList;
	}

	@Override
	public List<RevPhoto> storeRevPhoto(List<Review> revList) {
		
		System.out.println("ReviewServiceImpl storeRevPhoto Start...");
		List<RevPhoto> storeRevPhoto = reviewDao.storeRevPhoto(revList);
				
		return storeRevPhoto;
	}
	
}
