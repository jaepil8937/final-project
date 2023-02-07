package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("extraPay")
public class PayExtraPay {

	private int employeeNo;
	private int careSalary;
	private int rewardSalary;
	private int meal;
	private int businessSalary;
	private String note;
}
