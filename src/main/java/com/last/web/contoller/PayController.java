package com.last.web.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PayController {
	
	@GetMapping("/paybank")
	public String paybank() {
		return "paybank";
	}
}
