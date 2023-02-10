package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.EmployeeDto;
import com.last.vo.Department;
import com.last.vo.Employees;
import com.last.vo.Grades;
import com.last.vo.Position;



@Mapper
public interface EmployeeMapper {

	List<EmployeeDto> getAllEmployees();
	
	List<Department> getAllDepartment();
	List<Position> getAllPosition();
	List<Employees> getAllEmployee();
	List<Grades> getAllGrade();
	
	void insertEmployees(Employees employees);
}

