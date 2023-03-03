<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<body>
<body>
<c:set var="menu" value="work" />
<c:set var="side" value="monthly-manage" />
<%@ include file="../common/navbar.jsp" %>
<div class="container my-3">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
				<h2>월간근태관리</h2>
			</div>
			<hr>
		<div class="row mb-3 p-4 bg-light">
			<div>
				<form id="form-yearMonth" method="get" action="/work/monthDetail">
					<label class="form-label"><strong>근무년월: </strong></label>
					<input type="month" id="currentMonth" name="yearMonth" value="${param.yearMonth }" style="width: 130px">
				</form>
			</div>
		</div>	
		<div class="row">
			<div class="col-6 text-left mb-1">
				<p>
					<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>월근태사용정보</strong>
				</p>
			</div>
		</div>
		<div class="row">
		<div class="col-6">
			<div class="card">
				<div class="card-header" style="font-weight: bold;">사용자정보</div>
				<div class="card-body">
					<table class="table" id="table-emp-list">
						<colgroup>
								<col width="20%">
								<col width="18%">
								<col width="18%">
								<col width="18%">
								<col width="15%">
							</colgroup>
						<thead>
							<tr>
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
								<th>호봉</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="monthlyAttendanceDto" items="${monthlyAttendanceDtos }">
							<tr>
								<td>${monthlyAttendanceDto.employeeNo }</td>
								<td><a href="" class="text-decoration-none" data-emp-no="${monthlyAttendanceDto.employeeNo }">${monthlyAttendanceDto.name }</a></td>
								<td>${monthlyAttendanceDto.positionName }</td>
								<td>${monthlyAttendanceDto.deptName }</td>
								<td>${monthlyAttendanceDto.hobong }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="text-end">
						<button class="btn btn-dark btn-sm" id="btn-close">마감</button>
					</div>
				<p>
					<i class="bi bi-exclamation-circle-fill"></i>
					근무년월을 선택하여 근태 정보를 확인하세요.<br>
					<i class="bi bi-exclamation-circle-fill"></i>
					총근무일수는 정상근무, 연장근무, 야간근무를 합한 일수입니다.<br>
				</p>
				</div>
			</div>
		</div>
			<div class="col-6">
				<div class="card">
					<div class="card-header" style="font-weight: bold;">월근태일수</div>
					<div class="card-body">
						<table class="table" id="table-month-day">
							<colgroup>
								<col width="30%">
								<col width="20%">
								<col width="30%">
								<col width="20%">
							</colgroup>
						<tbody>
							
							<tr>
								<th>총근무일수</th>
								<td><span id="total-day"></span> 일</td>
								<th>정상근무일수</th>
								<td><span id="normal-day"></span>일</td>
							</tr>
							<tr>
								<th>연장근무일수</th>
								<td><span id="over-day"></span>일</td>
								<th>야근일수</th>
								<td><span id="night-day"></span>일</td>
							</tr>
							<tr>
								<th>조퇴일수</th>
								<td><span id="early-day"></span>일</td>
								<th>지각일수</th>
								<td><span id="tardy-day"></span>일</td>
							</tr>
							
						</tbody>
					</table>
					</div>
					<div class="card-header" style="font-weight: bold;">월근태시간</div>
					<div class="card-body">
					<table class="table" id="table-month-time">
						<colgroup>
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tbody>
							<tr>
								<th>총근무시간</th>
								<td><span id="total-time"></span>시간</td>
								<th>연장근무시간</th>
								<td><span id="over-time"></span>시간</td>
							</tr>
							<tr>
								<th>야근시간</th>
								<td><span id="night-time"></span>시간</td>
							</tr>
						</tbody>
					</table>
					<div class="text-end">
							<%-- 수정폼사용하거나 페이지에서 바로 수정 --%>
						<button class="btn btn-success btn-sm disabled" id="btn-modify">수정</button>
						<button class="btn btn-primary btn-sm disabled" id="btn-save">저장</button>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
</div>			
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#currentMonth").val(new Date().toISOString().slice(0, 7));
	
	$("#table-emp-list tbody a").click(function(event) {
		event.preventDefault();
		
		$("#table-emp-list tbody tr").removeClass("table-primary");
		$(this).closest('tr').addClass("table-primary");
		let month = $(":input[name='yearMonth']").val();
		let empNo = $(this).attr("data-emp-no");
		
		$.getJSON("/work/monthDetail", {yearMonth: month, empNo: empNo}, function(response) {
			// response = {'daysDto': {totalWorkedDays:3, normalWorkedDay:2}}
			$("#total-day").text(response.daysDto.totalDays);
			$("#normal-day").text(response.daysDto.normalWorkedDays);
			$("#over-day").text(response.daysDto.overtimeWorkedDays);
			$("#night-day").text(response.daysDto.nightWorkedDays);
			$("#early-day").text(response.daysDto.leaveEarlyDays);
			$("#tardy-day").text(response.daysDto.tardyDays);
			$("#total-time").text(response.timesDto.totalWorkedTimes);
			$("#over-time").text(response.timesDto.overtimeWorkedTimes);
			$("#night-time").text(response.timesDto.nightWorkedTimes);
		})
	});
});
</script>
</body>
</html>