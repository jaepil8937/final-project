package com.last.web.contoller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.last.service.VacationService;
import com.last.vo.VacationDay;
import com.last.vo.VacationItem;
import com.last.web.request.VacationItemRequest;

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
		param.put(opt, keyword);
		param.put("year", baseYear);
		
		return vacationService.getUsedVacations(param);
	}	
	
	@GetMapping("/calculate")
	public String calculate() {
		return "vacation/item-calculation";
	}
	
	@GetMapping("/calculate-days")
	@ResponseBody
	public List<VacationCalculateDto> calculatedVacation(@RequestParam("baseYear") int baseYear,
			@RequestParam("opt") String opt, @RequestParam("keyword") int keyword) {
		Calendar c1 = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		c1.set(baseYear, 11, 31);
		String baseDate = sdf.format(c1.getTime());
		
		Map<String, Object> param = new HashMap<>();
		param.put("baseYear", baseYear);
		param.put("empNo", keyword);
		param.put("baseDate", baseDate);
		
		return (List<VacationCalculateDto>) vacationService.calculatedVacation(param);
		
	}

	@GetMapping("/apply")
	public String apply() {
		return "vacation/item-apply";
	}	
	
	// 근속일수별 휴가설정
	@GetMapping("/year")
	public String yearVacationDay(Model model) {
		List<VacationDay> vacationDays = vacationService.getYearVacationDay();
		model.addAttribute("vacationDays", vacationDays);
		
		return "vacation/year-vacation";
	}
	
}
