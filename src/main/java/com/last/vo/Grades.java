package com.last.vo;



import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("grades")
public class Grades {
	
	private int hobong_grade;
	private int hobong_amount;

}
