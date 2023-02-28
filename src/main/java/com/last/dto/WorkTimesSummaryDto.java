package com.last.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("TimesSummaryDto")
public class WorkTimesSummaryDto {
	
	private int no;
	private int employeeNo;				// 사원번호
	private String workYearMonth;		// 근무년월
	private int totalWorkedTimes;		// 총근무시간
	private int overtimeWorkedTimes;	// 연장근무시간
	private int nightWorkedTimes;		// 야근시간
	private int workedTimes;			// 일일근무시간
	
	public int getTotalTimes () {
		return workedTimes + overtimeWorkedTimes + nightWorkedTimes;
	}
	
}
