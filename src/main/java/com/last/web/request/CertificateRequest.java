package com.last.web.request;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("CertificateRequest")
@Setter
@Getter
public class CertificateRequest {

	private int employeeNo;		// 사원번호
	private String name;		// 이름
	private int deptNo;			// 부서
	private int positionNo;		// 직책
	private int hobong;			// 호봉
	private String purpose;		// 용도
	private String note;		// 비고
	private Date publishDate;	// 발행일자
}
