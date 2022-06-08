package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220601.dao.ih.ReviewDao;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.ih.StoreReview;

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
		System.out.println(storeRevPhoto.size());	
		return storeRevPhoto;
	}

	@Override
	public int storeUserRevDel(StoreReview review) {
		return reviewDao.storeUserRevDel(review);
	}

	@Override
	public int storeRevcount(int host_num) {
		return reviewDao.storeRevcount(host_num);
	}

	@Override
	public int storeRevPointAvg(int host_num) {
		// TODO 자동 생성된 메소드 스텁
		return reviewDao.storeRevPointAvg(host_num);
	}

}
