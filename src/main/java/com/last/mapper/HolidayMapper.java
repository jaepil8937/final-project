package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.OvertimeHistoryDto;
import com.last.vo.Holiday;

@Mapper
public interface HolidayMapper {

	List<OvertimeHistoryDto> getOvertimeHistories(Map<String, Object> param);

	int getOvertimeHistoriesTotalRows(Map<String, Object> param);
	
	void insertholidays(Holiday holiday);
	
	List<Holiday> getHolidays(Map<String, Object> param);

}
