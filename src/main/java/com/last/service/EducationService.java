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
	
	public void insertEducation(int empNo, EducationRegisterForm form) {
		Educations educations = new Educations();
		educations.setAdmissionDate(form.getAdmissionDate());
		educations.setSchoolName(form.getSchoolName());
		educations.setMagerDepartment(form.getMagerDepartment());
		educations.setGraduationType(form.getGraduationType());
		educations.setEmployeeNo(empNo);
		
		educationMapper.insertEducation(educations);
	}
	
	public void deleteEducations(List<Integer> educationNos) {
		for (int educationNo : educationNos) {
			educationMapper.deleteEducationByNo(educationNo);
			
		}
	}

}
