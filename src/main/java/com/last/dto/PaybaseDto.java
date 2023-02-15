package com.last.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PaybaseDto {

	private int no;
	private String name;
	private int positionNo;
	private String positionName;
	private int deptNo;
	private String deptName;
	private Date hireDate;
	private String tel;
	private String email;
}
