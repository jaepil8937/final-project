package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.OvertimeHistoryDto;

@Mapper
public interface HolidayMapper {

	List<OvertimeHistoryDto> getOvertimeHistories(Map<String, Object> param);

	int getOvertimeHistoriesTotalRows(Map<String, Object> param);

}
