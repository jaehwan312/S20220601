package com.oracle.S20220601.service.ih;

import java.util.List;

import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;

public interface ReviewService {

	List<Review> 	revList(int host_num);					//리뷰내용
	List<RevPhoto> 	storeRevPhoto(List<Review> revList);	//리뷰사진
	
}
