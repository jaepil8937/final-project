package com.last.mapper;

import java.util.List; 
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.last.dto.SalaryDto;
import com.last.dto.SalaryContribution;
import com.last.dto.SalaryPeriodDto;
import com.last.vo.PayBankInfo;

@Mapper
public interface SalaryMapper {
	
	// 급여대상
	List<SalaryDto> getSalaryLists(String basemonth);
	// 사원 급여 정보 가져오기
	SalaryDto getCalculatedSalaryDto(Map<String, Object> param);
	// 급여내역 없는 사원의 기본정보 가져오기
	PayBankInfo getBasicSalaryInfo(Map<String, Object> param);
	// 급여저장
	void insertSalary(SalaryDto salaryDetail);
	// 급여수정
	void updateSalary(SalaryDto salaryDetail);
	// 입력된 사원의 급여 가져오기
	SalaryDto getCalculatedSalaryByNo(@Param("employeeNo") int empNo, @Param("baseYearMonth") String basemonth);
	// 급여삭제
	void deleteSalary(@Param("employeeNo") int empNo, @Param("baseYearMonth") String baseYearMonth);
	// 급여조회, 급여대장 
	List<SalaryDto> getSalaryHistories(Map<String, Object> param);
	// 급여조회 - 사원 급여 명세 가져오기
	SalaryDto getSalaryDetailDto(Map<String, Object> param);
	// 기간별 급여현황 - 급여총계
	List<SalaryPeriodDto> getPeriodDtoLists(Map<String, Object> param);
	// 기간별 급여현황 - 급여상세내역
	List<SalaryDto> getPeriodDetails(Map<String, Object> param);
	// 국민연금, 건강보험, 고용보험 기본정보
	List<SalaryDto> getSalaryDtoInfos(Map<String, Object> param);
	// 국민연금, 건강보험, 고용보험 납입내역
	List<SalaryContribution> getContributionDetails(Map<String, Object> param); 
	
}