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
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="pay" />
<%@ include file="../common/navbar.jsp" %>
<div class="container mb-3">
	<div class="row mb-3">
		<div class="col-3">
<%@ include file="../common/sidebar.jsp" %>
		</div>
		
		<div class="col-9 mb-3">
			<div class="row mb-3">
				<div class="col">
					<h1>급여기본정보관리</h1>
				</div>
			</div>	
				
			<div class="col-12">
				<h1 class="border p-2 bg-light fs-4 mt-1">검색년월</h1>
			</div>
	<div class="row mb-3">
		<div class="col-5">
			<div class="card">
				<div class="card-header">기본정보</div>
				<div class="card-body">
					<table class="table" id="employee-list">
						<thead>
							<tr>
								<th>사원번호</th>
								<th>성명</th>
								<th>부서명</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					<div class="text-end">
					</div>
				</div>
			</div>
		</div>
		<div class="col-7">
			<div class="card">
				<div class="card-header">기본수당외 수당관리</div>
				<div class="card-body">
					<table class="table" id="table-user-info">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tbody>
							<tr>
								<th>지급/공제</th>
								<td id="cell-user-id"></td>
								<th>보육수당</th>
								<td id="cell-user-name"></td>
							</tr>
							<tr>
								<th>상여금</th>
								<td id="cell-user-email"></td>
								<th>식대비</th>
								<td id="cell-user-tel"></td>
							</tr>
							<tr>
								<th>출장비</th>
								<td id="cell-user-created-date"></td>
								<th>비고</th>
								<td id="cell-user-updated-date"></td>
							</tr>
						</tbody>
					</table>
					<div class="text-end">
					</div>
				</div>
			</div>
		</div>
	</div>				
	</div>
</div>	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>