package com.oracle.S20220601.dao.js;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220601.model.Profile;


@Repository
public class ProfileDaoImpl implements ProfileDao {

	@Autowired
	private SqlSession session;
	

	@Override
	public Profile loginCheck(Profile profile) {
		System.out.println("----------- ProfileDaoImpl loginCheck Start -----------");
		profile =  session.selectOne("loginCheck", profile);
		// grade, mem_num 값 확인 완료 (로그인성공 시에만 뜸 -> 실패하면 null 오류)
		return profile;
	}
	

	@Override
	public int idCheck(String id) {
		int cnt = session.selectOne("idCheck", id);
		return cnt;
	}

	@Override
	public int getMem_numSeq(){
		return session.selectOne("getSeq");
	}

	@Override
	public int insert(Profile profile) {
		
		return session.insert("insertProfile", profile);
	}


	@Override
	public String searchId(Profile profile) {
		System.out.println("----------------- Dao SearchId Start --------------");	
		String result = session.selectOne("searchId", profile);
		return result;
		
	}


	@Override
	public int emailCheck(Profile profile) {
		System.out.println("----------------- DAO emailCheck Start --------------");
		int cnt = session.selectOne("emailCheck", profile);
		return cnt;
	}


	@Override
	public void pwSave(Profile profile) {
		session.update("pwSave", profile);
	}

	//로그인한 회원 정보 가져오기
	@Override
	public Profile selectProfile(int mem_num) {
		System.out.println("----------------- Dao selectProfile Start --------------");
		
		Profile selectProfile = null;
		
		try {
			selectProfile = session.selectOne("selectProfile",mem_num);
		} catch (Exception e) {
			System.out.println("selectProfile ErrorMessage --> " + e.getMessage());
		}
		
		return selectProfile;
	}


	@Override
	public int updateInfo(Profile profile) {
		System.out.println("------------ Dao updateInfo -------------");
		int result = session.update("updateInfo", profile);
		return result;
	}


	@Override
	public int updatePhoto(Profile profile) {
		int result = session.update("updatePhoto", profile);
		return result;
	}


	@Override
	public String pwCheck(Profile profile) {
		String result = session.selectOne("pwCheck", profile);

			return result;
	}


	@Override
	public int userSleepUpdate(Profile profile) {
		int result = session.update("userSleepUpdate", profile);
		return result;
	}


	@Override
	public String gradeCheck(Profile profile) {
		String grade = session.selectOne("userGrade", profile);
		System.out.println("------------ Dao gradeCheck -------------");
		return grade;
	}


	@Override
	public int total() {
		int tot = 0;
		System.out.println("ProfileTotal Start total..." );
		try {
			tot = session.selectOne("ProfileTotal");
			System.out.println("ProfileTotal total tot->"+tot );
		} catch (Exception e) {
			System.out.println("ProfileTotal total Exception->"+e.getMessage());
		}
		return tot;
	}


	@Override
	public List<Profile> profileList(Profile profile) {
		List<Profile> profileList = null;
		System.out.println("ProfileDaoImpl listProfile Start ..." );
        try {
        	profileList = session.selectList("ProfileList",  profile);
    		System.out.println("ProfileDaoImpl profileList profileList.size()-->"+profileList.size() );
    		
    		
    		
		} catch (Exception e) {
			System.out.println("ProfileDaoImpl profileList Exception->"+e.getMessage());
		} 
		return profileList;
	}


	@Override
	public int totalKeyword(Profile profile) {
		int tot = 0;
		System.out.println("ProfileDaoImpl totalKeyword Start..." );
		if (profile.getKeyword() == null) profile.setKeyword("%");
		try {
			tot = session.selectOne("profileTotalKeyword", profile);
			System.out.println("ProfileDaoImpl totalKeyword tot->"+tot );
		} catch (Exception e) {
			System.out.println("ProfileDaoImpl totalKeyword Exception->"+e.getMessage());
		}
		return tot;
	}


	@Override
	public List<Profile> listProfileKeyword(Profile profile) {
		List<Profile> listProfileKeyword = null;
		System.out.println("listProfileKeyword Start ..." );
		System.out.println("listProfileKeyword emp.getSearch()-->"+profile.getSearch() );
		System.out.println("listProfileKeyword emp.getKeyword()-->"+profile.getKeyword() );
		if (profile.getKeyword() == null) profile.setKeyword("%");
		
		try {
			listProfileKeyword = session.selectList("listProfileKeyword", profile);
		} catch (Exception e) {
			System.out.println("listProfileKeyword Exception->"+e.getMessage());
		}
		return listProfileKeyword;
	}


	@Override
	public Profile updateUser(Profile profile) {
		Profile result = null;
		if(session.update("updateUser", profile)>0) {
			result = session.selectOne("selectProfile", profile.getMem_num());
		}
		
		return result;
	}


	@Override
	public Profile updateAdmin(Profile profile) {
		Profile result = null;
		if(session.update("updateAdmin", profile)>0) {
			result = session.selectOne("selectProfile", profile.getMem_num());
		}
		
		return result;
	}

	



}
