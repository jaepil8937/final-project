package com.last.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.last.dto.CertificateDto;
import com.last.dto.CertificateIssueDto;
import com.last.dto.EmployeeDetailDto;
import com.last.dto.EmployeeDto;
import com.last.dto.EmployeebasicDto;
import com.last.dto.PersonnelDto;
import com.last.exception.ApplicationException;
import com.last.mapper.EmployeeMapper;
import com.last.vo.Department;
import com.last.vo.Employees;
import com.last.vo.Grades;
import com.last.vo.HrAppointment;
import com.last.vo.HrCertifcateRequest;
import com.last.vo.Position;
import com.last.web.request.CertificateRequest;
import com.last.web.request.EmployeeRegisterForm;
import com.last.web.request.EmployeeRequest;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<EmployeeDto> getAllEmployees(Map<String, Object> param) {
		return employeeMapper.getAllEmployees(param);
	}
	
	public Employees getAllEmployeebyNo(int no) {			// 사원번호로 직원정보 조회
		return employeeMapper.getAllEmployeebyNo(no);
	}
	
	public EmployeeDetailDto getAllEmployeeDetailDto(int no) {		// 사원명부/인사기록에서 사원번호를 통해 직원정보 상세조회
		return employeeMapper.getAllEmployeeDetailDto(no);
	}
	
	public List<PersonnelDto> getAllPersonnel(Map<String, Object> param) {
		return employeeMapper.getAllPersonnel(param);
	}
	
	public List<CertificateDto> getAllcertificate(Map<String, Object> param) {
		return employeeMapper.getAllCertificate(param);
	}
	
	public CertificateIssueDto getCertificateIssue(int no) {		// 증명서신청할때 사원번호를 통해 직원정보를 조회
		return employeeMapper.getCertificateIssue(no);
	}
	
	public List<EmployeeDto> getEmployee() { 
		return employeeMapper.getEmployee();
	}
	
	public void updatePersonnel(EmployeeRequest form) {		// 인사발령수정
		Employees employee = employeeMapper.getAllEmployeebyNo(form.getEmployeeNo());
		
		//BeanUtils.copyProperties(form, employee);
		
		if (form.getPositionNo() != 0) {
			employee.setPositionNo(form.getPositionNo());
		}
		if (form.getDeptNo() != 0) {
			employee.setDeptNo(form.getDeptNo());
		}
		employeeMapper.updateEmployees(employee);
		
		HrAppointment hrAppointment = employeeMapper.getAllAppointment(form.getEmployeeNo());
		
		//BeanUtils.copyProperties(form, hrAppointment);
		
		if (form.getType() != null) {
			hrAppointment.setType(form.getType());
		}
		if (form.getAppointmentDate() != null) {
			hrAppointment.setAppointmentDate(form.getAppointmentDate());
		}
		if (form.getContent() != null) {
			hrAppointment.setContent(form.getContent());
		}
		if (form.getNote() != null) {
			hrAppointment.setNote(form.getNote());
		}
		employeeMapper.updateAppointment(hrAppointment);
	}

	public void insertPersonnel(EmployeeRequest form) {		// 인사발령등록
		HrAppointment hrappointment = employeeMapper.getAllAppointment(form.getEmployeeNo());
		if (hrappointment != null) {
			employeeMapper.deleteAppointment(form.getEmployeeNo());
		}
		
		Employees employee = employeeMapper.getAllEmployeebyNo(form.getEmployeeNo());
		if (form.getPositionNo() != 0) {
			employee.setPositionNo(form.getPositionNo());
		}
		if (form.getDeptNo() != 0) {
			employee.setDeptNo(form.getDeptNo());
		}
		employeeMapper.updateEmployees(employee);
		
		HrAppointment hrAppointment = new HrAppointment();
		hrAppointment.setEmployeeNo(form.getEmployeeNo());
		hrAppointment.setType(form.getType());
		hrAppointment.setAppointmentDate(form.getAppointmentDate());
		hrAppointment.setContent(form.getContent());
		hrAppointment.setNote(form.getNote());
		employeeMapper.insertAppointment(hrAppointment);
		
	}
	
	public void insertCertificate(int no, CertificateRequest form) {	// 증명서신청 insert
		//HrCertifcateRequest hrcertificaterequest = employeeMapper.getAllCertficate(no);
		
		HrCertifcateRequest hrcertificaterequest = new HrCertifcateRequest();
		hrcertificaterequest.setNo(no);
		hrcertificaterequest.setType(form.getType());
		hrcertificaterequest.setPublishDate(form.getPublishDate());
		hrcertificaterequest.setRequestDate(form.getRequestDate());
		hrcertificaterequest.setStatus("대기");
		hrcertificaterequest.setPurpose(form.getPurpose());
		employeeMapper.insertCertificate(hrcertificaterequest);
	}
	
	public void approval(int no) {
		HrCertifcateRequest hrcertificaterequest = employeeMapper.getCertificatebyNo(no);
		hrcertificaterequest.setStatus("승인");
		employeeMapper.updateCertificatebyNo(hrcertificaterequest);
	}
	
	public void refer(int no) {
		HrCertifcateRequest hrcertificaterequest = employeeMapper.getCertificatebyNo(no);
		hrcertificaterequest.setStatus("반려");
		employeeMapper.updateCertificatebyNo(hrcertificaterequest);
	}
	
	public void deleteEmployee(int employeeNo, String password) {
		Employees employee = employeeMapper.getAllEmployeebyNo(employeeNo);
		if (employee == null) {
			throw new ApplicationException("사용자 정보가 존재하지 않아서 탈퇴처리할 수 없습니다.");
		}
		if ("Y".equals(employee.getEmployeeStatus())) {
			throw new ApplicationException("이미 탈퇴처리된 사용자입니다.");
		}
		if (!passwordEncoder.matches(password, employee.getPassword())) {
			throw new ApplicationException("비밀번호가 일치하지 않아서 탈퇴처리 할 수 없습니다.");
		}
		employee.setEmployeeStatus("Y");
		employeeMapper.updateEmployees(employee);
	}
	
	public void changePassword(int employeeNo, String oldPassword, String password) {
		Employees employee = employeeMapper.getAllEmployeebyNo(employeeNo);
		if (employee == null) {
			throw new ApplicationException("사용자 정보가 존재하지 않아서 비밀번호를 변경할 수 없습니다.");
		}
		if ("Y".equals(employee.getEmployeeStatus())) {
			throw new ApplicationException("이미 탈퇴처리된 사용자는 비밀번호를 변경할 수 없습니다.");
		}
		if (!passwordEncoder.matches(oldPassword, employee.getPassword())) {
			throw new ApplicationException("비밀번호가 일치하지 않아서 비밀번호를 변경할 수 없습니다.");
		}
		
		employee.setPassword(passwordEncoder.encode(password));
		employeeMapper.updateEmployees(employee);
	}
	
	public List<Position> getAllPosition() {
		return employeeMapper.getAllPosition();
	}
	public List<Department> getAllDepartment() {
		return employeeMapper.getAllDepartment();
	}
	public List<Employees> getAllEmployee(String status) {
		return employeeMapper.getAllEmployee(status);
	}
	public List<Grades> getAllGrade() {
		return employeeMapper.getAllGrade();
	}
	
	public void saveEmployee(EmployeeRegisterForm form) {
		Employees employees = new Employees();
		BeanUtils.copyProperties(form, employees);
		employees.setPassword(passwordEncoder.encode(employees.getPassword()));
		
		employeeMapper.insertEmployees(employees);
	}

	public Employees getEmployeesByNo(int empNo) {
		return employeeMapper.getEmployeesByNo(empNo);
	}
	
	public void updateEmployee(EmployeeRegisterForm form) {
		Employees employee = new Employees();
		BeanUtils.copyProperties(form, employee);
	}

	
	// 인사정보재등록 사원번호,이름,핸드폰번호,이메일
	public void reRegister(int employeeNo, String name, String tel, String email) {
		Employees employee = employeeMapper.getEmployeesByNo(employeeNo);
		employee.setName(name);
		employee.setMobileTel(tel);
		employee.setExtEmail(email);
		employee.setEmployeeStatus("N"); // 상태N으로 변경
		
		employeeMapper.updateEmployees(employee);
	}
		
			
		public void insertEmployees(List<Map<String, Object>> datas) {
			employeeMapper.insertEmployees(datas);
		}
			
		public List<Employees> getAllProducts() {
			return employeeMapper.getAllProducts();
		}
			
		public List<Map<String, Object>> getProducts() {
			return employeeMapper.getAllProductsForMap();
		}
		
	}

