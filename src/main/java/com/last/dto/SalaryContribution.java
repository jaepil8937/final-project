package com.last.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("contributionDto")
@Setter
@Getter
public class SalaryContribution {

	private int employeeNo;
	private int baseSalary;
	private int overtimeSalary;
	private int nightSalary;
	private int holidaySalary;
	private int rewardSalary;
	private int businessSalary;
	private int pension;
	private int healthInsurance;
	private int longtermInsurance;
	private int employmentInsurance;
	private String payDate;
	private double pensionEmployeeRate;
	private double healthEmployeeRate;
	private double longtermEmployeeRate;
	private double employmentEmployeeRate;
	
	public double getBaseIncome() {    		// 기준소득월액
		double baseIncome = baseSalary + overtimeSalary + nightSalary + holidaySalary 
						+ rewardSalary + businessSalary;
		return baseIncome;
	}
	
}