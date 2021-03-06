package com.oracle.S20220601.service.ih;

import java.util.List;
import java.util.Map;

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

	@Override//식당 리뷰 작성
	public int storeUserRevInsert(StoreReview review) {
		
		System.out.println("ReviewServiceImpl storeUserRevInsert Start...");
		
		return reviewDao.storeUserRevInsert(review);
	}

	@Override//식당 리뷰 사진 등록
	public int storeRevPhotoInsert(List<StoreReview> RevPhotoInsertList,Map<Integer, MultipartFile> RevPhotoInsert) {
		
		System.out.println("ReviewServiceImpl storeRevPhotoInsert Start...");
		
		return reviewDao.storeRevPhotoInsert(RevPhotoInsertList,RevPhotoInsert);
	}

	@Override
	public int hostRevInsert(Review review) {
		System.out.println("ReviewServiceImpl hostRevInsert Start...");
		return reviewDao.hostRevInsert(review);
	}

	@Override
	public int hostRevDelete(Review review) {
		System.out.println("ReviewServiceImpl hostRevDelete Start...");
		return reviewDao.hostRevDelete(review);
	}

	@Override
	public StoreReview reviewSelect(int rev_num) {
		System.out.println("ReviewServiceImpl reviewSelect Start...");
		return reviewDao.reviewSelect(rev_num);
	}

	@Override
	public int RevUpdateInsert(Review review) {
		System.out.println("ReviewServiceImpl RevUpdateInsert Start...");
		return reviewDao.RevUpdateInsert(review);
	}

	@Override
	public String maxReviewDate(int host_num, int mem_num) {
		System.out.println("ReviewServiceImpl maxReviewDate Start...");
		return reviewDao.maxReviewDate(host_num,mem_num);
	}

}
