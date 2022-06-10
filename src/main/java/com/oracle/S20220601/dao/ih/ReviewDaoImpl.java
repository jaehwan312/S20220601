package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	@Override
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

	@Override
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

	@Override
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

}
