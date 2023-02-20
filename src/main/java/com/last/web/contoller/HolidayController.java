package com.last.web.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.dto.OvertimeHistoryDto;
import com.last.service.HolidayService;

@Controller
@RequestMapping("/holiday")
public class HolidayController {
	
	@Autowired
	HolidayService holidayService;
	
	// 휴일,연장,야간 근무조회
	@GetMapping("/overtime-history")
	public String history(@RequestParam(name="month", required = false, defaultValue = "")String month,
			@RequestParam(name="empNo", required = false, defaultValue = "0") int empNo, 
			@RequestParam(name="pages", required = false, defaultValue = "1") int pages, Model model) {
		
	 	Map<String, Object> param = new HashMap<>();
	 	if (!month.isBlank()) {
	 		param.put("month", month);
	 	}
	 	if (empNo != 0) {
	 		param.put("empNo", empNo);
	 	}
	 	param.put("pages", pages);
	 	
	 	Map<String, Object> result= holidayService.getOvertimeHistories(param);
	 	model.addAttribute("histories", result.get("dtos"));
	 	model.addAttribute("pagination", result.get("pagination"));
	 	
		
		return "holiday/overtime-history";
	}
	
	
	@GetMapping("/holiday-setting")
	public String setting() {
		return "holiday/holiday-setting";
	}
	
	@GetMapping("/calendar")
	public String calendar() {
		return "holiday/holiday-calendar";
	}
	
}
