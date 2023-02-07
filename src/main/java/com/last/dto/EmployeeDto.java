package com.last.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("EmployeeDto")
@Getter
@Setter
public class EmployeeDto {

	public String no;
	public String name;
	public Date hire;
	public String mobileTel;
	public String companyEmail;
	public String basicAddress;
	public String status;
	
	public String deptName;
	public String positionName;
}
