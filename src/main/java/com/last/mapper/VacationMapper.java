package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.last.dto.VacationRequestDto;
import com.last.vo.VacationDay;

import com.last.vo.VacationItem;

@Mapper
public interface VacationMapper {
	
	List<VacationItem> getItems();

	VacationItem getItemByCode(int code);

	void insertItem(VacationItem item);
  
	// 모든 근속연수별 조회
	List<VacationDay> getYearVacationDay();
	
	// 근속연수별 행 추가 
	void insertYearVacationDay(VacationDay vacationDay);
	
	// 근속연수별 행 수정
	void updateYearVacationDay(VacationDay vacationDay);
	
	// 근속연수별 행 삭제
	void deleteYearVacationDay(int workedYear);


	void updateItem(VacationItem item);

	List<VacationRequestDto> getUsedVacations(Map<String, Object> param);
}
	

