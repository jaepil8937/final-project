package com.last.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.HolidayEvent;
import com.last.dto.OvertimeHistoryDto;
import com.last.mapper.HolidayMapper;
import com.last.utils.Pagination;
import com.last.vo.Holiday;

@Service
public class HolidayService {
	
	@Autowired
	private HolidayMapper holidayMapper;

	public Map<String, Object> getOvertimeHistories(Map<String, Object> param) {
		int pages = (Integer) param.get("pages");
		int totalRows = holidayMapper.getOvertimeHistoriesTotalRows(param);
		
		Pagination pagination = new Pagination(pages, totalRows);
		
		param.put("begin", pagination.getBegin());
		param.put("end", pagination.getEnd());
		
		List<OvertimeHistoryDto>  dtos = holidayMapper.getOvertimeHistories(param);
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("dtos", dtos);
		result.put("pagination", pagination);
		
		return result;
	}
	
	// 달력 휴일 등록
	public Holiday insertholidays(Map<String, Object> param) {
		
		return null;
	}
	
	// 달력 휴일 정보 조회
	public List<HolidayEvent> getHolidayEvents(String startDate, String endDate) {
		List<Holiday> days = holidayMapper.getHolidays(startDate, endDate);
		
		List<HolidayEvent> events = new ArrayList<>();
		for (Holiday day : days) {
			HolidayEvent event = new HolidayEvent();
			event.setStart(day.getBaseDate());
			event.setEnd(day.getBaseDate());
			event.setId(String.valueOf(day.getBaseDate().getTime()));
			event.setTitle(day.getName());
			event.setAllDay(true);
			
			events.add(event);
		}
		
		return events;
	}
	
	
}
