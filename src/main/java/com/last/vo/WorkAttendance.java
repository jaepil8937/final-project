package com.last.vo;

import java.time.LocalDateTime;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("Attendance")
@Setter
@Getter
@ToString
public class WorkAttendance {
		
	private int no;
	private int empNo;				// 사원번호
	private Date workingDate;		// 근무일자
	private String attendancesType;	// 근태구분
	private String startWorkTime;	// 출근시간
	private String endWorkTime;		// 퇴근시간
	private int workedTimes;		// 근무시간
	private int holidayWorkTime;	// 휴일근무시간
	private int overtimeWorkedTimes;// 연장근로시간
	private int nightWorkedTimes;	// 야간근로시간
	private String note;			// 비고
	
}
