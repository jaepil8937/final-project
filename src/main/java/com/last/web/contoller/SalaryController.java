package com.last.web.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.dto.SalaryBookDto;
import com.last.dto.SalaryDto;
import com.last.dto.SalaryTableDto;
import com.last.service.SalaryService;
import com.last.vo.PayBankInfo;

@Controller
@RequestMapping("/salary")
public class SalaryController {
	
	@Autowired
	private SalaryService salaryService;
	
	@GetMapping("/salarycalculate")       // 급여계산
	public String salarycalculate (@RequestParam(name="basemonth", required=false) String basemonth, 
			@RequestParam(name="startdate", required=false) String startdate,
			@RequestParam(name="enddate", required=false) String enddate,
			@RequestParam(name="paydate", required=false) String paydate, Model model) {
		
		if (basemonth != null) {
				List<SalaryDto> salaryDtoLists = salaryService.getSalaryDtoLists(basemonth, startdate, enddate, paydate);
				SalaryTableDto tableDto = new SalaryTableDto();
				tableDto.setSalaryDtoLists(salaryDtoLists);
				model.addAttribute("TableDto", tableDto);
		}
				
		return "salary/salarycalculate";
	}

	@GetMapping("/calculateDetail.json")     // 급여계산-사원별 상세 급여내역 
	@ResponseBody
	public SalaryDto calculateDetail(@RequestParam("empNo") int empNo, @RequestParam("basemonth") String basemonth) {
		SalaryDto salaryDto = salaryService.getCalculatedSalaryDto(empNo, basemonth);
		
		return salaryDto;
	}
	
	@GetMapping("/basicInfo.json")     // 급여계산-급여내역 없는 사원의 기본정보
	@ResponseBody
	public PayBankInfo basicInfo(@RequestParam("empNo") int empNo) {
		PayBankInfo payBankInfo = salaryService.getBasicSalaryInfo(empNo);
		
		return payBankInfo;
	}
	
	@GetMapping("/salarycheck")			// 급여조회
	public String salarycheck(@RequestParam(name="basemonth", required=false) String basemonth, 
			@RequestParam(name="opt", required=false) String opt, 
			@RequestParam(name="keyword", required=false) String keyword, Model model) {
		
		if (basemonth != null) {
			List<SalaryDto> salaryDtoLists = salaryService.getSalaryDtoLists(basemonth, opt, keyword);
			SalaryTableDto tableDto = new SalaryTableDto();
			tableDto.setSalaryDtoLists(salaryDtoLists);
			model.addAttribute("TableDto", tableDto);
		}	
		
		return "salary/salarycheck";
	}
	
	@GetMapping("/salaryDetail.json")     // 급여조회-사원별 상세 급여내역 
	@ResponseBody
	public SalaryDto salaryDetail(@RequestParam("empNo") int empNo, @RequestParam("paydate") String paydate) {
		SalaryDto salaryDto = salaryService.getSalaryDetailDto(empNo, paydate);
		
		return salaryDto;
	}
	
	@GetMapping("/salarybook")          // 급여대장
	public String salarybook(@RequestParam(name="basemonth", required=false) String basemonth, Model model) {
		
		if (basemonth != null) {
			List<SalaryDto> salaryDtoLists = salaryService.getSalaryDtoLists(basemonth);
			SalaryBookDto bookDto = new SalaryBookDto();
			bookDto.setSalaryDtoLists(salaryDtoLists);
			model.addAttribute("SalaryBookDto", bookDto);
		}
		
		return "salary/salarybook";
	}
	
}
