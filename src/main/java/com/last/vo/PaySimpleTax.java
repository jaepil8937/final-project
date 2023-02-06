package com.last.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("SimpleTax")
public class PaySimpleTax {

	private int year;			// 기준년도
	private int minSalary;		// 금액미만
	private int maxSalary;		// 금액이상
	private int familyCount;	// 가족수
}
