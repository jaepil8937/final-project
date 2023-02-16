package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.VacationCalculateDto;
import com.last.dto.VacationRequestDto;
import com.last.vo.VacationDay;

import com.last.vo.VacationItem;
import com.last.vo.VacationRequest;

@Mapper
public interface VacationMapper {
	
	List<VacationItem> getItems();

	VacationItem getItemByCode(int code);

	void insertItem(VacationItem item);

	void updateItem(VacationItem item);

	List<VacationRequestDto> getUsedVacations(Map<String, Object> param);
	
	// 근속년수 계산
	int getWorkedYears(Map<String, Object> param);
	// 연차개수 0년차
	int getVacationCountBy0(Map<String, Object> param);
	// 연차개수 1년차
	int getVacationCountBy1(Map<String, Object> param);
	// 연차개수 2년차 이상
	int getVacationCount(Map<String, Object> param);
	// 연차사용일수 계산
	int getYearVacationUsedDays(int usedDays);
	// 휴가일수 계산
	void insertCalculatedDays(Map<String, Object> param);
	// 휴가일수 조회
	VacationCalculateDto getCalculatedDays(Map<String, Object> param);

	VacationRequestDto getVacationRequestInfoByNo(int no);


	void updateStatus(VacationRequestDto requestList);

	// 모든 근속연수별 조회
	List<VacationDay> getYearVacationDay();
	
	// 근속연수별 행 추가 
	void insertYearVacationDay(VacationDay vacationDay);
	
	// 근속연수별 행 삭제
	void deleteYearVacationDay(int workedYear);

	void insertVacationRequest(VacationRequest request);

}
	

