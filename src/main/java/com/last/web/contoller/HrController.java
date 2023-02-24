package com.last.web.contoller;

import java.util.HashMap;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.last.dto.CertificateDto;
import com.last.dto.EmployeeDto;
import com.last.dto.EmployeebasicDto;
import com.last.dto.PersonnelDto;
import com.last.security.AuthenticatedUser;
import com.last.security.LoginEmployee;
import com.last.service.EducationService;
import com.last.service.EmployeeService;
import com.last.service.FamilyService;
import com.last.vo.Department;
import com.last.vo.Educations;
import com.last.vo.Employees;
import com.last.vo.Family;
import com.last.vo.Grades;
import com.last.vo.Position;
import com.last.web.request.EducationRegisterForm;
import com.last.web.request.EmployeeRegisterForm;
import com.last.web.request.EmployeeRequest;
import com.last.web.request.FamilyRegisterForm;


@Controller
@RequestMapping("/hr")
public class HrController {
	
	private String directory = "C:\\app\\eGovFrameDev-4.0.0-64bit\\workspace\\final-project\\src\\main\\webapp\\resources\\images\\employee";

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private EducationService educationService;
	@Autowired
	private FamilyService familyService;

	@GetMapping("/info")		// 사원명부,인사기록카드
	public String info(@RequestParam(name="sort", required = false, defaultValue="") String sort,
			@RequestParam(name = "keyword", required = false, defaultValue="") String keyword,
			@RequestParam(name = "status", required = false) String status,
			Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if (!sort.isEmpty() && !keyword.isEmpty()) {
			param.put("sort", sort);
			param.put("keyword", keyword);
		}
		
		if ("Y".equals(status)) {
			param.put("status", status);
		}
		
		List<EmployeeDto> employees = employeeService.getAllEmployees(param);
		model.addAttribute("employees", employees);
		return "hr/employee-list";
	}
	
	@GetMapping("/detail.json")
	@ResponseBody
	public Employees detail(@RequestParam(name="empNo") int empNo) {
		Employees employee = employeeService.getAllEmployeebyNo(empNo);
		return employee;
	}

	@GetMapping("/personnel")	// 인사발령등록
	public String personnel(@RequestParam(name = "sort", required = false, defaultValue = "") String sort,
							@RequestParam(name = "startDate", required = false, defaultValue = "") String startDate, 
							@RequestParam(name = "endDate", required = false, defaultValue = "") String endDate,
							Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if(!sort.isBlank()) {
			param.put("sort", sort);
		}
		if(!startDate.isBlank()) {
			param.put("startDate", startDate);
		}
		if(!endDate.isBlank()) {
			param.put("endDate", endDate);
		}
		
		List<PersonnelDto> personnel = employeeService.getAllPersonnel(param);
		model.addAttribute("personnels", personnel);
		return "hr/personnel";
	}
	
	@GetMapping("/personnel-register")		// 인사발령등록 폼에서 인사발령조회
	public String personnelRegister(Model model) {
		List<EmployeeDto> employee = employeeService.getEmployee();
		model.addAttribute("employees", employee);
		return "hr/personnel-register";
	}
	
	@PostMapping("/personnel-register")		// 인사발령등록 업데이트
	public String updatePersonnelRegister(EmployeeRequest form) {
		employeeService.updatePersonnel(form);
		return "redirect:personnel";
	}
	
	@GetMapping("/issue")		// 증명서발급
	public String issue(@RequestParam(name = "sort", required = false, defaultValue = "") String sort,
						@RequestParam(name = "startDate", required = false, defaultValue = "") String startDate,
						@RequestParam(name = "endDate", required = false, defaultValue = "") String endDate,
						Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if(!sort.isBlank()) {
			param.put("sort", sort);
		}
		if(!startDate.isBlank()) {
			param.put("startDate", startDate);
		}
		if(!endDate.isBlank()) {
			param.put("endDate", endDate);
		}
		
		List<CertificateDto> certificate = employeeService.getAllcertificate(param);
		model.addAttribute("certificates", certificate);
		return "hr/certificate";
	}

