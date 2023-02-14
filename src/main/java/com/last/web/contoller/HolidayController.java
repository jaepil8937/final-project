package com.last.web.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/holiday")
public class HolidayController {
	
	@GetMapping("/overtime-history")
	public String history() {
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
