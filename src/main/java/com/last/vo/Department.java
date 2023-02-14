package com.last.vo;



import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Department")
public class Department {
	
	private int deptNo;			// 부서번호
	private String deptName;	// 부서이름

}
