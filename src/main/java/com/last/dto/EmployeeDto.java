package com.last.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("EmployeeDto")
@Getter
@Setter
public class EmployeeDto {

	private String no;
	private String name;
	private Date hire;
	private String mobileTel;
	private String companyEmail;
	private String basicAddress;
	private String status;
	
	private String deptName;
	private String positionName;
}
