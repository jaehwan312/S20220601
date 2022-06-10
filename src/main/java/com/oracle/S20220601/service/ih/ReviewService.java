package com.oracle.S20220601.service.ih;

import java.util.List;

import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.ih.StoreReview;

public interface ReviewService {
	List<Review> 	revList(int host_num);					//리뷰내용
	List<RevPhoto> 	storeRevPhoto(List<Review> revList);	//리뷰사진
	int 			storeUserRevDel(StoreReview review);    //리뷰삭제
	int			    storeRevcount(int host_num);			//리뷰카운트 업데이트
	float           storeRevPointAvg(int host_num);		    //식당 평점 업데이트
	int             storeUserRevInsert(StoreReview review); //식당 리뷰 작성
} 
