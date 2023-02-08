package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.vo.VacationDay;
import com.last.vo.VacationItem;

@Mapper
public interface VacationMapper {
	
	List<VacationItem> getItems();

	VacationItem getItemByCode();

	void insertItem();

	void updateItem();
	
	// 모든 근속연수별 조회
	List<VacationDay> getYearVacationDay();
	
	// 근속연수별 행 추가 
	void insertYearVacationDay(VacationDay vacationDay);
	
	// 근속연수별 행 수정
	void updateYearVacationDay(VacationDay vacationDay);
	
	// 근속연수별 행 삭제
	void deleteYearVacationDay(int workedYear);
	
}
	

