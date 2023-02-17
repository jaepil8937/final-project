package com.last.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class EmployeebasicDto {

	private int employeeNo;
	private String name;
	private int positionNo;
	private int deptNo;
	private Date hireDate;
	private Date retirementDate;
	private String mobileTel;
	private String comEmail;
	private String basicAddress;
	private String memo;
}
