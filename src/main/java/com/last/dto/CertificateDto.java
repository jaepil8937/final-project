package com.last.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("CertificateDto")
@Getter
@Setter
public class CertificateDto {

	private int requestNo;			// 신청번호
	private String type;			// 증명서구분
	private Date requestDate;		// 신청일자
	private int no;					// 사원번호
	private String name;			// 성명
	private String requestStatus;	// 발행상태
	private Date publishDate;		// 발행일자
	private String purpose;			// 용도
	private String status;			// 재직상태
	private String note;			// 비고
}
