package com.last.web.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.dto.HobongDto;
import com.last.dto.PayBankDto;
import com.last.dto.PaybaseDto;
import com.last.service.PayService;import com.last.vo.PayBankInfo;
import com.last.vo.PayInsurance;
import com.last.vo.PaySalaryTax;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService payServiece;
	
	@GetMapping("/paybank")
	public String getPaybank(@RequestParam("employeeNo") int employeeNo,  Model model) {
		PayBankDto payBankDto = payServiece.getPaybank(employeeNo);
		model.addAttribute("paybank", payBankDto);
		return "pay/paybank";
	}
	
	@GetMapping("/paybankinfo")
	public String getPaybankInfo(@RequestParam("employeeNo") int employeeNo, Model model) {
		PayBankInfo payBankInfo = payServiece.getPaybankInfo(employeeNo);
		model.addAttribute("paybankinfo", payBankInfo);
		return "pay/paybankinfo";
	}
	
	@GetMapping("/paybase")
	public String getPaybase(Model model) {
		List<PaybaseDto> paybase = payServiece.getPaybase();
		model.addAttribute("paybase", paybase);
		return "/pay/paybase";
	}
	
	@GetMapping("/extrapay")
	public String extrapay() {
		return "/pay/extrapay";
	}

	@GetMapping("/grade")
	public String getHobong(Model model) {
		List<HobongDto> hobongs = payServiece.getHobong();
		model.addAttribute("hobongs", hobongs);
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
