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
<title>인사관리시스템</title>
</head>
<body>
<c:set var="menu" value="pay" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10 mb-3">
			<div class="row mb-3">
				<div class="col">
					<h1>급여기본정보관리</h1>
				</div>
			</div>		
			<h4>상세정보</h4>
				<div class="col-12 mb-2">
					<div class="btn-group" >
						<a href="paybank?employeeNo=${paybankinfo.employeeNo }" class="btn btn-light  px-4">급여기본</a>
						<a href="paybankinfo?employeeNo=${paybankinfo.employeeNo }" class="btn btn-light active px-4">급여지급</a>
					</div>
				</div>
				<table class="table table-sm">
				<colgroup>
					<col width="12%">
					<col width="13%">
					<col width="13%">
					<col width="13%">
					<col width="13%">
					<col width="13%">
					<col width="13%">			
					<col width="10%">			
				</colgroup>
				<thead>
					<tr class="bg-light">
						<th>사원번호</th>
						<th>기본급</th>
						<th>연장수당</th>
						<th>야간수당</th>
						<th>휴일근무수당</th>
						<th>시작년월</th>
						<th>종료년월</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${paybankinfo.employeeNo }</td>
						<td><fmt:formatNumber value="${paybankinfo.baseSalary }" /></td>
						<td>${paybankinfo.overtimeSalary }</td>
						<td>${paybankinfo.nightSalary }</td>
						<td>${paybankinfo.holidaySalary }</td>
						<td>${paybankinfo.startDate }</td>
						<td>${paybankinfo.endDate }</td>
						<td>${paybankinfo.note }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>