package com.last.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.last.dto.VacationRequestDto;
import com.last.mapper.VacationMapper;
import com.last.vo.VacationDay;
import com.last.vo.VacationItem;
import com.last.web.request.VacationItemRequest;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VacationService {
	
	private final VacationMapper vacationMapper;

	// 모든 휴가항목을 조회하는 서비스 메소드를 정의한다.
	public List<VacationItem> getAllItems() {
		return vacationMapper.getItems();
	}

	public VacationItem getItemCode(int code) {
		return vacationMapper.getItemByCode(code);
	}

	public void insertItem(VacationItem item) {
		vacationMapper.insertItem(item);
	}
  
	public void updateItem(VacationItem item) {
		vacationMapper.updateItem(item);
	}
	
	// 모든 근속연수별 휴가일수 조회
	public List<VacationDay> getYearVacationDay() {
		return vacationMapper.getYearVacationDay();
	}
	
	

	public List<VacationRequestDto> getUsedVacations(Map<String, Object> param) {
		return vacationMapper.getUsedVacations(param);
	}
	
	public void savedItem(List<VacationItemRequest> forms) {
		for (VacationItemRequest form : forms) {
			VacationItem checkItem = getItemCode(form.getCode());
			
			VacationItem item = new VacationItem();
			BeanUtils.copyProperties(form, item);	
			if(checkItem != null) {
				updateItem(item);
			} else {
				insertItem(item);
			}
		}
	}
}
