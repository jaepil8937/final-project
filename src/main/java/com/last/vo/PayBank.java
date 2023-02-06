package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Bank")
public class PayBank {
	
	private int employeeNo;
	private String name;
	private String account;
	private String owner;
	private int pensionBaseSalary;
	private int healthBaseSalary;
	private int employementBaseSalary;
}
