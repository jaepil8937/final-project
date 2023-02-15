package com.last.web.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.dto.SalaryDto;
import com.last.dto.SalaryTableDto;
import com.last.service.SalaryService;

@Controller
@RequestMapping("/salary")
public class SalaryController {
	
	@Autowired
	private SalaryService salaryService;
	
	@GetMapping("/salarycalculate")    	// 급여계산
	public String salarycalculate (Model model) {
		List<SalaryDto> salaryDtoLists = salaryService.getSalaryDtoLists();
		
		SalaryTableDto tableDto = new SalaryTableDto();
		tableDto.setSalaryDtoLists(salaryDtoLists);
		
		model.addAttribute("TableDto", tableDto);
		
		return "salary/salarycalculate";
	}
	
	@GetMapping("/salarycheck")			// 급여조회
	public String salarycheck() {
		
		return "salary/salarycheck";
	}
	
	@GetMapping("/salarybook")          // 급여대장
	public String salarybook() {
		
		return "salary/salarybook";
	}
	
}
