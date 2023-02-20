package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.CertificateDto;
import com.last.dto.EmployeeDto;
import com.last.dto.EmployeebasicDto;
import com.last.dto.PersonnelDto;
import com.last.vo.Department;
import com.last.vo.Employees;
import com.last.vo.Grades;
import com.last.vo.HrAppointment;
import com.last.vo.HrCertifcateRequest;
import com.last.vo.Position;



@Mapper
public interface EmployeeMapper {


	List<EmployeeDto> getAllEmployees(Map<String, Object> param);
	List<PersonnelDto> getAllPersonnel(Map<String, Object> param);
	List<CertificateDto> getAllCertificate(Map<String, Object> param);
	List<EmployeeDto> getEmployee();
	
	Employees getAllEmployeebyNo(int no);
	HrAppointment getAllAppointment(int no);
	
	void updateEmployees(Employees employee);
	void updateAppointment(HrAppointment hrAppointment);
	void updateCertificateRequest(HrCertifcateRequest hrcertificaterequest);
	void updateDepartments(Department department);
	void updatePositions(Position position);
	
	
	List<Department> getAllDepartment();
	List<Position> getAllPosition();
	List<Employees> getAllEmployee();
	List<Grades> getAllGrade();
	
	void insertEmployees(Employees employees);
	Employees getEmployeesByNo(int employeeNo);


}

