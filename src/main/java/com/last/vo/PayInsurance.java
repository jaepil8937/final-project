package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Insurance")
public class PayInsurance {
	
	private int year;
	private int pensionInsurance;
	private int healthInsurance;
	private int longTermInsurance;
	private int employementInsurance;
	private int employeeContribution;
	private int companyContribution;
	private int minSalary;
	private int maxSalary;
}
