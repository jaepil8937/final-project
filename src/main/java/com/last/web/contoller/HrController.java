package com.last.web.contoller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.last.dto.EmployeeDto;
import com.last.service.EmployeeService;
import com.last.web.request.EmployeeRegisterForm;


@Controller
@RequestMapping("/hr")
public class HrController {

	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("/info")		// 사원명부,인사기록카드
	public String info(Model model) {
		List<EmployeeDto> employees = employeeService.getAllEmployees();
		model.addAttribute("employees", employees);
		return "hr/employee-list";
	}
	
	@GetMapping("/personnel")	// 인사발령등록
	public String personnel() {
		
		return "hr/personnel";
	}
	
	@GetMapping("/issue")		// 증명서발급
	public String issue() {
		
		return "hr/certificate";
	}
	
	@GetMapping("/register")     // 인사정보등록
	public String register() {
		return "hr/register";
	}
	
	@GetMapping("/re-register")		// 인사정보재등록
	public String reregister() {
		return "hr/re-register";
	}
	
	@GetMapping("/family")			// 가족사항
	public String family() {
		return "hr/family";
	}
	
	@GetMapping("/education")		// 학력정보
	public String education() {
		return "hr/education";
	}
	
	@GetMapping("/order")			// 발령정보
	public String order() {
		return "hr/order";
	}
	
	@PostMapping("/register") // valid 유효성체크를 실행하게함, BindingResult 유효성검사결과가 저장되는 객체
	public String register(@ModelAttribute("userRegisterForm") @Valid EmployeeRegisterForm userRegisterForm) {
		return "redirect:registered";
	}
	
	// 회원가입 완료 화면 요청
		@GetMapping("/registered")
		public String success() {
			return "success";
		}
	
}
			
  

