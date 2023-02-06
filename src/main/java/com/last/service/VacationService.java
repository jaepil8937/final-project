package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.mapper.VacationMapper;
import com.last.vo.VacationItems;

@Service
public class VacationService {
	
	@Autowired
	private VacationMapper vacationMapper;

	// 모든 휴가항목을 조회하는 서비스 메소드를 정의한다.
	public List<VacationItems> getAllItems() {
			return vacationMapper.getItems();
	}

}
