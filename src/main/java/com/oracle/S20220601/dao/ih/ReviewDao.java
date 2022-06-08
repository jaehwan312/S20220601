package com.oracle.S20220601.dao.ih;

import java.util.List;

import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;

public interface ReviewDao {

	List<Review>   revList(int host_num);

	List<RevPhoto> storeRevPhoto(List<Review> revList);

}
