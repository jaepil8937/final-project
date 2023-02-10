package com.last.web.contoller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.last.dto.EmployeeDto;
import com.last.service.EmployeeService;
import com.last.vo.Department;
import com.last.vo.Employees;
import com.last.vo.Grades;
import com.last.vo.Position;
import com.last.web.request.EmployeeRegisterForm;


@Controller
@RequestMapping("/hr")
public class HrController {
	
	private String directory = "C:\\app\\eGovFrameDev-4.0.0-64bit\\workspace\\final-project\\src\\main\\webapp\\resources\\images\\employee";

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

	
	@GetMapping("/register")     // 인사정보등록
	public String register(Model model) {
		List<Position> positions = employeeService.getAllPosition();
		List<Department> departments = employeeService.getAllDepartment();
		List<Employees> employees = employeeService.getAllEmployee();
		List<Grades> grades = employeeService.getAllGrade();

		model.addAttribute("positions", positions);
		model.addAttribute("departments", departments);
		model.addAttribute("employees", employees);
		model.addAttribute("grade", grades);
		return "hr/register";
	}



	@PostMapping("/register")
	public String registerform(EmployeeRegisterForm employeeRegisterForm) throws IOException {
		
		MultipartFile upfile = employeeRegisterForm.getFile1();
		if (!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			employeeRegisterForm.setPhoto(filename);
			
			FileCopyUtils.copy(upfile.getBytes(), new File(directory, filename));
		
		}
		employeeService.saveEmployee(employeeRegisterForm);

		return "hr/register";
	}
}



