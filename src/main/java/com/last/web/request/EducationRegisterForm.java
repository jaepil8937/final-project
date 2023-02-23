package com.last.web.request;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EducationRegisterForm {

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date admissionDate;
	private String schoolName;
	private String magerDepartment;
	private String graduationType;
}
