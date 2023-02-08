package com.last.web.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		System.out.println("테스트");
		model.addAttribute("items", items);
		
		return "vacation/item-setting";
	}
	
	@PostMapping("/setting")
	public String im(List<VacationItemRequest> forms) {
		System.out.println("테스트2");
		for (VacationItemRequest form : forms) {
			if (vacationService.getItemCode(form.getCode()) != null) {
				vacationService.insertItem(form);
			} else {
				vacationService.updateItem(form);
			}
		}
		return "redirect:setting";
	};
	
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
	
	// 근속일수별 휴가설정
	@GetMapping("/year")
	public String yearVacationDay(Model model) {
		List<VacationDay> vacationDays = vacationService.getYearVacationDay();
		model.addAttribute("vacationDays", vacationDays);
		
		return "vacation/year-vacation";
	}
	
}
