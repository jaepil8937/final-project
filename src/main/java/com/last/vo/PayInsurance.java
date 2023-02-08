package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Insurance")
public class PayInsurance {
	
	private int baseYear;
	private int pensionEmployeeInsurance;
	private int pensionCompanyInsurance;
	private int healthEmployeeInsurance;
	private int healthCompanyInsurance;
	private int longtermEmployeeInsurance;
	private int longtermCompanyInsurance;
	private int employmentEmployeeInsurance;
	private int employmentCompanyInsurance;
	private int industrialCompanyInsurance;
	private int minSalary;
	private int maxSalary;
}
