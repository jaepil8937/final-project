package com.last.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("PersonnelDto")
@Getter
@Setter
public class PersonnelDto {

	private int no;						// 사원번호
	private String type;				// 발령구분
	private Date appointmentDate;		// 발령일자, 변수명을 date로 하면 오라클 예약어이므로 에러남
	private String name; 				// 성명
	private String content;				// 발령내용
	private String note;				// 비고
	private String status;				// 재직상태
}
