<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
<c:set var="side" value="daily-attendance" />
<%@ include file="../common/navbar.jsp" %>
<div class="container my-3">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
				<div class="col">
					<h1 class="fs-10 p-4" style="font-weight: bold;">일일근태등록</h1>
				</div>
			</div>
			<hr>
			<div class="row mb-3 p-4 bg-light">
				<div class="col-4">
					<a href="/work/startAttendance" onclick="javascript:btnStart()" name="" value="${param.empNo }"
						class="btn btn-success btn-lg ${isStartAttendanced ? 'disabled' : '' }">출근</a>
					<a href="/work/endAttendance" onclick="javascript:btnEnd()"
						class="btn btn-danger btn-lg ${isEndAttendanced ? 'disabled' : ''}">퇴근</a>
				</div>
				<div class="col-2" style="text-align: right;" >
					<b>근무일자:</b>
				</div>
				<div class="col-6" text-align:"end" >
					<form method="get" action="/work/searchAttendances" name="calform">
								<!-- value="${param.startDate } param으로 전송된 값을 달력폼에 입력시켜줌 -->
						<input autocomplete="off" type="date" name="startDate" id="start-cal" value="${param.startDate }">
						~ <input autocomplete="off" type="date" name="endDate" id="end-cal" value="${param.endDate }">
						<button type="submit" class="btn btn-danger btn-sm">조회</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>일일근태정보</strong>
					</p>
				</div>
			</div>
		<form>
		<div class="row">
			<p>
				<i class="bi bi-exclamation-circle-fill"></i>
				근무시간, 연장, 야간, 지각, 조퇴시간이 계산되지 않는 경우 관리자에게 문의하세요
			</p>
			<table class="table table-bordered table-hover table-striped table-sm" id="table-day-info">
				<colgroup>
					<col width="16%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
					<col width="12%">
				</colgroup>
			  	<thead>
				    <tr class="text-center">
				      <th>근무일자</th>
				      <th>사원번호</th>
				      <th>출근시간</th>
				      <th>퇴근시간</th>
				      <th>근무시간</th>
				      <th>휴일근로</th>
				      <th>연장근로</th>
				      <th>야간근로</th>
				    </tr>
			  	</thead>
				<tbody>
					<c:forEach var="attendance" items="${attendances }">
					    <tr class="text-center">
					      <td><fmt:formatDate value="${attendance.workingDate }" pattern="yyyy년 M월 d일"/> </td>
					      <td>${attendance.empNo }</td>
					      <td>${attendance.startWorkTime }</td>
					      <td>${attendance.endWorkTime }</td>
					      <td>${attendance.workedTimes }시간</td>
					      <td>${attendance.holidayWorkTime }시간</td>
					      <td>${attendance.overtimeWorkedTimes }시간</td>
					      <td>${attendance.nightWorkedTimes }시간</td>
					    </tr>
					</c:forEach>
			  </tbody>
			</table>
		  </div>
		</form>
	 </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
// 출퇴근알림창
	function btnStart(){
	    alert('출근완료');
	}
	
	function btnEnd(){
		if (confirm("퇴근하시겠습니까?")) {
			alert("퇴근완료");
		}
	}

</script>
</body>
</html>