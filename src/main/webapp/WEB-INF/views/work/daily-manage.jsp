<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="work" />
<c:set var="side" value="daily-manage" />
<%@ include file="../common/navbar.jsp" %>
<div class="container my-3">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
					<h2>일일근태관리</h2>
			</div>
			<hr>
			<form  mehod="get" action="/work/dayadmin" id="form-search">
				<div class="row mb-3 p-4 bg-light">
					<div>
						<label class="form-label"><strong>근무일자: </strong></label>
						<input autocomplete="off" type="date" name="startDate" id="start-cal" value="${param.startDate }" style="text-align:center; width:130px" /> 
						~ <input autocomplete="off" type="date" name="endDate" id="end-cal" value="${param.endDate }" style="text-align:center; width:130px" />
						<label class="form-label"><strong>사원번호: </strong></label>
						<input type="text" name="empNo" value="${param.empNo }" style="text-align:center; width:100px" />
						<label class="form-label"><strong>직급: </strong></label>
						<select id="positionNo" name="positionNo" style="width: 100px" >
							<option value="">선택하세요</option>
							<option value="1" ${param.positionNo eq '1' ? 'selected' : '' }>사원</option>
					        <option value="2" ${param.positionNo eq '2' ? 'selected' : '' }>대리</option>
							<option value="3" ${param.positionNo eq '3' ? 'selected' : '' }>과장</option>
							<option value="4" ${param.positionNo eq '4' ? 'selected' : '' }>차장</option>
							<option value="5" ${param.positionNo eq '5' ? 'selected' : '' }>부장</option>
							<option value="6" ${param.positionNo eq '6' ? 'selected' : '' }>사장</option>
						</select>
						<label class="form-label"><strong>부서: </strong></label>
						<select name="deptNo" style="width: 100px" >
							<option value="">선택하세요</option>
							<option value="100" ${param.deptNo eq '100' ? 'selected' : '' }>기획팀</option>
							<option value="101" ${param.deptNo eq '101' ? 'selected' : '' }>설계팀</option>
							<option value="102" ${param.deptNo eq '102' ? 'selected' : '' }>분석팀</option>
							<option value="103" ${param.deptNo eq '103' ? 'selected' : '' }>디자인팀</option>
							<option value="104" ${param.deptNo eq '104' ? 'selected' : '' }>개발팀</option>
							<option value="105" ${param.deptNo eq '105' ? 'selected' : '' }>테스트팀</option>
							<option value="106" ${param.deptNo eq '106' ? 'selected' : '' }>운영팀</option>
						</select>
						<button type="button" class="btn btn-danger" style="float:right;" id="btn-search">조회</button>
					</div>
				</div>	
			</form>

			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>일일근태현황</strong>
					</p>
				</div>
			</div>
		<div class="col-12 text-end">
			<button   class="btn btn-secondary btn-sm" id="btn-down-xls">근태엑셀다운로드</button>
		</div>
		<div class="row" style="width: 100%; overflow: auto;">
			<table class="table table-bordered table-hover table-striped table-sm" id="table-daily-attendance" style="white-space: nowrap;">
				<colgroup>
					<col width="14%">
					<col width="8%">
					<col width="7%">
					<col width="7%">
					<col width="7%">
					<col width="8%">
					<col width="8%">
					<col width="8%">
					<col width="8%">
					<col width="8%">
					<col width="8%">
					<col width="8%">
					<col width="3%">
				</colgroup>
			  	<thead>
				    <tr class="text-center">
				      <th>근무일자</th>
				      <th>사원번호</th>
				      <th>성명</th>
				      <th>직급</th>
				      <th>부서</th>
				      <th>근태구분</th>
				      <th>출근시간</th>
				      <th>퇴근시간</th>
				      <th>근무시간</th>
				      <th>휴일근로</th>
				      <th>연장근로</th>
				      <th>야간근로</th>
				      <th></th>
				    </tr>
			  	</thead>
				<tbody>
				  <c:choose>
				  	<c:when test="${empty adminAttendanceDtos }">
				  		<tr>
				  			<td colspan="12" class="text-center">등록된 근태정보가 없습니다.</td>
				  		</tr>
				  	</c:when>
				  <c:otherwise>
				  <c:forEach var="adminAttendance" items="${adminAttendanceDtos }">
				    <tr class="text-center">
				      <td><fmt:formatDate value="${adminAttendance.workingDate }" pattern="yyyy년 M월 d일"/></td>
				      <td>${adminAttendance.empNo }</td>
				      <td>${adminAttendance.empName }</td>
				      <td>${adminAttendance.positionName }</td>
				      <td>${adminAttendance.deptName }</td>
				      <td>${adminAttendance.attendancesType }</td>
				      <td>${adminAttendance.startWorkTime }</td>
				      <td>${adminAttendance.endWorkTime }</td>
				      <td>${adminAttendance.workedTimes }시간</td>
				      <td>${adminAttendance.holidayWorkTime }시간</td>
				      <td>${adminAttendance.overtimeWorkedTimes }시간</td>
				      <td>${adminAttendance.nightWorkedTimes }시간</td>
				      <td><button type="button" class="btn btn-outline-dark btn-sm" data-att-no="${adminAttendance.no }" >수정</button></td>
				    </tr>
				   </c:forEach>
				  </c:otherwise>
				</c:choose>
			  </tbody>
			</table>
	    	</div>
			<c:if test="${not empty adminAttendanceDtos }">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link ${pagination.first ? 'disabled' : '' }"
								href="dayadmin?startDate=${param.startDate }&endDate=${param.endDate }&empNo=${param.empNo }
								&positionNo=${param.positionNo }&deptNo=${param.deptNo }&page=${pagination.prevPage }" >이전</a>
						</li>
						<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							<li class="page-item">
								<a class="page-link ${pagination.page eq num ? 'active' : '' }" 
									href="dayadmin?startDate=${param.startDate }&endDate=${param.endDate }&empNo=${param.empNo }
										&positionNo=${param.positionNo }&deptNo=${param.deptNo }&page=${num }">${num }</a>
							</li >
						</c:forEach>
						
						<li class="page-item">
							<a class="page-link ${pagination.last ? 'disabled' : '' }"
								href="dayadmin?startDate=${param.startDate }&endDate=${param.endDate }&empNo=${param.empNo }
								&positionNo=${param.positionNo }&deptNo=${param.deptNo }&page=${pagination.nextPage }" >다음</a>
						</li>
					</ul>
				</nav>
			</c:if>
		<div class="row mb-2 bg-light m-2">
		  	<hr>
		  	<div class="col">
				<p>
					<i class="bi bi-exclamation-circle-fill"></i>
					출근시간, 퇴근시간을 모두 입력 후 수정이 가능합니다.<br>
					<i class="bi bi-exclamation-circle-fill"></i>
					출근시간, 퇴근시간 변경 후 재계산된 시간을 확인하세요.<br>
					<i class="bi bi-exclamation-circle-fill"></i>
					출근시간, 퇴근시간 입력 포맷은 시간(2자리), 분(2자리)와 ':'를 같이 입력하시기 바랍니다.
				</p>
		  	</div>
		  </div>
	   </div>
	 </div>
	</div>
	
	<!-- 근태시간 수정 모달창 -->
	<div class="modal" tabindex="-1" id="modal-modify-hour">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <form id="form-hour" method="post" action="modify">
	      <input type="hidden" name="startDate" value="${param.startDate }">
	      <input type="hidden" name="endDate" value="${param.endDate }">
	      <input type="hidden" name="empNo" value="${param.empNo }">
	      <input type="hidden" name="positionNo" value="${param.positionNo }">
	      <input type="hidden" name="deptNo" value="${param.deptNo }">
	      <div class="modal-header">
	        <h5 class="modal-title">출근/퇴근 시간 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       		<input type="hidden" name="no" value="${adminAttendance.no }" />
	       		<div class="mb-2">
	       			<label class="form-label">출근시간</label>
	       			<input type="text" class="form-control" name="startTime" value="">
	       		</div>
	       		<div class="mb-2">
	       			<label class="form-label">퇴근시간</label>
	       			<input type="text" class="form-control" name="endTime" value="">
	       		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="submit" class="btn btn-primary" id="btn-modify-hour" 
					href="dayadmin?startDate=${param.startDate }&endDate=${param.endDate }&empNo=${param.empNo }
					&positionNo=${param.positionNo }&deptNo=${param.deptNo }&page=${param.page }" >수정</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://momentjs.com/downloads/moment.min.js"></script>
