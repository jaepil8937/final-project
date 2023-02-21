package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.mapper.EducationMapper;

import com.last.vo.Educations;

@Service
public class EducationService {

	@Autowired
	private EducationMapper educationMapper;
	
	public List<Educations> getAllEducations(int empNo) {
		return educationMapper.getAllEducations(empNo);
	}
}
