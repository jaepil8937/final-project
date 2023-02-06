package com.last.web.request;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VacationItemRequest {
	private List<Integer> code;		// 항목코드
	private List<String> name;	// 휴가명칭
	private List<String> used;	// 연차사용여부
	private List<String> deleted;	// 항목삭제여부
	private List<String> payed;	// 유급반영여부
	private List<String> note;	// 비고

}
