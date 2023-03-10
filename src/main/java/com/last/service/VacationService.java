package com.last.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.last.dto.VacationCalculateDto;
import com.last.dto.VacationRequestDto;
import com.last.mapper.VacationMapper;
import com.last.vo.VacationDay;
import com.last.vo.VacationItem;
import com.last.vo.VacationRequest;
import com.last.web.request.VacationItemRequest;
import com.last.web.request.VacationRequestForm;

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

	public VacationCalculateDto calculatedVacation(Map<String, Object> param) {
		int baseYear = (int) param.get("baseYear");
		
		Calendar c1 = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		c1.set(baseYear, 11, 31);
		String baseDate = sdf.format(c1.getTime());
		
		param.put("baseDate", baseDate);
		
		// 근속년수 계산
		int workedYears = vacationMapper.getWorkedYears(param);
		if (workedYears < 0) {
			return null;
		}
		param.put("workedYears", workedYears);
		// 연차개수 계산
		int vacationDays;
		if (workedYears == 0) {
			vacationDays = vacationMapper.getVacationCountBy0(param);
		} else if (workedYears == 1) {
			vacationDays = vacationMapper.getVacationCountBy1(param);
		} else {
			vacationDays = vacationMapper.getVacationCount(param);
		}
		param.put("vacationDays", vacationDays);
		// 사용일수 계산
		int usedDays = vacationMapper.getYearVacationUsedDays(param);
		param.put("usedDays", usedDays);
		// 잔여일수 계산
		int remainedDays = vacationDays - usedDays;
		param.put("remainedDays", remainedDays);
		
		// 데이터가 존재하는지 확인 
		VacationCalculateDto dto = getCalculatedDays(param);
		if (dto != null) {
			vacationMapper.updateCalculatedDays(param);
		} else {
		// 휴가일수 데이터 생성
		vacationMapper.insertCalculatedDays(param);
		// 조회
		}
		return getCalculatedDays(param);
		
	}

	public VacationCalculateDto getCalculatedDays(Map<String, Object> param) {
		return vacationMapper.getCalculatedDays(param); 
	}

	public VacationRequestDto getVacationRequestInfoByNo(int no) {
		return vacationMapper.getVacationRequestInfoByNo(no);
	}

	
	public VacationRequestDto updateStatusToApproval(int no) {
		VacationRequestDto dto = getVacationRequestInfoByNo(no);
		dto.setStatus("승인");
		vacationMapper.updateStatus(dto);
		
		return dto;
	}	

	public VacationRequestDto updateStatusToRefusal(int no) {
		VacationRequestDto dto = getVacationRequestInfoByNo(no);
		dto.setStatus("반려");
		vacationMapper.updateStatus(dto);
		
		return dto;
	}
	
	public void insertVacationRequest(VacationRequestForm form) {
		VacationRequest request = new VacationRequest();
		BeanUtils.copyProperties(form, request);
		
		vacationMapper.insertVacationRequest(request);
	}	
  
	public void updateVacationRequest(VacationRequestForm form) {
		VacationRequest request = new VacationRequest();
		BeanUtils.copyProperties(form, request);
		
		request.setStatus("대기");
		
		vacationMapper.updateVacationRequest(request);
	}	
	
	public void cancelVacationRequest(VacationRequestForm form) {
		VacationRequest request = new VacationRequest();
		BeanUtils.copyProperties(form, request);
		
		request.setStatus("취소");
		
		vacationMapper.cancelVacationRequest(request);
	}
	
    // 모든 근속연수별 휴가일수 조회
	public List<VacationDay> getYearVacationDay() {
		
		return vacationMapper.getYearVacationDay();
	}
	
	// 근속연수별 휴가일수 행추가 
	public VacationDay addVacationDay(int workedYear, int vacationDays) {
		VacationDay vacationDay = new VacationDay();
		vacationDay.setWorkedYear(workedYear);
		vacationDay.setVacationDays(vacationDays);
		
		vacationMapper.insertYearVacationDay(vacationDay);
		
		return vacationDay;
	}

	// 근속연수별 휴가일수 행삭제
	public void removeVacationDay(List<Integer> years) {
		for (int year : years) {
			vacationMapper.deleteYearVacationDay(year);
		}
	}
}
