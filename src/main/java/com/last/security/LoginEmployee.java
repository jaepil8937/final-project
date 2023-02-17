package com.last.security;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginEmployee {

	private int no;
	private String name;
	private String encryptPassword;
	private String roleName;
}