	@GetMapping("/delete")		// 회원탈퇴
	public String deleteform() {
		return "hr/delete-form";
	}
	
	@GetMapping("/password")		// 비밀번호 변경
	public String passwordChangeForm() {
		return "hr/password-form";
	}
	
	@GetMapping("/re-register")		// 인사정보재등록
	public String reregister(@AuthenticatedUser LoginEmployee LoginEmployee, Model model) {
		
		if ("ROLE_ADMIN".equals(LoginEmployee.getRoleName())) {
			List<Employees> employees = employeeService.getAllEmployee("Y");
			model.addAttribute("employees", employees);
		} else {
			Employees employees = employeeService.getEmployeesByNo(LoginEmployee.getNo());
			model.addAttribute("emp", employees);
		}
		
		return "hr/re-register";
	}
	
	
	@PostMapping("/re-register")		// 인사정보재등록
	public String infoRegister(@AuthenticatedUser LoginEmployee LoginEmployee, Model model) {
		
		
		
		return "redirect:/hr/re-register";
	}
	
	
	@GetMapping("/family")			// 가족사항
	public String family(@AuthenticatedUser LoginEmployee LoginEmployee, Model model) {
		List<Family> familys = familyService.getAllFamily(LoginEmployee.getNo());
		model.addAttribute("familys", familys);
		return "hr/family";
	}

	@GetMapping("/education")		// 학력정보
	public String education(@AuthenticatedUser LoginEmployee LoginEmployee, Model model) {
		List<Educations> educations = educationService.getAllEducations(LoginEmployee.getNo());
		model.addAttribute("educations", educations);
		return "hr/education";
	}

	@GetMapping("/order")			// 발령정보
	public String order() {
		return "hr/order";
	}

	
	@GetMapping("/register")     // 인사정보등록
	public String register(@AuthenticatedUser LoginEmployee LoginEmployee, Model model) {
		
		List<Position> positions = employeeService.getAllPosition();
		List<Department> departments = employeeService.getAllDepartment();
		List<Grades> grades = employeeService.getAllGrade();

		if ("ROLE_ADMIN".equals(LoginEmployee.getRoleName())) {
			List<Employees> employees = employeeService.getAllEmployee(null);
			model.addAttribute("employees", employees);
		} else {
			Employees employees = employeeService.getEmployeesByNo(LoginEmployee.getNo());
			model.addAttribute("emp", employees);
		}
	

		model.addAttribute("positions", positions);
		model.addAttribute("departments", departments);
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
	


	@PostMapping("/education")
	public String education(@AuthenticatedUser LoginEmployee loginEmployee, EducationRegisterForm educationRegisterForm) {
		// 저장작업
	
		educationService.insertEducation(loginEmployee.getNo(), educationRegisterForm) ; 
		return "redirect:/hr/education";
	}
	
	@GetMapping("/education/del")
	public String deleteEducation(@RequestParam("eduNo") List<Integer> educationNos) {
		educationService.deleteEducations(educationNos) ; 
		return "redirect:/hr/education";
	}

	@PostMapping("/family")
	public String family(@AuthenticatedUser LoginEmployee loginEmployee, FamilyRegisterForm familyRegisterForm) {
		
		familyService.insertFamily(loginEmployee.getNo(), familyRegisterForm);
		return "redirect:/hr/family";
	}
	
	@GetMapping("/family/del")
	public String deleteFamily(@RequestParam("familyNo") List<Integer> familyNos) {
		familyService.deleteFamily(familyNos) ; 
		return "redirect:/hr/family";
	}
	
	@PostMapping("/register/update")
	public String register(@ModelAttribute("Employee") EmployeeRegisterForm employeeRegisterForm) {
		employeeService.updateEmployee(employeeRegisterForm);
		
		return "redirect:/hr/register" ;
	}
}



