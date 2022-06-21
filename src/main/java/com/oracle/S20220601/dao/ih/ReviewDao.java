package com.oracle.S20220601.dao.ih;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.ih.StoreReview;

public interface ReviewDao {
	List<Review> 	revList(int host_num);					     //리뷰리스트
	List<RevPhoto> 	storeRevPhoto(List<Review> revList);	     //리뷰사진리스트
	int 			storeUserRevDel(StoreReview review);         //리뷰삭제
	int			    storeRevcount(int host_num);			     //리뷰카운트 업데이트
	float           storeRevPointAvg(int host_num);			     //식당 평점  업데이트
	int             storeUserRevInsert(StoreReview review);      //식당 리뷰  작성
	int             storeRevPhotoInsert(List<StoreReview> RevPhotoInsertList, Map<Integer, MultipartFile> RevPhotoInsert); //식당 리뷰 사진 등록
	int             hostRevInsert(Review review);				 //식당 리뷰 답변 작성
	int 			hostRevDelete(Review review); 				 //식당 리뷰 답변 삭제
	StoreReview	    reviewSelect(int rev_num);					 //작성된 식당 리뷰 정보 반환
	int			    RevUpdateInsert(Review review);			 //식당리뷰 업데이트
	String 		    maxReviewDate(int host_num, int mem_num); //최근 댓글 작성 시간
} 
  