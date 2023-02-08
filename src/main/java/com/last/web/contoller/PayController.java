package com.last.web.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.service.PayService;
import com.last.vo.PayInsurance;
import com.last.vo.PaySalaryTax;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService payServiece;
	
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
	public String getAllTaxs(Model model) {
		List<PaySalaryTax> taxs = payServiece.getAllTaxs();
		model.addAttribute("taxs", taxs);
		return "/pay/salarytax";
	}

	@GetMapping("/insurance")
	public String insurance(Model model) {
		List<PayInsurance> insurance = payServiece.getInsurance();
		model.addAttribute("insurance", insurance);
		return "/pay/insurance";
	}
	
	
}
