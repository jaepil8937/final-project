package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.SalaryDto;

@Mapper
public interface SalaryMapper {
	
	List<SalaryDto> getSalaryLists();

	
}