package com.last.web.request;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class WorkModifyForm {
	
	private int no;
	private int empNo;
	private Date workingDate;
	private String attendancesType;
	private String startWorkTime;
	private String endWorkTime;
	private String empName;
	private int positionNo;
	private int deptNo;
	
}
