package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("SalaryTax")
@Getter
@Setter
public class PaySalaryTax {
	
	private int baseSalaryTax;
	private int overtimeSalaryTax;
	private int nightSalaryTax;
	private int holidaySalaryTax;
	private int careSalaryTax;
	private int rewardSalaryTax;
	private int mealTax;
	private int businessSalaryTax;
	
}
