package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("VacationCount")
@Getter
@Setter
public class VacationCount {
	private int empNo;					//사원번호
	private int year;					//기준년도
	private Date basedDate;				//근속기준일
	private int workedYear;				//근속년수
	private int totalVacationCount;		//근속년수별 휴가일수(총연차)
	private int usedVacationCount;		//사용연차
	private int remainedVacationCount;	//잔여연차
}
