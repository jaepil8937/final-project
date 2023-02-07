package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.EmployeeDto;


@Mapper
public interface EmployeeMapper {

	List<EmployeeDto> getAllEmployees();
}

