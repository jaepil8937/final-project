package com.last.service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.WorkAdminAttendanceDto;
import com.last.mapper.WorkMapper;
import com.last.utils.Pagination;
import com.last.vo.WorkAttendance;
import com.last.web.request.WorkModifyForm;

@Service
public class WorkService {
	
	@Autowired
	private WorkMapper workMapper;
	
	// 출근시간등록
	public void addAttendance(int empNo) {
		WorkAttendance attendance = new WorkAttendance();
		attendance.setEmpNo(empNo);
		
		LocalDateTime now = LocalDateTime.now();		
		int hour = now.getHour();
		if (hour > 9) {
			attendance.setAttendancesType("지각1");
		} else {
			attendance.setAttendancesType("출근1");			
		}
		
		workMapper.addAttendance(attendance);
	}
	
	// 퇴근시간등록
	public void endAttendance(int empNo) {
		WorkAttendance attendance = workMapper.getTodayStartAttendancedByEmpNo(empNo);
		
		int workHour = 0;
		int overHour = 0;
		int nightHour = 0;
		LocalDateTime now = LocalDateTime.now();
		int nowHour = now.getHour();
		int startHour = Integer.parseInt(attendance.getStartWorkTime().substring(0,2)); 
			
		if (startHour < 9) {
			if (nowHour <= 13) {
				workHour = nowHour - 9 - overHour - nightHour;
				attendance.setAttendancesType("조퇴1");				// 점심시간(13시~14시) 전에 조퇴
			} else {
				workHour = nowHour - 9 - 1 - overHour -nightHour;
						if (nowHour < 18) {
							attendance.setAttendancesType("조퇴2");	// 점심시간 후에 조퇴
						} else {
							attendance.setAttendancesType("정상");	// 정상출근
			}
		}
	} else {
		if (nowHour <= 13) {	// 
			workHour = nowHour - startHour- overHour - nightHour; 
			attendance.setAttendancesType("지각/조퇴1");			// 지각 & 13시 이전에 조퇴
			
		} else {
			if (startHour <= 13 && nowHour < 18) {
				workHour = nowHour - startHour - 1 - overHour - nightHour; 
				attendance.setAttendancesType("지각/조퇴2");		// 13시 전에 지각 & 13시 지나서 조퇴
			} else {
				workHour = nowHour - startHour - overHour - nightHour;					// 13시 후에 출근지각 
				if (nowHour < 18) {
					attendance.setAttendancesType("지각/조퇴3");	// 13시 지나서 출근 & 18시 전에 조퇴
				}	else {
					attendance.setAttendancesType("지각2");		// 13시 전에 지각 & 18시 이후에 퇴근
				}
			}
		}
	}
	
	// 연장, 야근시간계산 수정중
	if (nowHour > 19) {
		overHour = nowHour - 19;
		attendance.setAttendancesType("연장3");
	}
	if (nowHour > 21) {
		nightHour = nowHour - 21;
		attendance.setAttendancesType("야근3");
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

	public List<WorkAdminAttendanceDto> getAdminAttendances(int empNo) {
		return workMapper.getAdminAttendancesByEmpNo(empNo);
	}
	
	// 사원들의 일일근태정보(관리자권한)
	public WorkAdminAttendanceDto getAdminAttendance(int attendanceNo) {
		return workMapper.getAdminAttendanceByNo(attendanceNo);
	}

	public Map<String, Object> getAllAdminAttendances(Map<String, Object> param) {
		
		int page = (Integer) param.get("page");
		int totalRows = workMapper.getTotalRows(param);
		Pagination pagination = new Pagination(page, totalRows);
		
		param.put("begin", pagination.getBegin());
		param.put("end", pagination.getEnd());
		
		List<WorkAdminAttendanceDto> adminAttendanceDtos = workMapper.getAllAdminAttendancesByOptions(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("adminAttendanceDtos", adminAttendanceDtos);
		result.put("pagination", pagination);
		
		return result;
		
	}

	

//	public void updateAttendance(WorkModifyForm workModifyForm) {
//		WorkAttendance workAttendance = new WorkAttendance();
//		BeanUtils.copyProperties(workModifyForm, workAttendance);
//		
//		workMapper.updateAttendance(workAttendance);
//		
//	}

}
