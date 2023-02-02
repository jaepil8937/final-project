package com.last.web.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
	
	@GetMapping("/paybank")
	public String paybank() {
		return "paybank";
	}
	
	@GetMapping("/paybankin")
	public String paybankinfo() {
		return "paybankinfo";
	}
	
	@GetMapping("/paybase")
	public String paybase() {
		return "../paybase";
	}
}
