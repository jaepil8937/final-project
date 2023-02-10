package com.last.dto;


import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("VacationRequestDto")
@Getter
@Setter
public class VacationRequestDto {
	private int empNo;
	private int year;
	private String empName;
	private String positionName;
	private String deptName;
	private int days;
	private String itemName;
	private String requestDate;
	private String startDate;
	private String endDate;
	private String status;
}
