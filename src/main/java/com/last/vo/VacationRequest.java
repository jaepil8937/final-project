package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("VacationRequest")
@Getter
@Setter
public class VacationRequest {
	private int no;					//신청번호
	private int empNo; 				//사원번호
	private int itemCode;			//항목코드
	private String requestDate;		//휴가신청일
	private String startDate;		//휴가삭제일
	private String endDate;			//휴가종료일
	private int days;				//사용일수
	private String reason;			//휴가사유
	private String status;			//결재상태
	private Date createdDate;		//휴가신청정보일
	private Date updatedDate;		//휴가신청최종수정일
	
}
