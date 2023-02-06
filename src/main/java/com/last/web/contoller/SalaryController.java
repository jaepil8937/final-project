package com.last.web.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping; 

@Controller
@RequestMapping("/salary")
public class SalaryController {
	
	@GetMapping("/salarycalculate")
	public String salarycalculate() {
		return "salary/salarycalculate";
	}

	@GetMapping("/salarycheck")
	public String salarycheck() {
		return "salary/salarycheck";
	}
}
