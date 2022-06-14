package com.oracle.S20220601.model.jh;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Chat {
	private int mem_num;		// 회원번호
	private int msg_num;		// 메세지번호
	private String grade;		// 등급
	private String msg_read;	// 읽음 여부
	private String msg_time;	// 메세지 등록 시간
	private String msg;			// 메세지
	
	private String chatRoomId;	// mem_num
    private String writer;		// grade
    private String message;		// msg
    private MessageType type;	// 
}
