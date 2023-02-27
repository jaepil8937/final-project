package com.last.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Alias("EmployeeDetailDto")
@Getter
@Setter
public class EmployeeDetailDto {		// 사원명부/인사기록에서 사원번호를 통해 직원정보 상세조회

	private int employeeNo;				 // 사원번호
	private String name;				 // 이름
	private String gender;				 // 성별
	@JsonFormat(pattern = "yyyy.MM.dd")
	private Date birthday;				 // 생일
	private String memo; 				 // 메모
	private String comTel;				 // 회사번호
	private String homeTel;				 // 자택번호
	private String mobileTel;  			 // 핸드폰
	private String comEmail;   			 // 회사이메일
	private String extEmail;   			 // 외부이메일
	private String zipcode; 			 // 우편번호
	private String basicAddress; 		 // 기본주소
	private String detailAddress; 		 // 상세주소
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date hireDate; 				 // 입사일자
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date retirementDate;		 // 퇴사일자
	private String employeeStatus; 		 // 재직상태
	private String employeeRoleName;	 // 보유권한이름 (관리자,직원)
	private int hobong; 				 // 호봉
	private String photo;				 // 사진
	
	private String deptName;			 // 부서이름
	
	private String positionName;		 // 직급이름
}
