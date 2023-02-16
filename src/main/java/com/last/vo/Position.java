package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Position")
public class Position {

	private int positionNo;
	private String positionName;
	private int positionSalary;
}
