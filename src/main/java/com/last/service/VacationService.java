package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.mapper.VacationMapper;
import com.last.vo.VacationDay;
import com.last.vo.VacationItem;
import com.last.web.request.VacationItemRequest;

@Service
public class VacationService {
	
	@Autowired
	private VacationMapper vacationMapper;

	// 모든 휴가항목을 조회하는 서비스 메소드를 정의한다.
	public List<VacationItem> getAllItems() {
			return vacationMapper.getItems();
	}

	public VacationItem getItemCode(int code) {
		return vacationMapper.getItemByCode(code);
	}

	public void insertItem(VacationItem item) {
		System.out.println("서비스클래스: " + item.getName());
		vacationMapper.insertItem(item);
	}
  
	public void updateItem(VacationItem item) {
		vacationMapper.updateItem(item);
	}
	
	// 모든 근속연수별 휴가일수 조회
	public List<VacationDay> getYearVacationDay() {
		return vacationMapper.getYearVacationDay();
	}
	
	

}
