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
	
	@GetMapping("/register")
	public String register() {
		return "hr/register";
	}
	
	@GetMapping("/re-register")
	public String reregister() {
		return "hr/re-register";
	}
	
	@GetMapping("/family")
	public String family() {
		return "hr/family";
	}
	
	@GetMapping("/education")
	public String education() {
		return "hr/education";
	}
	
	@GetMapping("/order")
	public String order() {
		return "hr/order";
	}
}
