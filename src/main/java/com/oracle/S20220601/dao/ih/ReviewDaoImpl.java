package com.oracle.S20220601.dao.ih;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.RevPhoto;
import com.oracle.S20220601.model.Review;

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
		
		try {
			for (Review revPhoto : revList) {
				storeRevPhoto = session.selectList("storeRevPhoto", revPhoto);
			}
			System.out.println("ReviewDaoImpl storeRevPhoto storeRevPhoto.size() --> " + revList.size());
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl storeRevPhoto ErrorMessage --> " + e.getMessage());
		}
		
		return storeRevPhoto;
	}

}
