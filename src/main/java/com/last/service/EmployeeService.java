package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.last.dto.EmployeeDto;
import com.last.mapper.EmployeeMapper;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	
	public List<EmployeeDto> getAllEmployees() {
		return employeeMapper.getAllEmployees();
	}
	
}
