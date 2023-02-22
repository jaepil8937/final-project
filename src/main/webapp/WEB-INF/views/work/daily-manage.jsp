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
<c:set var="menu" value="attendences" />
<c:set var="side" value="daily-manage" />
<%@ include file="../common/navbar.jsp" %>
<div class="container my-3">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
				<div class="col">
					<h1 class="fs-10 p-4" style="font-weight: bold;">일일근태관리</h1>
				</div>
			</div>
			<hr>
			<div class="row mb-3 p-4 bg-light">
				<div class="col-12">
					<form method="get" action="/work/dayadmin">
					   	<b>근무일자: </b>
						<input autocomplete="off" type="date" name="startDate" id="start-cal" value="${param.startDate }"> 
						~ <input autocomplete="off" type="date" name="endDate" id="end-cal" value="${param.endDate }"><p></p><p>
						<th>
						<b>사원번호:</b>
						<input autocomplete="off" type="number" name="empNo" min="1000" value="${param.empNo }"/></th>&nbsp;&nbsp;
						
						<th>
							<b>직급:</b>
							<select id="positionNo" name="positionNo" value="${param.positionNo }" >
							    <option value="">선택하세요</option>
							    <option value="100" ${param.positionNo eq '100' ? 'selected' : '' }>사원</option>
							    <option value="101">대리</option>
							    <option value="102">과장</option>
							    <option value="103">차장</option>
							    <option value="104">부장</option>
							</select>
						</th>&nbsp;&nbsp;
						<th>
							<b>부서:</b>
							<select name="deptNo" value="${param.deptNo }">
							    <option value="">선택하세요</option>
							    <option value="100">영업부</option>
							    <option value="101">개발부</option>
							    <option value="102">인사부</option>
							    <option value="103">총무부</option>
							</select>
						</th>&nbsp;
						
						<button type="submit" class="btn btn-danger btn-sm" style="float: end;">조회</button></p>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>일일근태현황</strong>
					</p>
				</div>
			</div>
			<p>
				<i class="bi bi-exclamation-circle-fill"></i>
				출근시간, 퇴근시간 변경 후 재계산된 시간을 확인하세요.<br>
				<i class="bi bi-exclamation-circle-fill"></i>
				출근시간, 퇴근시간 입력 포맷은 시간(2자리), 분(2자리)와 ':'를 같이 입력하시기 바랍니다.
			</p>
		<form>
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
				      <td><button type="button" class="btn btn-dark btn-sm" data-att-no="${adminAttendance.no }" >수정</button></td>
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
							<a class="page-link" ${pagination.first ? 'disabled' : '' }"
								href="dayadmin?startDate=${param.startDate }&endDate=${param.endDate }&empNo=${param.empNo }
								&positionNo=${param.positionNo }&deptNo=${param.deptNo }&page=${pagination.prevPage }" >이전</a>
						</li>
						<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							<li class="page-item">
								<a class="page-link" ${pagination.page eq num ? 'active' : '' }" 
									href="dayadmin?startDate=${param.startDate }&endDate=${param.endDate }&empNo=${param.empNo }
										&positionNo=${param.positionNo }&deptNo=${param.deptNo }&page=${num }">${num }</a>
							</li >
						</c:forEach>
						
						<li class="page-item">
							<a class="page-link" ${pagination.last ? 'disabled' : '' }"
								href="dayadmin?startDate=${param.startDate }&endDate=${param.endDate }&empNo=${param.empNo }
								&positionNo=${param.positionNo }&deptNo=${param.deptNo }&page=${pagination.nextPage }" >다음</a>
						</li>
					</ul>
				</nav>
			</c:if>
		</form>
		  </div>
	 </div>
	</div>
	<div class="modal" tabindex="-1" id="modal-modify-hour">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">출근/퇴근 시간 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       	<form id="form-hour" method="post" action="modify">
	       		<input type="hidden" name="no" value="data-att-no" />
	       		<div class="mb-2">
	       			<label class="form-label">출근시간</label>
	       			<input type="text" class="form-control" name="startTime" vaue="">
	       		</div>
	       		<div class="mb-2">
	       			<label class="form-label">퇴근시간</label>
	       			<input type="text" class="form-control" name="endTime">
	       		</div>
	       	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="btn-modify-hour">수정</button>
	      </div>
	    </div>
	  </div>
	</div>	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

let hourModifyModal = new bootstrap.Modal("#modal-modify-hour");

$("#table-daily-attendance tbody button").click(function() {
	
	// 근태번호 출근시간, 퇴근 시간을 읽어서 모달창의 히든, 출근시간, 퇴근시간 필드에 표시한다.
	var no = $(this).attr("data-att-no");
	var startTime = $(this).closest("tr").find("td:eq(6)").text();
	var endTime = $(this).closest("tr").find("td:eq(7)").text();
	
	
	
	hourModifyModal.show();
	
})
</script>
</body>
</html>