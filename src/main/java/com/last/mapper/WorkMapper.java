package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.last.dto.WorkAdminAttendanceDto;
import com.last.vo.WorkAttendance;

@Mapper
public interface WorkMapper {

	// 출근시간등록
	void addAttendance(int empNo);
	// 퇴근시간등록
	void endAttendance(WorkAttendance attendance);
	
	// 일일출근등록
	WorkAttendance getTodayStartAttendancedByEmpNo(int empNo);
	// 일일퇴근등록
	WorkAttendance getTodayEndAttendancedByEmpNo(int empNo);
	
	// 주간근태목록
	List<WorkAttendance> getWeeklyAttendancesByEmpNo(int empNo);
	
	// 전체근무시간조회
	List<WorkAttendance> getAllAttendancesByDateRange(@Param("empNo") int empNo, @Param("startDate") String startDate, @Param("endDate") String endDate);
	
	// 사원들의 일일근태정보(관리자권한)
	List<WorkAdminAttendanceDto> getAdminAttendancesByEmpNo(int empNo);
	WorkAdminAttendanceDto getAdminAttendanceByNo(int attendanceNo);
	
	List<WorkAdminAttendanceDto> getAllAdminAttendancesByOptions(Map<String, Object> param);
	
//	void updateAttendance(WorkAttendance workAttendance);
	WorkAdminAttendanceDto updateAttendanceByNo(int attendanceNo);
	
}
