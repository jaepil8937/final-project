package com.last.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.last.vo.PayHistories;

@Mapper
public interface SalaryMapper {
	
	PayHistories getPayHistoriesByNo(int employeeNo);
	
	
}