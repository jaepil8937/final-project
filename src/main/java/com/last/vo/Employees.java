package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Data
@Alias("employee")
@ToString
public class Employees {
	
	private int employeeNo;				 // 사원번호
	@JsonIgnore
	private String password;			 // 비밀번호
	private String name;				 // 이름
	private String gender;				 // 성별
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date birthday;			 // 생일
	private String comTel;				 // 회사번호
	private String homeTel;				 // 자택번호
	private String mobileTel;  			 // 휴대폰번호
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
	private String memo; 				 // 메모
	private Date createdDate; 			 // 사원정보등록일
	private Date updatedDate; 			 // 사원정보수정일
	private int deptNo; 				 // 부서번호
	private int positionNo;				 // 직책번호
	private int hobong; 				 // 호봉
	private String photo;				 // 사진
	private String deptName;
	private String positionName;

}
