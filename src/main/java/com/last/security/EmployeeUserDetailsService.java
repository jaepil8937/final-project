package com.last.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.last.mapper.EmployeeMapper;
import com.last.vo.Employees;

@Service
public class EmployeeUserDetailsService implements UserDetailsService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	@Override
	public UserDetails loadUserByUsername(String employeeNo) throws UsernameNotFoundException {
		Employees employees = employeeMapper.getEmployeesByNo(Integer.parseInt(employeeNo));
		if (employees == null) {
			throw new UsernameNotFoundException("직원정보가 존재하지 않습니다.");
		}
		
		EmployeeUserDetails userDetails = new EmployeeUserDetails();
		userDetails.setNo(employees.getEmployeeNo());
		userDetails.setEncryptPassword(employees.getPassword());
		userDetails.setName(employees.getName());
		userDetails.setRoleName(employees.getEmployeeRoleName());
		
		return userDetails;
	}
}
