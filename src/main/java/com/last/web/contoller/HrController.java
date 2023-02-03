package com.last.web.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/employeelist")
public class HrController {

	@GetMapping("/info")
	public String info() {
		
		return "hr/employeelist";
	}
}
