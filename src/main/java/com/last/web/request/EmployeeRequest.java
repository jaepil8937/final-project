package com.last.web.request;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("EmployeeRequest")
@Setter
@Getter
@ToString
public class EmployeeRequest {

	private int employeeNo;					// 사원번호
	private String type;					// 발령구분
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date appointmentDate;			// 발령일자
	private int positionNo;					// 발령직급
	private int deptNo;						// 발령부서
	private String content;					// 발령내용
	private String note;					// 비고 
}										
