package com.oracle.S20220601.model.bh;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oracle.S20220601.model.RevPhoto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Review1 {
	private int host_num;			// 업체번호
	private int rev_num;			// 리뷰번호
	private int mem_num;			// 회원번호
	private String rev_content;		// 리뷰내용
	private String rev_date;		// 리뷰 등록일자
	private int rev_point;			// 평점
	private int ref;				// ref
	private int re_step;			// re_step
	
	//버퍼
	private List<RevPhoto> revPhoto;  // 사진들 객체 
	private int room_num;
	private String room_name;   // 객실 이름 --> ROOM 테이블
	private List<MultipartFile> revPhotolist;
	
}
