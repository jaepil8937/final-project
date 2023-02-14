package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.SalaryDto;
import com.last.mapper.SalaryMapper;

@Service
public class SalaryService {
	
	@Autowired
	private SalaryMapper salaryMapper;

	public List<SalaryDto> getSalaryDtoLists() {
		List<SalaryDto> salaryDtoLists = salaryMapper.getSalaryLists();
		
		return salaryDtoLists;
	}
	
}
