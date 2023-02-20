<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>애플리케이션</title>
</head>
<style>
</style>
<body>
	<c:set var="menu" value="work" />
	<c:set var="side" value="overtime-history" />
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr35">
				<%@ include file="../common/sidebar.jsp"%>
			</div>
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<h1 class="fs-10 p-4">휴일/연장/야간 근무조회</h1>
					</div>
				</div>
				<div class="row" style="margin-top: 24px;">
					<div class="shadow-none p-3 mb-5 bg-light rounded">
						<div class="container text-center">
							<form id="" method="get" action="/holiday/overtime-history">
								<div class="row">
									<div class="col-3">
										<label for="start" style="padding-top: 12px;">근무년월: <input
											type="month" name="month" value="${param.month }">
										</label>
									</div>
									<div class="col-4">
										<label for="name" style="padding-top: 14px;">사원번호: </label> <input
											type="text" name="empNo" value="${param.empNo }" style="text-align:center; width:100px; height:30px;">
									</div>
									<div class="col">
										<p style="padding-top: 7px;">
											<button class="btn btn-danger" style="float: right;">검색</button>
										</p>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 25px;">
					<div class="col-6" style="padding-bottom: 15px;">
						<p>
							<i class="bi bi-arrow-right-square-fill text-danger"></i>
							휴일/연장/야간 근무조회
						</p>
					</div>
					<div class="col-6">
						<p>
							<button type="button" class="btn btn-light" style="float: right;">엑셀파일다운</button>
						</p>
					</div>
					<div class="row">
						<table class="table">
							<thead>
								<tr class="text-center">
									<th scope="col">NO</th>
									<th scope="col">사원번호</th>
									<th scope="col">성명</th>
									<th scope="col">직급</th>
									<th scope="col">부서</th>
									<th scope="col">근태종류</th>
									<th scope="col">근태시간</th>
									<th scope="col">근태일자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty histories }">
										<tr>
											<td colspan="10" class="text-center">해당 내역이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="OvertimeDto" items="${histories }"
											varStatus="loop">
											<tr class="text-center">
												<th scope="row">${loop.count }</th>
												<td>${OvertimeDto.employeeNo }</td>
												<td>${OvertimeDto.employeeName }</td>
												<td>${OvertimeDto.positionName }</td>
												<td>${OvertimeDto.deptName }</td>
												<td>${OvertimeDto.attendancesType }</td>
												<td>${OvertimeDto.endWorkTime }</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${OvertimeDto.workingDate }" /></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<nav class="pagination pagination-sm justify-content-center" style="margin-top: 10px;">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
					<div class="row mb-2 bg-light m-2">
						<hr>
						<div class="col">
							<p>
								<i class="bi bi-exclamation-circle-fill"></i> 휴일근무, 연장근무, 야간근무만
								조회됩니다.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://momentjs.com/downloads/moment.js"
	type="text/javascript"></script>
<script type="text/javascript">
	//근무년월에 당일 날짜 선택
	$(function() {
		let startDate = moment().format("YYYY-MM")
		$(":input[name=month]").val(startDate);
	})
</script>
</body>
</html>
