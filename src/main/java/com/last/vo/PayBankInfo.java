package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("BankInfo")
public class PayBankInfo {

	private int employeeNo;
	private int baseSalary;
	private int overtimeSalary;
	private int nightSalary;
	private int holidaySalary;
	private String startDate;
	private String endDate;
	private String note;
}
