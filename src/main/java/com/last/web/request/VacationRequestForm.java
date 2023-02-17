package com.last.web.request;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class VacationRequestForm {
	private int no;
	private int empNo;
	private String requestDate;
	private String startDate;
	private String endDate;
	private int days;
	private int itemCode;
	private String status;
	private String reason;
}
