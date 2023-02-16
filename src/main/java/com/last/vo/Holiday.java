package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Holiday")
public class Holiday {

	private int workYear;           // 근무년도  
	private Date baseDate;   		// 기준일자
	private String name;			// 휴일명
	private String dateType;		// 일자구분
	private String holidayType;		// 휴일구분
}
