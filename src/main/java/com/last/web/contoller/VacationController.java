package com.last.web.contoller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.last.service.VacationService;
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
	public String insert(VacationItemRequest form) {
		VacationItem item = new VacationItem();
		BeanUtils.copyProperties(form, item);
		vacationService.insertItem(item);
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
}
