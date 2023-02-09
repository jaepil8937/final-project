package com.last.web.request;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class EmployeeRegisterForm {		
	private MultipartFile file1;
	private String photo;
	private int employeeNo;
	private String password;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String gender;
	private String memo;
	private String comTel;
	private String homeTel;
	private String mobileTel;
	private String comEmail;
	private String extEmail;
	private String employeeStatus;
	private String employeeRoleName;
	private String hireDate;
	private String retirementDate;
	private String hobong;
	private int deptNo;
	private int positionNo;
	private String zipcode;
	private String basicAddress;
	private String detailAddress;
	
	
}
