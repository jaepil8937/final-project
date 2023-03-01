package com.last.web.request;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Alias("CertificateRequest")
@Setter
@Getter
public class CertificateRequest {

	private String name;		// 이름
	private String type;		// 증명서구분
	private int hobong;			// 호봉
	private String purpose;		// 용도
	private String note;		// 비고
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date publishDate;	// 발행일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date requestDate;	// 신청일자
	private String status;		//
	private int deptNo;			// 부서
	private int positionNo;		// 직책
}
