package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
// mybatis 어노테이션
@Alias("VacationDay")
public class VacationDay {
	
	private int workedYear;     	// 근속년수
	private int vacationDays;		// 휴가일수
	private String note;			// 비고

}
