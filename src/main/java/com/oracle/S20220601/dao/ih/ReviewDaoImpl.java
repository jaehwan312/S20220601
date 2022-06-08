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
	
	@Override
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

	@Override
	public List<RevPhoto> storeRevPhoto(List<Review> revList) {
		
		System.out.println("ReviewDaoImpl storeRevPhoto Start...");
		List<RevPhoto> storeRevPhoto = null;
		int i = 0;
		try {
			for (Review revPhoto : revList) {
//				System.out.println(revPhoto.getRev_num());
//				System.out.println(revPhoto.getMem_num());
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

		int storeUserRevDel = 0;
		
		try {
			storeUserRevDel = session.delete("storeUserRevDel",review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl storeUserRevDel ErrorMessage --> " + e.getMessage());
		}
		
		return storeUserRevDel;
	}

}