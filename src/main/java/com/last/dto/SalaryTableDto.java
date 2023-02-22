package com.last.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Alias("salaryTableDto")
public class SalaryTableDto {
	
	private List<SalaryDto> salaryDtoLists;            
	
	public int getTotalSalary() {                                // 사원들의 지급총액 합계
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getTotalSalary();
		}
		return total;
	}
	
	public int getDeductionSalary() {                           // 사원들의 공제총액 합계 
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getDeductionSalary();
		}
		return total;
	}
	
	public int getRealSalary() {                          // 사원들의 실지급액 합계 
		int total = 0;
		for (SalaryDto dto : salaryDtoLists) {
			total += dto.getRealSalary();
		}
		return total;
	}
}
