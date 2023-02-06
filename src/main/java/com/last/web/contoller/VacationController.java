package com.last.web.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/vacation")
public class VacationController {

	@GetMapping("/setting")
	public String setting() {
		return "vacation/item-setting";
	}
	
	@GetMapping("/used")
	public String used() {
		return "vacation/item-used";
	}	
	
	@GetMapping("/calculation")
	public String calculation() {
		return "vacation/item-calculation";
	}

	@GetMapping("/apply")
	public String apply() {
		return "vacation/item-apply";
	}	
	
	@GetMapping("/year")
	public String yearVacationDay() {
		return "vacation/year-vacation";
	}
}
