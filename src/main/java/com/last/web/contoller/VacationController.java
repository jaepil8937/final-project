package com.last.web.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.dto.VacationCalculateDto;
import com.last.dto.VacationRequestDto;
import com.last.security.LoginEmployee;
import com.last.service.VacationService;
import com.last.vo.VacationDay;
import com.last.vo.VacationItem;
import com.last.web.request.VacationItemRequest;
import com.last.web.request.VacationRequestForm;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/vacation")
public class VacationController {
	
	private final VacationService vacationService;

	@GetMapping("/setting")
	public String setting(Model model) {
		List<VacationItem> items = vacationService.getAllItems();
		model.addAttribute("items", items);
		
		return "vacation/item-setting";
	}
	
	@PostMapping("/setting")
	@ResponseBody
	public Map<String, Object> savedItem(@RequestBody List<VacationItemRequest> forms) {
		vacationService.savedItem(forms);
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", "ok");
		return map;
	}
	
	@GetMapping("/used")
	public String used() {
		
		return "vacation/item-used";
	}	
	
	@GetMapping("/used-search")
	@ResponseBody
	public List<VacationRequestDto> searchUsed(@RequestParam("baseYear") int baseYear,
			@RequestParam("opt") String opt, @RequestParam("keyword") String keyword) {
		
		Map<String, Object> param = new HashMap<>();
		String status = "승인";
		param.put(opt, keyword);
		param.put("baseYear", baseYear);
		param.put("status", status);
		
		return vacationService.getUsedVacations(param);
	}	
	
	@GetMapping("/calculate")
	public String calculate() {
		return "vacation/item-calculation";
	}
	
	@GetMapping("/calculate-days")
	@ResponseBody
	public VacationCalculateDto calculatedVacation(@RequestParam("baseYear") int baseYear,
			@RequestParam("empNo") int empNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("baseYear", baseYear);
		param.put("empNo", empNo);
		
		return vacationService.calculatedVacation(param);
	}

	@GetMapping("/apply")
	public String apply(Model model) {
		List<VacationItem> items = vacationService.getAllItems();
		model.addAttribute("items", items);
		
		return "vacation/item-apply";
	}	
	
	@GetMapping("/apply-list")
	@ResponseBody
	public Map<String, Object> getVacationRequestList(@RequestParam("baseYear") int baseYear,
			@RequestParam("status") String status, @RequestParam("empNo") int empNo) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("baseYear", baseYear);
		param.put("empNo", empNo);
		param.put("status", status);
		
		VacationCalculateDto calculatedDays = vacationService.calculatedVacation(param);
		
		List<VacationRequestDto> usedVacationsList = vacationService.getUsedVacations(param);
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("calculatedDays", calculatedDays);
		
		if (!usedVacationsList.isEmpty()) {
			result.put("usedVacationsList", usedVacationsList);
		}
		
		return result;
	}
	
	@GetMapping("/apply-request-info")
	@ResponseBody
	public VacationRequestDto getVacationRequestInfo(@RequestParam("no") int no) {
		
		return vacationService.getVacationRequestInfoByNo(no);
	}
	
	@GetMapping("/approve")
	@ResponseBody
	public VacationRequestDto updateApprovalByNo(@RequestParam("no") int no) {
		return vacationService.updateStatusToApproval(no);
	}
	
	@GetMapping("/refusal")
	@ResponseBody
	public VacationRequestDto updateRefusalByNo(@RequestParam("no") int no) {
		return vacationService.updateStatusToRefusal(no);
	}
	

	@PostMapping("/insert-request")
	public String insertVacationRequest(@com.last.security.AuthenticatedUser LoginEmployee loginEmployee, VacationRequestForm form) {
		form.setEmpNo(loginEmployee.getNo());
		System.out.println(form.getEmpNo());
		vacationService.insertVacationRequest(form);
		
		return "redirect:apply";
	}
	
	@PostMapping("/modify-request")
	public String modifyVacationRequest(VacationRequestForm form) {
		vacationService.updateVacationRequest(form);
		
		return "redirect:apply";
	}
	
	@PostMapping("/cancel-request")
	public String cancelVacationRequest(VacationRequestForm form) {
		vacationService.cancelVacationRequest(form);
		
		return "redirect:apply";
	}
	
	
	// 근속일수별 휴가설정
	@GetMapping("/year")
	public String yearVacationDay(Model model) {
		List<VacationDay> vacationDays = vacationService.getYearVacationDay();
		model.addAttribute("vacationDays", vacationDays);
		
		return "vacation/year-vacation";
	}
	
	// 모든 근속연수별 휴가일수 행추가 
	@PostMapping("/add")
	@ResponseBody
	public VacationDay addVacationDay(@RequestParam("workedYear") int workedYear, @RequestParam("vacationDays") int vacationDays ) {
		VacationDay vacationDay = vacationService.addVacationDay(workedYear, vacationDays);
		
		return vacationDay;
	}
	
	// 모든 근속연수별 휴가일수 행삭제
	@GetMapping("/delete")
	public String removeVacationDay(@RequestParam("workedYear") List<Integer> years) {
		vacationService.removeVacationDay(years);
		
		return "redirect:/vacation/year";

	}
  
}
	
	
	
	
