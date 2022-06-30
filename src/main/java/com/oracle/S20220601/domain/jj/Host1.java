package com.oracle.S20220601.domain.jj;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "host")
public class Host1 {
	@Id
	private int host_num;		// 업체 번호
	private int mem_num;		// 회원 번호
	private String host_name;	// 업체명
	private String host_addr;	// 업체 주소
	private String host_info;	// 업체 소개
	private int host_code;		// 업체 코드
	private int rev_count;		// 리뷰 갯수
	private float host_avg;		// 평점
	private int like_count;		// 찜한사람 수
	
	@OneToOne
	@JoinColumn(name = "host_num")
	private Stay1 stay1;
	
	@OneToOne
	@JoinColumn(name = "host_num")
	private Store1 store1;
	
	@OneToMany
	@JoinColumn(name = "host_num")
	private List<Menu1> menu1;
	
	@Transient
	private String stay_type_name;
	@Transient
	private String food_type_name;
	
}
