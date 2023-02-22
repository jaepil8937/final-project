package com.last.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.SalaryDto;
import com.last.dto.SalaryPeriodDto;
import com.last.mapper.SalaryMapper;
import com.last.vo.PayBankInfo;

@Service
public class SalaryService {
	
	@Autowired
	private SalaryMapper salaryMapper;
	
	// 급여계산
	public List<SalaryDto> getSalaryDtoLists(String basemonth, String startdate, String enddate, String paydate) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		if (!basemonth.isBlank()) {
			param.put("basemonth", basemonth);	
		}
		if (!startdate.isBlank()) {
			param.put("startdate", startdate);			
		}
		if (!enddate.isBlank()) {
			param.put("enddate", enddate);			
		}
		if (!paydate.isBlank()) {
			param.put("paydate", paydate);			
		}
		List<SalaryDto> salaryDtoLists = salaryMapper.getSalaryLists(param);
		
		return salaryDtoLists;
	}

	// 급여계산 - 사원 급여 정보 가져오기
	public SalaryDto getCalculatedSalaryDto(int empNo, String basemonth) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);
		param.put("basemonth", basemonth);
		SalaryDto salaryDto = salaryMapper.getCalculatedSalaryDto(param);
		
		return salaryDto;
	}
	
	// 급여계산 - 급여내역 없는 사원의 기본정보 가져오기
	public PayBankInfo getBasicSalaryInfo(int empNo) {
		
		PayBankInfo payBankInfo = salaryMapper.getBasicSalaryInfo(empNo);
		
		return payBankInfo;
	}
	
	// 급여계산 - 입력한 급여 저장 및 반영하기
	public SalaryDto saveSalary (SalaryDto salaryDetail) {
		salaryMapper.insertSalary(salaryDetail);
		
		return salaryMapper.getCalculatedSalaryByNo(salaryDetail.getEmployeeNo(), salaryDetail.getBaseYearMonth());
	}
	
	// 급여계산 - 입력된 급여 수정 및 반영하기
	public SalaryDto updateSalary (SalaryDto salaryDetail) {
		salaryMapper.updateSalary(salaryDetail);
		
		return salaryMapper.getCalculatedSalaryByNo(salaryDetail.getEmployeeNo(), salaryDetail.getBaseYearMonth());
	}
	
	// 급여계산 - 입력된 급여 삭제하기
	public SalaryDto deleteSalary(int empNo, String basemonth) {
		SalaryDto salaryDto = salaryMapper.getCalculatedSalaryByNo(empNo, basemonth);
		salaryMapper.deleteSalary(empNo, basemonth);
		
		return salaryDto;
	}
	
	// 급여조회
	public List<SalaryDto> getSalaryDtoLists(String basemonth, String opt, String keyword) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		if (!basemonth.isBlank()) {
			param.put("basemonth", basemonth);			
		}
		if (!opt.isBlank() && !keyword.isBlank()) {
			param.put("opt", opt);
			param.put("keyword", keyword);			
		}
		List<SalaryDto> salaryDtoLists = salaryMapper.getSalaryLists(param);
		
		return salaryDtoLists;
	}
	
	// 급여조회 - 사원 급여 명세 가져오기
	public SalaryDto getSalaryDetailDto(int empNo, String paydate) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);
		param.put("paydate", paydate);
		SalaryDto salaryDto = salaryMapper.getSalaryDetailDto(param);

		return salaryDto;
	}
	
	// 급여대장
	public List<SalaryDto> getSalaryDtoLists(String basemonth) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		if (!basemonth.isBlank()) {
			param.put("basemonth", basemonth);			
		}
		List<SalaryDto> salaryDtoLists = salaryMapper.getSalaryLists(param);
		
		return salaryDtoLists;
	}
	
	// 기간별 급여현황 - 급여총계
	public List<SalaryPeriodDto> getPeriodDtoLists(String startdate, String enddate) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		if (!startdate.isBlank()) {
			param.put("startdate", startdate);			
		}
		if (!enddate.isBlank()) {
			param.put("enddate", enddate);			
		}
		List<SalaryPeriodDto> periodDtoLists = salaryMapper.getPeriodDtoLists(param);
		
		return periodDtoLists;
	}
	
}
  