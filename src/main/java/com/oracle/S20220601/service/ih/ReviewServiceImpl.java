package com.oracle.S20220601.service.ih;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.dao.ih.ReviewDao;
import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.ih.StoreReview;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override//리뷰내용
	public List<Review> revList(int host_num) {

		System.out.println("ReviewServiceImpl revList Start...");
		List<Review> revList = reviewDao.revList(host_num);
				
		return revList;
	}

	@Override//리뷰사진
	public List<RevPhoto> storeRevPhoto(List<Review> revList) {
		
		System.out.println("ReviewServiceImpl storeRevPhoto Start...");
		List<RevPhoto> storeRevPhoto = reviewDao.storeRevPhoto(revList);
		System.out.println(storeRevPhoto.size());	
		return storeRevPhoto;
	}

	@Override//리뷰삭제
	public int storeUserRevDel(StoreReview review) {
		System.out.println("ReviewServiceImpl storeUserRevDel Start...");
		return reviewDao.storeUserRevDel(review);
	}

	@Override//리뷰카운트 업데이트
	public int storeRevcount(int host_num) {
		System.out.println("ReviewServiceImpl storeRevcount Start...");
		return reviewDao.storeRevcount(host_num);
	}

	@Override//식당 평점 업데이트
	public float storeRevPointAvg(int host_num) {
		System.out.println("ReviewServiceImpl storeRevPointAvg Start...");
		return reviewDao.storeRevPointAvg(host_num);
	}

	@Override
	public int storeUserRevInsert(StoreReview review) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}

	@Override
	public int storeRevPhotoInsert(List<MultipartFile> storeRevPhotoInsertList) {
		// TODO 자동 생성된 메소드 스텁
		return 0;
	}

}
