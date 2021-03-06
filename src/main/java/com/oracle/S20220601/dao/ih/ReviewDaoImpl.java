package com.oracle.S20220601.dao.ih;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;
import com.oracle.S20220601.model.ih.StoreReview;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession session;
	
	@Override//리뷰리스트
	public List<Review> revList(int host_num) {
		System.out.println("ReviewDaoImpl revList Start...");
		List<Review> revList = null;
		
		try {
			revList = session.selectList("storeRevList", host_num);
			System.out.println("ReviewDaoImpl revList revList.size() --> " + revList.size());
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl revList ErrorMessage --> " + e.getMessage());
		}
		
		return revList;
	}

	@Override//리뷰사진리스트
	public List<RevPhoto> storeRevPhoto(List<Review> revList) {
		
		System.out.println("ReviewDaoImpl storeRevPhoto Start...");
		List<RevPhoto> storeRevPhoto = null;
		try {
			for (Review revPhoto : revList) {
				storeRevPhoto = session.selectList("storeRevPhoto", revPhoto);
			}
			System.out.println("ReviewDaoImpl storeRevPhoto storeRevPhoto.size() --> " + storeRevPhoto.size());
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl storeRevPhoto ErrorMessage --> " + e.getMessage());
		}
		
		return storeRevPhoto;
	}

	@Override//리뷰삭제
	public int storeUserRevDel(StoreReview review) {
		System.out.println("ReviewDaoImpl storeUserRevDel Start...");
		int storeUserRevDel = 0;
		
		try {
			storeUserRevDel = session.delete("storeUserRevDel",review);    //리뷰글 삭제
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl storeUserRevDel ErrorMessage --> " + e.getMessage());
		}
		
		return storeUserRevDel;
	}

	@Override//리뷰카운트 업데이트
	public int storeRevcount(int host_num) {
		System.out.println("ReviewDaoImpl storeRevcount Start...");
		
		int storeRevcount = 0;
		
		try {
			storeRevcount = session.update("storeRevcount",host_num);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl storeUserRevDel ErrorMessage --> " + e.getMessage());
		}
		return storeRevcount;
	}

	@Override//식당 평점  업데이트
	public float storeRevPointAvg(int host_num) {
		System.out.println("ReviewDaoImpl storeRevPointAvg Start...");
		
		float storeRevPointAvg = 0;
		
		try {
			storeRevPointAvg = session.update("storeRevPointAvg",host_num);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl storeRevPointAvg ErrorMessage --> " + e.getMessage());
		}
		return storeRevPointAvg;
	}

	@Override //식당 리뷰  작성
	public int storeUserRevInsert(StoreReview review) {
		
		System.out.println("ReviewDaoImpl storeUserRevInsert Start...");
		
		int storeUserRevInsert = 0;
		int user_rev_num_select = 0;
		try {
			storeUserRevInsert = session.insert("storeUserRevInsert",review);
			user_rev_num_select = session.selectOne("user_rev_num_select");
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl storeUserRevInsert ErrorMessage --> " + e.getMessage());
		}
		return user_rev_num_select;
	}

	@Override//식당 리뷰 사진 등록
	public int storeRevPhotoInsert(List<StoreReview> RevPhotoInsertList,Map<Integer, MultipartFile> RevPhotoInsert) {
		System.out.println("ReviewDaoImpl storeRevPhotoInsert Start...");
		int storeRevPhotoInsert = 0;
		int i = 0;
		try {
			for (StoreReview photo : RevPhotoInsertList) {
				photo.setRev_photo(RevPhotoInsert.get(i).getOriginalFilename());
//				System.out.println("업체번호 --> " + photo.getHost_num());
//				System.out.println("리뷰등록 회원번호 --> " + photo.getMem_num());
//				System.out.println("사진이름 --> " + photo.getRev_photo());
				storeRevPhotoInsert += session.insert("storeRevPhotoInsert",photo);
				++i;
			}
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl storeRevPhotoInsert ErrorMessage --> " + e.getMessage());
		}
		return storeRevPhotoInsert;	
		}

	@Override//리뷰 답글 작성
	public int hostRevInsert(Review review) {
		System.out.println("ReviewDaoImpl hostRevInsert Start...");
		
		int hostRevInsert = 0;
		int host_rev_num_select = review.getRev_num();
		try {
			hostRevInsert = session.insert("hostRevInsert",review);
			host_rev_num_select = session.selectOne("host_rev_num_select", host_rev_num_select);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl hostRevInsert ErrorMessage --> " + e.getMessage());
		}
		return host_rev_num_select;
	}

	@Override //리뷰 답글 삭제
	public int hostRevDelete(Review review) {
		System.out.println("ReviewDaoImpl hostRevDelete Start...");
		
		int hostRevDelete = 0;
		
		try {
			hostRevDelete  = session.delete("hostRevDelete", review);
			
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl hostRevDelete ErrorMessage --> " + e.getMessage());
		}
		return hostRevDelete;
	}

	@Override//작성된 식당 리뷰 반환
	public StoreReview reviewSelect(int rev_num) {
		System.out.println("ReviewDaoImpl reviewSelect Start...");
		
		StoreReview reviewSelect = null;
		
		try {
			reviewSelect  = session.selectOne("reviewSelect", rev_num);
			
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl reviewSelect ErrorMessage --> " + e.getMessage());
		}
		return reviewSelect;
	}

	@Override
	public int RevUpdateInsert(Review review) {
		System.out.println("ReviewDaoImpl RevUpdateInsert Start...");
		
		int RevUpdateInsert = 0;
		
		try {
			RevUpdateInsert  = session.update("RevUpdateInsert", review);
			
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl RevUpdateInsert ErrorMessage --> " + e.getMessage());
		}
		return RevUpdateInsert;
	}

	@Override
	public String maxReviewDate(int host_num, int mem_num) {
		System.out.println("ReviewDaoImpl maxReviewDate Start...");
		
		Review review = new Review();
		
		String maxReviewDate = "";
		
		review.setHost_num(host_num);
		review.setMem_num(mem_num);
		try {
			maxReviewDate  = session.selectOne("maxReviewDate", review);
			System.out.println("maxReviewDate --> " + maxReviewDate);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl RevUpdateInsert ErrorMessage --> " + e.getMessage());
		}
		return maxReviewDate;
	}
	
	
}
