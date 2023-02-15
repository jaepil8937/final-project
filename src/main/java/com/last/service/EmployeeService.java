package com.last.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.last.dto.EmployeeDto;
import com.last.dto.PersonnelDto;
import com.last.mapper.EmployeeMapper;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<EmployeeDto> getAllEmployees(Map<String, Object> param) {
		return employeeMapper.getAllEmployees(param);
	}
	
	public List<PersonnelDto> getAllPersonnel(Map<String, Object> param) {
		return employeeMapper.getAllPersonnel(param);
	}
	
}
