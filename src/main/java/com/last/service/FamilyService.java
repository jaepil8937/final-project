package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.last.mapper.FamilyMapper;

import com.last.vo.Family;

@Service
public class FamilyService {

	@Autowired
	private FamilyMapper familyMapper;
	
	public List<Family> getAllFamily(int empNo) {
		return familyMapper.getAllFamily(empNo);
	}
}
