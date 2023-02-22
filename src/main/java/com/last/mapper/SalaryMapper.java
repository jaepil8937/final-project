package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.last.dto.SalaryDto;
import com.last.dto.SalaryPeriodDto;
import com.last.vo.PayBankInfo;

@Mapper
public interface SalaryMapper {
	
	// 급여계산, 급여조회, 급여대장 
	List<SalaryDto> getSalaryLists(Map<String, Object> param);
	// 급여계산 - 사원 급여 정보 가져오기
	SalaryDto getCalculatedSalaryDto(Map<String, Object> param);
	// 급여계산 - 급여내역 없는 사원의 기본정보 가져오기
	PayBankInfo getBasicSalaryInfo(int empNo);
	// 급여계산 - 입력한 급여 저장하기
	void insertSalary(SalaryDto salaryDetail);
	// 급여계산 - 입력한 사원의 급여 반영하기
	SalaryDto getCalculatedSalaryByNo(@Param("employeeNo") int empNo, @Param("baseYearMonth") String basemonth);
	// 급여계산 - 입력된 사원의 급여 수정하기
	void updateSalary(SalaryDto salaryDetail);
	// 급여계산 - 입력된 사원의 급여 삭제하기
	void deleteSalary(@Param("employeeNo") int empNo, @Param("baseYearMonth") String baseYearMonth);
	// 급여조회 - 사원 급여 명세 가져오기
	SalaryDto getSalaryDetailDto(Map<String, Object> param);
	// 기간별 급여현황 - 급여총계
	List<SalaryPeriodDto> getPeriodDtoLists(Map<String, Object> param);
	
}