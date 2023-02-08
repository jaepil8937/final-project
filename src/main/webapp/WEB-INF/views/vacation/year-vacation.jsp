<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<c:set var="menu" value="post" />
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr35">
				<%@ include file="../common/sidebar.jsp"%>
			</div>
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<h1 class="fs-10 p-4">근속연수별 휴가 설정</h1>
					</div>
				</div>
				<div class="row" style="margin-top: 60px; margin-bottom: 20px;">
					<div class="col-6">
						<p>
							<i class="bi bi-arrow-right-square-fill text-danger"></i> 근속연수별 휴가 설정
						</p>
					</div>
					<div class="col-6">
						<div class="text-end">
							<button class="btn btn-light" >행추가</button>
							<button class="btn btn-light">행삭제</button>
						</div>
					</div>
				</div>
				<div class="" style="overflow-y: scroll; height: 250px;">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="30%">
							<col width="30%">
							<col width="30%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th></th>
								<th>근속연수</th>
								<th>휴가일수</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty vacationDays }">
									<tr>
										<td colspan="4" class="text-center">근속연수별 휴가일수를 등록해주십시오.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="vacationDay" items="${vacationDays }">
										<!-- 등록된 아래 내용 출력 -->
										<tr class="text-center">
											<th><input type="checkbox"></th>
											<td>${vacationDay.workedYear}년</td>
											<td>${vacationDay.vacationDays}일</td>
											<td></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col">
						<p style="padding-top: 7px;">
							<button class="btn btn-dark" style="float: right;">저장</button>
						</p>
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
</body>
</html>
