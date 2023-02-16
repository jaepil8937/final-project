package com.last.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.OvertimeHistoryDto;
import com.last.mapper.HolidayMapper;

@Service
public class HolidayService {
	
	@Autowired
	private HolidayMapper holidayMapper;

	public List<OvertimeHistoryDto> getOvertimeHistories(Map<String, Object> param) {
		List<OvertimeHistoryDto>  dtos = holidayMapper.getOvertimeHistories(param);
		return dtos;
	}
	
}
