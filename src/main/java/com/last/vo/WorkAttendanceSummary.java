package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("AttendanceSummary")
@Getter
@Setter
public class WorkAttendanceSummary {
	private int no;
	private int empNo;				// 사원번호
	private String workYearMonth;	// 근무년월
	private int totalWorkedDays;	// 총근무일수
	private int weekdayWorkedDays;	// 평일근무일수
	private int holidayWorkedDays;	// 휴일근무일수
	private int vacationDays;		// 휴가사용일수
	private int absentDays;			// 결근일수
	private int weekdayOverTimes;	// 평일연장근무시간
	private int weekdayNightTimes;	// 평일야근시간
	private int holidayOverTimes;	// 휴일연장근무시간
	private int holidayNightTimes;	// 휴일야근시간
	private int tardinessTiems;		// 지각
	private int earlyTimes;			// 조퇴
	
}
