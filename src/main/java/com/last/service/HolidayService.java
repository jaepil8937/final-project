package com.last.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.last.dto.OvertimeHistoryDto;
import com.last.mapper.HolidayMapper;
import com.last.utils.Pagination;

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
	
}
