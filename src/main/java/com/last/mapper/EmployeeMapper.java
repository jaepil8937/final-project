package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.EmployeeDto;
import com.last.dto.PersonnelDto;


@Mapper
public interface EmployeeMapper {

	List<EmployeeDto> getAllEmployees(Map<String, Object> param);
	List<PersonnelDto> getAllPersonnel(Map<String, Object> param);
}

