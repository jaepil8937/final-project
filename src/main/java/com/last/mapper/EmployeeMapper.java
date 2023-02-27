package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.last.dto.CertificateDto;
import com.last.dto.CertificateIssueDto;
import com.last.dto.EmployeeDetailDto;
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
	CertificateIssueDto getCertificateIssue(int no);	// 증명서신청서에 내 정보 불러오기
	
	EmployeeDetailDto getAllEmployeeDetailDto(int no);		// 사원명부/인사기록에서 사원번호를 통해 직원정보 상세조회
	
	Employees getAllEmployeebyNo(int no);
	HrAppointment getAllAppointment(int no);
	void deleteAppointment(int no);				// 인사발령등록시 이미 있는 사원번호면 삭제하고 재등록
	
	void updateEmployees(Employees employee);
	void updateAppointment(HrAppointment hrAppointment);
	void updateCertificateRequest(HrCertifcateRequest hrcertificaterequest);
	void updateDepartments(Department department);
	void updatePositions(Position position);
	
	void insertPositions(Position position);
	void insertDepartments(Department department);
	void insertAppointment(HrAppointment hrAppointment);
	
	
	List<Department> getAllDepartment();
	List<Position> getAllPosition();
	
	List<Employees> getAllEmployee(@Param("status") String status);
	
	
	List<Grades> getAllGrade();
	
	void insertEmployees(Employees employees);
	Employees getEmployeesByNo(int employeeNo);
	
	void infoRegister(Employees employees);

	List<Employees> getAllProducts();
	List<Map<String, Object>> getAllProductsForMap();
	void insertEmployees(@Param("employee") List<Map<String, Object>> employees);
}

