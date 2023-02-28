package com.last.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Alias("DaysSummaryDto")
@Getter
@Setter
@ToString
public class WorkDaysSummaryDto {

	private int employeeNo;
	private String workYearMonth;	// 근무년월
	private String attendancesType;	// 근태구분
	private int tardyDays;			// 지각일수
	private int leaveEarlyDays;		// 조퇴일수
	private int overtimeWorkedDays;	// 연장근무일수
	private int nightWorkedDays;	// 야간근무일수
	private int normalWorkedDays;	// 정상근무일수
	
	public int getTotalDays () {		
		return normalWorkedDays + overtimeWorkedDays + nightWorkedDays;
	}
}