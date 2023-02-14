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
	private double pensionEmployeeInsurance;
	private double pensionCompanyInsurance;
	private double healthEmployeeInsurance;
	private double healthCompanyInsurance;
	private double longtermEmployeeInsurance;
	private double longtermCompanyInsurance;
	private double employmentEmployeeInsurance;
	private double employmentCompanyInsurance;
	private double industrialCompanyInsurance;
	private int minSalary;
	private int maxSalary;
}
