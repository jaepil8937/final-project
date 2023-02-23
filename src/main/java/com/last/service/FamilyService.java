package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.last.mapper.FamilyMapper;
import com.last.vo.Educations;
import com.last.vo.Family;
import com.last.web.request.EducationRegisterForm;
import com.last.web.request.FamilyRegisterForm;

@Service
public class FamilyService {

	@Autowired
	private FamilyMapper familyMapper;
	
	public List<Family> getAllFamily(int empNo) {
		return familyMapper.getAllFamily(empNo);
	}
	
	public void insertFamily(int empNo, FamilyRegisterForm form) {
		Family family = new Family();
		family.setCohabitation(form.getCohabitation());
		family.setDependents(form.getDependents());
		family.setHandicapped(form.getHandicapped());
		family.setEmployeeNo(empNo);
		family.setName(form.getName());
		family.setRelations(form.getRelations());
		
		familyMapper.insertFamily(family);
	}
	
	public void deleteFamily(List<Integer> familyNos) {
		for (int familyNo : familyNos) {
			familyMapper.deleteFamilyByNo(familyNo);
			
		}
	}
	
}
