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
import com.last.dto.EmployeeDto;
import com.last.dto.EmployeebasicDto;
import com.last.dto.PersonnelDto;
import com.last.mapper.EmployeeMapper;
import com.last.vo.Department;
import com.last.vo.Employees;
import com.last.vo.Grades;
import com.last.vo.HrAppointment;
import com.last.vo.Position;
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
	
	public void updatePersonnel(EmployeeRequest form) {
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

	
	
}
