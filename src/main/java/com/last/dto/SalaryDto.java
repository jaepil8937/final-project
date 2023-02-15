package com.last.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("salaryDto")
@Setter
@Getter
public class SalaryDto{
	
	private int employeeNo;
	private String baseYearMonth;
	private int baseSalary;
	private int overtimeSalary;
	private int nightSalary;
	private int holidaySalary;
	private int careSalary;
	private int rewardSalary;
	private int mealSalary;
	private int businessSalary;
	private int incomeTax;
	private int residenceTax;
	private int pension;
	private int healthInsurance;
	private int longtermInsurance;
	private int employmentInsurance;
	private String name;
	private String deptName;
	
	public int getTotalSalary() {
		int totalSalary = baseSalary + overtimeSalary + nightSalary + holidaySalary + careSalary + rewardSalary + mealSalary + businessSalary;
		return totalSalary;
	}
	
	public int getDeductionSalary() {
		int deductionSalary = incomeTax + residenceTax + pension + healthInsurance + longtermInsurance + employmentInsurance;
		return deductionSalary;
	}
	
	public int getRealSalary() {
		return getTotalSalary() - getDeductionSalary();
	}
}
