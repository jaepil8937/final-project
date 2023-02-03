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
					<h1>급여비과세표</h1>
				</div>
			</div>		
			<h4>항목정보</h4>
			<table class="table table-sm">
				<thead>
					<tr class="bg-light">
						<th></th>
						<th>기본급</th>
						<th>연장수당</th>
						<th>야간수당</th>
						<th>휴일근무수당</th>
						<th>보육수당</th>
						<th>상여금</th>
						<th>식대비</th>
						<th>출장비</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="bg-light">비과세</th>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>200,000</td>
						<td>0</td>
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