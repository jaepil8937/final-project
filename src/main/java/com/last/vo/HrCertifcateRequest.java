package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("HrCertifcateRequest")
@Getter
@Setter
public class HrCertifcateRequest {

	private int requestNo;			// 신청번호
	private String type;			// 증명서구분
	private Date requestDate;		// 신청일자
	private Date publishDate;		// 발행일자
	private String status;			// 신청상태
	private String purpose;			// 용도
	private String note;			// 비고
	private Date createdDate; 		// 증명서신청정보등록일
	private Date updatedDate; 		// 증명서신청정보최종수정일
	private int no;					// 사원번호
}
