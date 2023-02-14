package com.last.web.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.service.VacationService;
import com.last.vo.VacationDay;
import com.last.vo.VacationItem;
import com.last.web.request.VacationItemRequest;


@Controller
@RequestMapping("/vacation")
public class VacationController {
	
	@Autowired
	private VacationService vacationService;

	@GetMapping("/setting")
	public String setting(Model model) {
		List<VacationItem> items = vacationService.getAllItems();
		model.addAttribute("items", items);
		
		return "vacation/item-setting";
	}
	
	@PostMapping("/setting")
	@ResponseBody
	public Map insert(@RequestBody List<VacationItemRequest> forms) {
		for (VacationItemRequest form : forms) {
			VacationItem checkItem = vacationService.getItemCode(form.getCode());
			
			if(checkItem != null) {
				VacationItem item = new VacationItem();
				BeanUtils.copyProperties(form, item);	
				vacationService.updateItem(item);
			} else {
				VacationItem item = new VacationItem();
				BeanUtils.copyProperties(form, item);	
				vacationService.insertItem(item);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "ok");
		return map;

	}
	
	@GetMapping("/used")
	public String used() {
		return "vacation/item-used";
	}	
	
	@GetMapping("/calculation")
	public String calculation() {
		return "vacation/item-calculation";
	}

	@GetMapping("/apply")
	public String apply() {
		return "vacation/item-apply";
	}	
	
	// 근속일수별 휴가일수 조회
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
