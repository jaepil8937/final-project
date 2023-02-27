package com.last.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("CertificateIssueDto")
@Setter
@Getter
public class CertificateIssueDto {

	private int employeeNo;		// 사원번호
	private String name;		// 이름
	private int deptNo;			// 부서
	private int positionNo;		// 직책
	private int hobong;			// 호봉
	private int requestNo;		// 신청번호
	private Date requestDate;	// 신청일자
	
	private String deptName;
	private String positionName;
}
