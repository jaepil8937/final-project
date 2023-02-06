package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Grade")
public class PayGrade {

	private int grade;		// 호봉 등급
	private int amount;		// 호봉 금액
}
