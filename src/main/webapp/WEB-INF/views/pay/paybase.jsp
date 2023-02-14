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
			<h4>기본정보</h4>
			<table class="table table-sm">
				<colgroup>
					<col width="15%">
					<col width="15%">
					<col width="13%">
					<col width="12%">
					<col width="15%">
					<col width="15%">
					<col width="15%">			
				</colgroup>
				<thead>
					<tr class="bg-light">
						<th>사원번호</th>
						<th>성명</th>
						<th>직급</th>
						<th>부서</th>
						<th>입사일자</th>
						<th>연락처</th>
						<th>E-mail</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="paybase" items="${paybase }">
					<tr>
						<td>${paybase.no }</td>
						<td><a href="paybank?employeeNo=${paybase.no }" class="text-decoration-none">${paybase.name }</a></td>
						<td>${paybase.positionName }</td>
						<td>${paybase.deptName }</td>
						<td><fmt:formatDate value="${paybase.hireDate}" /></td>
						<td>${paybase.tel }</td>
						<td>${paybase.email }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>			
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>