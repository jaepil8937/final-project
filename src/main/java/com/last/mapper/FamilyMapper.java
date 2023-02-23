package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.last.vo.Family;

@Mapper
public interface FamilyMapper {

	void insertFamily(Family family);
	List<Family> getAllFamily(int empNo);
	void updateFamily(Family family);
	void deleteFamilyByNo(int familyNo);
}
