package com.last.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("VacationItems")
@Getter
@Setter
public class VacationItem {
	private int code;		// 항목코드
	private String name;	// 휴가명칭
	private String used;	// 연차사용여부
	private String deleted;	// 항목삭제여부
	private String payed;	// 유급반영여부
	private String note;	// 비고
}
