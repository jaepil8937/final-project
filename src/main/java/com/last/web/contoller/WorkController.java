package com.last.web.contoller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.last.dto.WorkAdminAttendanceDto;
import com.last.service.WorkService;
import com.last.vo.WorkAttendance;
import com.last.web.request.WorkModifyForm;

@Controller
@RequestMapping("/work")
@SessionAttributes({"modifyAttendance"})
public class WorkController {
	
	@Autowired(required=true)
	private WorkService workService;
	
	// 일일근태등록페이지
	@GetMapping("/day")
	public String dailyAttendance(Model model) {
		
		int empNo = 1001;
		// 이번 주 출퇴근 정보 조회
		List<WorkAttendance> attendances = workService.getWeeklyAttendances(empNo);
		model.addAttribute("attendances", attendances);
		
		// 일일출퇴근여부를 판단
		boolean isStartAttendanced = workService.isStartAttendancedToday(empNo);
		boolean isEndAttendanced = workService.isEndAttendancedToday(empNo);
		
		model.addAttribute("isStartAttendanced", isStartAttendanced);
		model.addAttribute("isEndAttendanced", isEndAttendanced);
		
		return "work/daily-attendance"; // WEB-INF/views/work/daily-attendance.jsp로 내부 이동
	}
	

	// 출근시간등록
	@GetMapping("/startAttendance")
	public String startAttendance() {
		int empNo = 1001;
		workService.addAttendance(empNo);
		
		return "redirect:/work/day"; // 저장작업했기 때문에 재요청 URL을 전송
	}
	
	// 퇴근시간등록
	@GetMapping("/endAttendance")
	public String endAttendance() {
		int empNo = 1001;
		workService.endAttendance(empNo);
		
		return "redirect:/work/day";
	}
	
	// 근태정보 기간으로 조회, startDate와endDate의 값을 전달해줌
	@GetMapping("/searchAttendances")
	public String getAttendanceList(@RequestParam("startDate") String startDate,
									@RequestParam("endDate") String endDate, Model model) {
		int empNo = 1001;
		List<WorkAttendance> attendances = workService.getAllAttendances(empNo, startDate, endDate);
		model.addAttribute("attendances", attendances);
		
		boolean isStartAttendanced = workService.isStartAttendancedToday(empNo);
		boolean isEndAttendanced = workService.isEndAttendancedToday(empNo);
		
		model.addAttribute("isStartAttendanced", isStartAttendanced);
		model.addAttribute("isEndAttendanced", isEndAttendanced);
		
		return "work/daily-attendance";	// WEB-INF/views/work/daily-attendance.jsp로 내부 이동
	}
	
	// 관리자일일근태페이지 기본화면
	@GetMapping("/dayadmin")
	public String getAdminAttendanceList(@RequestParam(name = "startDate", required = false, defaultValue = "") String startDate, //required = false 값이 안담겨도 조회될 수 있음
			@RequestParam(name = "endDate", required = false, defaultValue = "") String endDate,
			@RequestParam(name = "empNo", required = false, defaultValue = "0") int empNo,
			@RequestParam(name = "positionNo", required = false, defaultValue = "0") int positionNo,
			@RequestParam(name = "deptNo", required = false, defaultValue = "0") int deptNo, Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if (!startDate.isBlank()) {
			param.put("startDate", startDate);
		}
		if (!endDate.isBlank()) {
			param.put("endDate", endDate);
		}
		if (empNo > 0) {
			param.put("empNo", empNo);
		}
		if (positionNo > 0) {
			param.put("positionNo", positionNo);
		}
		if (deptNo > 0) {
			param.put("deptNo", deptNo);
		}
		
		
		List<WorkAdminAttendanceDto> adminAttendanceDtos = workService.getAllAdminAttendances(param);
		model.addAttribute("adminAttendanceDtos", adminAttendanceDtos);
		
		return "work/daily-manage";
	}
	
//	@GetMapping("/modify")
//	public String modifyAttendanceForm(@RequestParam("no") int attendanceNo, Model model) {
//		
//		WorkAdminAttendanceDto dto = workService.getAdminAttendance(attendanceNo);
//		WorkModifyForm form = new WorkModifyForm();
//		BeanUtils.copyProperties(dto, form);
//		model.addAttribute("modifyAttendance", form);
//		
//		return "work/modify-attendance";
//	}
	
//	@PostMapping("/modify")
//	public String modifyAttendance(@RequestParam("no") int attendanceNo, 
//			@RequestParam("startWorkTime") String startTime,
//			@RequestParam("endWorkTime") String endTime) {
//		
//		workService.updateAttendance(attendanceNo, startTime, endTime);
//		
//		return "redirect:/work/dayadmin";
//	}
	
	// 월근태현황
	@GetMapping("/monthstatus")
	public String monthStatus() {
		return "work/monthly-status";
	}
	
	// 월근태상세정보관리
	@GetMapping("/month")
	public String monthSetting() {
		return "work/monthly-manage";
	}
}
