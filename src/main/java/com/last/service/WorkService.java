package com.last.service;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.WorkAdminAttendanceDto;
import com.last.mapper.WorkMapper;
import com.last.vo.WorkAttendance;
import com.last.web.request.WorkModifyForm;

@Service
public class WorkService {
	
	@Autowired
	private WorkMapper workMapper;
	
	// 출근시간등록
	public void addAttendance(int empNo) {
		workMapper.addAttendance(empNo);
	}
	
	// 퇴근시간등록
	public void endAttendance(int empNo) {
		WorkAttendance attendance = workMapper.getTodayStartAttendancedByEmpNo(empNo);
		
		int workHour = 0;
		int overHour = 0;
		int nightHour = 0;
		LocalDateTime now = LocalDateTime.now();
		int hour = now.getHour();
		if (hour < 18) {
			workHour = hour - 9 - 1;
			attendance.setAttendancesType("조퇴");
		} else if (hour < 19) {
			workHour = 8;
			attendance.setAttendancesType("정상");
		} else if (hour < 21) {
			workHour = 8;
			overHour = hour - 19;
			attendance.setAttendancesType("연장");
		} else {
			workHour = 8;
			overHour = 2;
			nightHour = hour - 21;
			attendance.setAttendancesType("야근");
		}
		
		attendance.setWorkedTimes(workHour);
		attendance.setOvertimeWorkedTimes(overHour);
		attendance.setNightWorkedTimes(nightHour);
		
		workMapper.endAttendance(attendance);
	}
	
	// 일일출근유무
	public boolean isStartAttendancedToday(int empNo) {
		WorkAttendance workAttendance = workMapper.getTodayStartAttendancedByEmpNo(empNo);
				return workAttendance != null;
	}
	
	// 일일퇴근유무
	public boolean isEndAttendancedToday(int empNo) {
		WorkAttendance workAttendance = workMapper.getTodayEndAttendancedByEmpNo(empNo);
		return workAttendance != null;
	}
	
	// 주간근태목록
	public List<WorkAttendance> getWeeklyAttendances(int empNo) {
		return workMapper.getWeeklyAttendancesByEmpNo(empNo);
	}
	
	// 전체근태목록
	public List<WorkAttendance> getAllAttendances(int empNo, String startDate, String endDate) {
		return workMapper.getAllAttendancesByDateRange(empNo, startDate, endDate);
	}

	// 사원들의 일일근태정보(관리자권한)
	public List<WorkAdminAttendanceDto> getAdminAttendances(int empNo) {
		return workMapper.getAdminAttendancesByEmpNo(empNo);
	}
	
	// 사원들의 일일근태정보(관리자권한)
	public WorkAdminAttendanceDto getAdminAttendance(int attendanceNo) {
		return workMapper.getAdminAttendanceByNo(attendanceNo);
	}

	public List<WorkAdminAttendanceDto> getAllAdminAttendances(Map<String, Object> param) {
		return workMapper.getAllAdminAttendancesByOptions(param);
	}

//	public void updateAttendance(WorkModifyForm workModifyForm) {
//		WorkAttendance workAttendance = new WorkAttendance();
//		BeanUtils.copyProperties(workModifyForm, workAttendance);
//		
//		workMapper.updateAttendance(workAttendance);
//		
//	}

}
