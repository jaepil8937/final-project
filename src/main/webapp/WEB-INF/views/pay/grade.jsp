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
<div class="container mb-3">
	<div class="row mb-3">
		<div class="col-3">
<%@ include file="../common/sidebar.jsp" %>
		</div>
		
		<div class="col-9 mb-3">
			<div class="row mb-3">
				<div class="col">
					<h1>기본수당외 수당관리</h1>
				</div>
			</div>	
				
			<div class="col-12">
				<h1 class="border p-2 bg-light fs-4 mt-1">검색년월</h1>
			</div>
	<div class="row mb-3">
		<div class="col-4">
			<div class="card">
				<div class="card-header">기본정보</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th>No</th>
								<th>직급</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>1</th>
								<th>인턴</th>
							</tr>
						</tbody>
					</table>
					<div class="text-end">
					</div>
				</div>
			</div>
		</div>
		<div class="col-8">
			<div class="card">
				<div class="card-header">호봉별 항목정보</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="30%">
							<col width="30%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>호봉</th>
								<th>항목명</th>
								<th>항목금액</th>
								<th>비고</th>
							</tr>
						</thead>
						</tbody>
							<tr>
								<td class="text-center"><input type="checkbox"></td>
								<td>1</td>
								<td>기본급</td>
								<td>100,000</td>
								<td>x</td>
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