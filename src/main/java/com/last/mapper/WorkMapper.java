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
	void addAttendance(WorkAttendance attendance);
	// 퇴근시간등록
	void endAttendance(WorkAttendance attendance);
	
	// 일일출근등록
	WorkAttendance getTodayStartAttendancedByEmpNo(int empNo);
	// 일일퇴근등록
	WorkAttendance getTodayEndAttendancedByEmpNo(int empNo);
	
	// 주간근태목록
	List<WorkAttendance> getWeeklyAttendancesByEmpNo(int empNo);
	
	List<WorkAttendance> getAllAttendancesByEmpNo(int empNo);
	
	// 전체근무시간조회
	List<WorkAttendance> getAllAttendancesByDateRange(@Param("empNo") int empNo, @Param("startDate") String startDate, @Param("endDate") String endDate);
	
	// 사원들의 일일근태정보(관리자권한)
	List<WorkAdminAttendanceDto> getAdminAttendancesByEmpNo(int empNo);
	
	// 근태번호로 근태정보 받아오기
	WorkAdminAttendanceDto getAdminAttendanceByNo(int attendanceNo);
	
	List<WorkAdminAttendanceDto> getAllAdminAttendancesByOptions(Map<String, Object> param);
	
	int getTotalRows(Map<String, Object> param);
	
	WorkAdminAttendanceDto getAttendanceByNo(int attendanceNo);
	
	void updateAttendance(WorkAttendance workAttendance);
}
