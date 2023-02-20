package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("Appointment")
@Setter
@Getter
public class HrAppointment {

	private int employeeNo;				// 사원번호
	private String type;				// 발령구분
	private Date appointmentDate;		// 발령일자
	private String content;				// 발령내용
	private String note;				// 비고
}
