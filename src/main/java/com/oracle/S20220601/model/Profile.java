package com.oracle.S20220601.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Profile {
	private int mem_num;		// 회원번호
	private String id;			// 아이디
	private String pw;			// 비밀번호
	private String name;		// 이름
	private String gender;		// 성별
	private String email;		// 이메일
	private String phone;		// 연락처
	private String birth;		// 생년월일
	private String agree;		// 동의여부
	private Date join_date;		// 가입날짜
	private String photo;		// 회원사진
	private String grade;		// 등급
	
	
	
}
