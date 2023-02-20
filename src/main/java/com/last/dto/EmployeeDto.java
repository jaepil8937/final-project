package com.last.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("EmployeeDto")
@Getter
@Setter
public class EmployeeDto {

	private int no;					// 사원번호
	private String name;			// 성명
	private Date hire;				// 입사일자
	private String mobileTel;		// 핸드폰
	private String companyEmail;	// e-mail
	private String basicAddress;	// 주소
	private String status;			// 재직상태
	
	private String deptName;		// 부서이름
	private String positionName;	// 직책이름
}
