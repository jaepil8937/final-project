package com.last.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.mapper.EducationMapper;

import com.last.vo.Educations;
import com.last.web.request.EducationRegisterForm;

@Service
public class EducationService {

	@Autowired
	private EducationMapper educationMapper;
	
	public List<Educations> getAllEducations(int empNo) {
		return educationMapper.getAllEducations(empNo);
	}
	
	public void insertEducation(Date admissionDate, String schoolName, String magerDepartment, String graduationType) {
		Educations educations = new Educations();
		educations.setAdmissionDate(admissionDate);
		educations.setSchoolName(schoolName);
		educations.setMagerDepartment(magerDepartment);
		educations.setGraduationType(graduationType);
	}

}
