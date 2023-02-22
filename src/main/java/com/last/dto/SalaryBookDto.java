package com.last.dto;

import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SalaryBookDto {

	private List<SalaryDto> salaryDtoLists;
	
	public int getBaseSalaryTtl() {                  // 사원들의 기본급 합계
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getBaseSalary();
		}
		return total;
	}
	
	public int getMealSalaryTtl() {                 // 사원들의 식대 합계
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getMealSalary();
		}
		return total;
	}
	
	public int getOvertimeSalaryTtl() {             // 사원들의 연장수당 합계 
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getOvertimeSalary();
		}
		return total;
	}
	
	public int getNightSalaryTtl() { 
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getNightSalary();
		}
		return total;
	}
	
	public int getHolidaySalaryTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getHolidaySalary();
		}
		return total;
	}
	
	public int getCareSalaryTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getCareSalary();
		}
		return total;
	}
	
	public int getBusinessSalaryTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getBusinessSalary();
		}
		return total;
	}
	
	public int getRewardSalaryTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getRewardSalary();
		}
		return total;
	}
	
	public int getIncomeTaxTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getIncomeTax();
		}
		return total;
	}
	
	public int getResidenceTaxTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getResidenceTax();
		}
		return total;
	}
	
	public int getPensionTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getPension();
		}
		return total;
	}
	
	public int getHealthInsuranceTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getHealthInsurance();
		}
		return total;
	}
	
	public int getLongtermInsuranceTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getLongtermInsurance();
		}
		return total;
	}
	
	public int getEmploymentInsuranceTtl() {
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getEmploymentInsurance();
		}
		return total;
	}
	
	
}
