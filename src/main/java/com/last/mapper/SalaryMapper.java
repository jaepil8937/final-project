package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.SalaryDto;
import com.last.vo.PayBankInfo;

@Mapper
public interface SalaryMapper {
	
	
	List<SalaryDto> getSalaryLists(Map<String, Object> param);
	
	SalaryDto getCalculatedSalaryDto(Map<String, Object> param);
	
	SalaryDto getSalaryDetailDto(Map<String, Object> param);
	
	PayBankInfo getBasicSalaryInfo(int empNo);
	
}