package com.last.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("salaryDto")
@Setter
@Getter
public class SalaryDto{
	
	private int employeeNo;            // 사원번호
	private String baseYearMonth;      // 급여년월
	private String startDate;          // 정산기간 시작일자
	private String endDate;            // 정산기간 마감일자
	private String payDate;            // 급여지급일
	private int baseSalary;            // 기본급
	private int overtimeSalary;        // 연장수당
	private int nightSalary;           // 야간수당
	private int holidaySalary;         // 휴일근무수당
	private int careSalary;            // 보육수당
	private int rewardSalary;          // 상여금
	private int mealSalary;			   // 식대
	private int businessSalary;        // 출장비
	private int incomeTax;             // 소득세
	private int residenceTax;          // 주민세
	private int pension;               // 국민연금
	private int healthInsurance;       // 건강보험료
	private int longtermInsurance;     // 장기요양보험료
	private int employmentInsurance;   // 고용보험료
	private String name;               // 사원이름
	private String deptName;           // 부서
	private String positionName;       // 직책이름
	private Date hireDate; 		       // 입사일자
	private Date retirementDate;	   // 퇴사일자
	
	public int getTotalSalary() {      // 지급총액
		int totalSalary = baseSalary + overtimeSalary + nightSalary + holidaySalary + careSalary + rewardSalary + mealSalary + businessSalary;
		return totalSalary;
	}
	
	public int getDeductionSalary() {   // 공제총액
		int deductionSalary = incomeTax + residenceTax + pension + healthInsurance + longtermInsurance + employmentInsurance;
		return deductionSalary;
	}
	
	public int getRealSalary() {        // 실지급액
		return getTotalSalary() - getDeductionSalary();
	}
}
