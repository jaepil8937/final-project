package com.last.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("OvertimeDto")
public class OvertimeHistoryDto {
	private int employeeNo;
	private String employeeName;
	private String positionName;
	private String deptName;
	private String attendancesType;
	private String endWorkTime;
	private Date workingDate;
	
}