<script type="text/javascript">
$(function() {
	let hourModifyModal = new bootstrap.Modal("#modal-modify-hour");
	
	// 근무일자에 오늘날짜를 기본값으로 넣음
	if ( $("#form-search :input[name=startDate]").val() == "") {
		let currentDate = moment().format("YYYY-MM-DD");
		$("#form-search :input[name=startDate]").val(currentDate)
		$("#form-search :input[name=endDate]").val(currentDate)
	}
	
	// 조회버튼누르면 /work/dayadmin로 이동
	$("#btn-search").click(function() {
		$("#form-search").attr("action", "/work/dayadmin").trigger("submit")
	});
	
	// 엑셀버튼 누르면 /work/download로 이동
	$("#btn-down-xls").click(function() {
		$("#form-search").attr("action", "/work/download").trigger("submit")
	});

	$("#table-daily-attendance tbody button").click(function() {
		// 근태번호 출근시간, 퇴근 시간을 읽어서 모달창의 히든, 출근시간, 퇴근시간 필드에 표시한다.
		var no = $(this).attr("data-att-no");
		var startTime = $(this).closest("tr").find("td:eq(6)").text();
		var endTime = $(this).closest("tr").find("td:eq(7)").text();
		
		$("#form-hour :input[name=no]").val(no);
		$("#form-hour :input[name=startTime]").val(startTime);
		$("#form-hour :input[name=endTime]").val(endTime);
		
		hourModifyModal.show();
	});
	
	var now_utc = Date.now() 
	var timeOff = new Date().getTimezoneOffset()*60000; 
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("end-cal").setAttribute("max", today);
	
	$("#form-hour").submit(function() {
		let startTime = $("#form-hour :input[name=startTime]").val();
		let endTime = $("#form-hour :input[name=endTime]").val();
			
		if (startTime == "") {
			alert("출근시간을 입력해주세요.");
			return false;
		}
		if (endTime == "") {
			alert("퇴근시간을 입력해주세요.");
			return false;
		}
		return true;
	});
	
	$("#form-search").submit(function() {
		let startDate = $("#form-search :input[name=startDate]").val();
		let endDate = $("#form-search :input[name=endDate]").val();
			
		if (startDate == "") {
			alert("시작일자를 지정해주세요.");
			return false;
		}
		if (endDate == "") {
			alert("종료일자를 지정해주세요.");
			return false;
		}
		return true;
	});
	
});
</script>
</body>
</html>