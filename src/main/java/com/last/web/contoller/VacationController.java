package com.last.web.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/vacation")
public class VacationController {

	@GetMapping("/setting")
	public String form() {
		return "item-setting";
	}
}
