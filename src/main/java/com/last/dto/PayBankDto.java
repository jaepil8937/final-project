package com.last.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayBankDto {

	private int employeeNo;
	private String bankName;
	private String bankAccount;
	private String bankOwner;
	private int pensionBaseSalary;
	private int healthBaseSalary;
	private int employmentBaseSalary;
	private Date hireDate;
	private Date retirementDate;
}
