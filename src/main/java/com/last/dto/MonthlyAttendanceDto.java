package com.last.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
@Alias("MonthlyAttendanceDto")
public class MonthlyAttendanceDto {
	
	private int no;					// 근태정보번호
	private int employeeNo;			// 사원번호
	private String name;			// 사원명
	private String deptName;		// 부서명
	private String positionName;	// 직급명
	private int hobong;				// 호봉
	private int totalWorkedDays;	// 총근무일수
	private int normalWorkedDays;	// 정상근무일수
	private int nightWorkedDays;	// 야근이룻
	private int overtimeWorkedDays;	// 연장근무일수
	private int workedTimes;		// 정상근무시간
	private int overtimeWorkedTimes;	// 연장근무시간
	private int nightWorkedTimes;	// 야근시간
	private int leaveEarlyDays;		// 조퇴일수
	private int tardyDays;			// 지각일수
	private Date workingDate;		// 근무일자                                      
	
	public int getTotalDays() {
		return normalWorkedDays + nightWorkedDays + overtimeWorkedDays;
	}
	
	public int getTotalTimes() {
		return workedTimes + overtimeWorkedTimes + nightWorkedTimes;
	}
	

}
