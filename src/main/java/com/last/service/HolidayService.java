package com.last.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.relation.Role;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.HolidayEvent;
import com.last.dto.OvertimeHistoryDto;
import com.last.mapper.EmployeeMapper;
import com.last.mapper.HolidayMapper;
import com.last.security.AuthenticatedUser;
import com.last.security.LoginEmployee;
import com.last.utils.Pagination;
import com.last.vo.Employees;
import com.last.vo.Holiday;

@Service
public class HolidayService {
	
	@Autowired
	private HolidayMapper holidayMapper;

	public Map<String, Object> getOvertimeHistories(LoginEmployee loginEmployee, Map<String, Object> param) {
		
		
		if("ROLE_EMPLOYEE".equals(loginEmployee.getRoleName())) {
			param.put("empNo", loginEmployee.getNo());
		} 
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
			event.setDateType(day.getDateType());
			event.setHolidayType(day.getHolidayType());
			
			events.add(event);
		}
		
		return events;
	}
	
	// 달력 휴일 등록
	public HolidayEvent insertholidays(Date baseDate, String name, String dateType, String holidayType ) {
		Holiday holiday = new Holiday();
		holiday.setBaseDate(baseDate);
		holiday.setName(name);
		holiday.setDateType(dateType);
		holiday.setHolidayType(holidayType);
		
		holidayMapper.insertholidays(holiday);
		
		HolidayEvent holidayEvent = new HolidayEvent();
		holidayEvent.setStart(holiday.getBaseDate());
		holidayEvent.setEnd(holiday.getBaseDate());
		holidayEvent.setId(String.valueOf(holiday.getBaseDate().getTime()));
		holidayEvent.setTitle(holiday.getName());
		holidayEvent.setAllDay(true);
		
		return holidayEvent;
	}
	
	// 달력 휴일 삭제
	public void deleteHolidays(String baseDate) {
		holidayMapper.deleteHolidays(baseDate);
	}
}
