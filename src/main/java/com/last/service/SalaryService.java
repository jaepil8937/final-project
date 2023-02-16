package com.last.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.SalaryDto;
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
	
	public PayBankInfo getBasicSalaryInfo(int empNo) {
		
		PayBankInfo payBankInfo = salaryMapper.getBasicSalaryInfo(empNo);
		
		return payBankInfo;
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
	
	// 급여조회 - 사원 급여 정보 가져오기
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
	
}
  