package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.last.dto.OvertimeHistoryDto;
import com.last.vo.Holiday;

@Mapper
public interface HolidayMapper {

	List<OvertimeHistoryDto> getOvertimeHistories(Map<String, Object> param);

	int getOvertimeHistoriesTotalRows(Map<String, Object> param);
	
	// 달력 일정 등록
	void insertholidays(Holiday holiday);
	
	// 달력 일정 정보 조회
	List<Holiday> getHolidays(@Param("startDate") String startDate, @Param("endDate") String ednDate);
	
	// 달력 일정 삭제
	void deleteHolidays(String baseDate);

}
