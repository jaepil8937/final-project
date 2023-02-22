package com.last.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("periodDto")
@Setter
@Getter
public class SalaryPeriodDto {
	
	private int employeeNo;
	private String name;
	private int totalSalary;
	private int deductionSalary;
	private int realSalary;
}
