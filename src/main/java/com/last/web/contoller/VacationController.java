package com.last.web.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.dto.VacationRequestDto;
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
	@ResponseBody
	public Map<String, Object> insert(@RequestBody List<VacationItemRequest> forms) {
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

	};
	
	@GetMapping("/used")
	public String used() {
		
		return "vacation/item-used";
	}	
	
	@GetMapping("/used-search")
	@ResponseBody
	public List<VacationRequestDto> usedSearch(@RequestParam("baseYear") int baseYear,
			@RequestParam("opt") String opt, @RequestParam("keyword") String keyword) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(opt, keyword);
		param.put("year", baseYear);
		
		return vacationService.getUsedVacations(param);
	}	
	
	@GetMapping("/calculation")
	public String calculation() {
		return "vacation/item-calculation";
	}

	@GetMapping("/apply")
	public String apply() {
		return "vacation/item-apply";
	}	
	
	@GetMapping("/year")
	public String yearVacationDay() {
		return "vacation/year-vacation";
	}
}
