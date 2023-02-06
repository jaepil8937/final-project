package com.last.web.request;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VacationItemRequest {
	private int code;		// 항목코드
	private String name;	// 휴가명칭
	private String used;	// 연차사용여부
	private String deleted;	// 항목삭제여부
	private String payed;	// 유급반영여부
	private String note;	// 비고

}
