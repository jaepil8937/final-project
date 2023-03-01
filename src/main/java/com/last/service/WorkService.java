package com.last.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.WorkDaysSummaryDto;
import com.last.dto.MonthlyAttendanceDto;
import com.last.dto.WorkAdminAttendanceDto;
import com.last.dto.WorkTimesSummaryDto;
import com.last.mapper.WorkMapper;
import com.last.utils.Pagination;
import com.last.vo.WorkAttendance;

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
			attendance.setAttendancesType("지각");
		} else {
			attendance.setAttendancesType("출근");			
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
				attendance.setAttendancesType("조퇴");		// 점심시간(13시~14시) 전에 조퇴
			} else {
				workHour = nowHour - 9 - 1 - overHour -nightHour;
				if (nowHour < 18) {
					attendance.setAttendancesType("조퇴");	// 점심시간 후에 조퇴
				} else {
					attendance.setAttendancesType("정상");	// 정상출근
				}
			}
		} else {
			if (nowHour <= 13) {	// 
				workHour = nowHour - startHour- overHour - nightHour; 
				attendance.setAttendancesType("지각/조퇴");			// 지각 & 13시 이전에 조퇴

			} else {
				if (startHour <= 13 && nowHour < 18) {
					workHour = nowHour - startHour - 1 - overHour - nightHour; 
					attendance.setAttendancesType("지각/조퇴");		// 13시 전 지각 & 13시 이후 조퇴
				} else {
					workHour = nowHour - startHour - overHour - nightHour;	// 13시 후 출근지각 
					if (nowHour < 18) {
						attendance.setAttendancesType("지각/조퇴");	// 13시 지나서 출근 & 18시 전 조퇴
					}	else {
						attendance.setAttendancesType("지각");		// 13시 전 지각 & 18시 이후 퇴근
					}
				}
			}
		}

		// 연장, 야근시간계산 수정중
		if (nowHour < 21 && nowHour > 19) {
			overHour = nowHour - 18;
			attendance.setAttendancesType("연장");
		}
		if (nowHour > 19 && nowHour > 21) {
			nightHour = nowHour - 21;
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
	
	// 일일근태관리에 근태정보 불러오기
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

	// 근태시간수정
	public void updateAttendance(int attendanceNo, String startTime, String endTime) {
		
		// WorkAdminAttendanceDto의 db에 저장된 값을 WorkAttendance객체에 복사하여 근태기록정보를 저장
		WorkAdminAttendanceDto dto = workMapper.getAttendanceByNo(attendanceNo); //attendanceNo에 해당하는 근태기록을 가져와서 WorkAdminAttendanceDto에 반환
		WorkAttendance attendance = new WorkAttendance();	//근태구분정보를 담을 attendance객체를 생성
		BeanUtils.copyProperties(dto, attendance);			//이름이 같은 필드값인 dto객체의 값을 attendance객체에 복사함

		int workHour = 0;
		int overHour = 0;
		int nightHour = 0;

		int startHour = Integer.parseInt(startTime.substring(0,2)); 
		int endHour = Integer.parseInt(endTime.substring(0,2)); 
		
		if (startHour < 9) {
			if (endHour <= 13) {
				workHour = endHour - 9 - overHour - nightHour;
				attendance.setAttendancesType("조퇴");	// 점심시간(13시~14시) 전에 조퇴
			} else {
				workHour = endHour - 9 - 1 - overHour -nightHour;
				if (endHour < 18) {
					attendance.setAttendancesType("조퇴");	// 점심시간 후에 조퇴
				} else {
					attendance.setAttendancesType("정상");	// 정상출근
				}
			}
		} else {
			if (endHour <= 13) {	// 
				workHour = endHour - startHour - overHour - nightHour; 
				attendance.setAttendancesType("지각/조퇴");	// 지각 & 13시 이전에 조퇴

			} else {
				if (startHour <= 13 && endHour < 18) {
					workHour = endHour - startHour - 1 - overHour - nightHour; 
					attendance.setAttendancesType("지각/조퇴");	// 13시 전에 지각 & 13시 지나서 조퇴
				} else {
					workHour = endHour - startHour - overHour - nightHour;	// 13시 후에 출근지각 
					if (endHour < 18) {
						attendance.setAttendancesType("지각/조퇴");	// 13시 지나서 출근 & 18시 전에 조퇴
					}	else {
						attendance.setAttendancesType("지각");	// 13시 전에 지각 & 18시 이후에 퇴근
					}
				}
			}
		}

		// 연장, 야근시간계산 둘다 입력되도록 수정하기
		if (endHour >= 19 && endHour <= 21) {
			overHour = endHour - 18;
			attendance.setAttendancesType("연장");
		}
		
		if (endHour >= 21 && endHour <= 24) {
			nightHour = endHour - 21;
			attendance.setAttendancesType("야근");
		}

		attendance.setStartWorkTime(startTime);
		attendance.setEndWorkTime(endTime);
		attendance.setWorkedTimes(workHour);
		attendance.setOvertimeWorkedTimes(overHour);
		attendance.setNightWorkedTimes(nightHour);

		workMapper.updateAttendance(attendance);
	}

	// 월근태 사원목록을 가져옴
	public List<MonthlyAttendanceDto> getEmployees() {
		return workMapper.getEmployees();
	}

	// 월근태일수
	public WorkDaysSummaryDto getMonthlyWorkDaysSummary(String yearMonth, int employeeNo) {
		WorkDaysSummaryDto dto = workMapper.getMonthlyWorkDaysSummary(yearMonth, employeeNo);
		return dto;
	}

	// 월근태시간
	public WorkTimesSummaryDto getMonthlyWorkTimesSummary(String yearMonth, int employeeNo) {
		WorkTimesSummaryDto dto = workMapper.getMonthlyWorkTimesSummary(yearMonth, employeeNo);
		return dto;
	}

}
