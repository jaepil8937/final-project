package com.last.web.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@GetMapping("/paybank")
	public String paybank() {
		return "pay/paybank";
	}
	
	@GetMapping("/paybankinfo")
	public String paybankinfo() {
		return "pay/paybankinfo";
	}
	
	@GetMapping("/paybase")
	public String paybase() {
		return "/pay/paybase";
	}
	
	@GetMapping("/extrapay")
	public String extrapay() {
		return "/pay/extrapay";
	}

	@GetMapping("/grade")
	public String grade() {
		return "/pay/grade";
	}
	
	@GetMapping("/simpletax")
	public String simpletax() {
		return "/pay/simpletax";
	}

	@GetMapping("/salarytax")
	public String salarytax() {
		return "/pay/salarytax";
	}

	@GetMapping("/insurance")
	public String insurance() {
		return "/pay/insurance";
	}
	
	
}
