package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.vo.Educations;

@Mapper
public interface EducationMapper {

	void insertEducation(Educations educations);
	List<Educations> getAllEducations(int empNo);
	void updateEducation(Educations educations);
	void deleteEducationByNo(int educationNo);
}
