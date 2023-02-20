package com.last.web.contoller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("/salarycalculate")       // 급여계산결과 
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

	@GetMapping("/calculateDetail.json")     // 급여계산 - 사원별 상세 급여내역 
	@ResponseBody
	public SalaryDto calculateDetail(@RequestParam("empNo") int empNo, @RequestParam("basemonth") String basemonth) {
		SalaryDto salaryDto = salaryService.getCalculatedSalaryDto(empNo, basemonth);
		
		return salaryDto;
	}
	
	@GetMapping("/basicInfo.json")     // 급여계산 - 급여내역 없는 사원의 기본정보
	@ResponseBody
	public PayBankInfo basicInfo(@RequestParam("empNo") int empNo) {
		PayBankInfo payBankInfo = salaryService.getBasicSalaryInfo(empNo);
		
		return payBankInfo;
	}
	
	@PostMapping("/saveSalary")       // 급여계산 - 입력한 급여 저장 및 반영하기
	@ResponseBody
	public SalaryDto saveSalary(@RequestBody SalaryDto salaryDetail) {
		
		salaryService.saveSalary(salaryDetail);
		
		return salaryDetail;
	}
	
	@PutMapping("/updateSalary")     // 급여계산 - 입력된 급여 수정 및 반영하기
	@ResponseBody
	public SalaryDto updateSalary(@RequestBody SalaryDto salaryDetail) {
		
		salaryService.updateSalary(salaryDetail);
		
		return salaryDetail;
	}
	
	@GetMapping("/deleteSalary") 	 // 급여계산 - 삭제하기
	@ResponseBody
	public SalaryDto deleteSalary(@RequestParam("empNo") int empNo, @RequestParam("basemonth") String basemonth) {
		SalaryDto salaryDto = salaryService.deleteSalary(empNo, basemonth);
		
		return salaryDto;
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
	
	@GetMapping("/salaryperiod")      // 기간별 급여현황조회
	public String salaryperiod() {
		
		return "salary/salaryperiod";
	}
	
	@GetMapping("/national-pension")      // 국민연금 조회
	public String nationalPension() {
		
		return "salary/national-pension";
	}
	
	@GetMapping("/health-insurance")      // 건강보험 조회
	public String healthInsurance() {
		
		return "salary/health-insurance";
	}
	
	@GetMapping("/employment-insurance")      // 고용보험 조회
	public String employmentInsurance() {
		
		return "salary/employment-insurance";
	}
	
}
