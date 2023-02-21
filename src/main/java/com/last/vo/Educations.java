package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@Alias("education")
public class Educations {
	
	private int employeeNo;
	private Date admissionDate;
	private String schoolName;
	private String magerDepartment;
	private String graduationType;
	private int educationNo;
	

}
