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
					<h1>4대보험 요율표</h1>
				</div>
			</div>	
				
			<div class="col-12 border ">
				<div class="border p-2 bg-light fs-6" >검색년월
				<input type="month"/>
				<button class="btn btn-danger btn-xm">검색</button>
				</div>
			</div>
			<div class="row mb-3">
				<div>
					<table class="table table-bordered">
						<tr>
							<th rowspan="2">국민연금</th>
							<th >요율</th>
							<th>개인부담분</th>
							<td>4.5%</td>
							<th>회사부담금</th>
							<td>4.5%</td>
						</tr>
						<tr>
							<th>기준소득월액</th>
							<th>하한금액</th>
							<td>290,000원</td>
							<th>상한금액</th>
							<td>4,490,000원</td>
						</tr>
						<tr>
							<th rowspan="2">건강보험</th>
							<th>요율</th>
							<th>개인부담분</th>
							<td>3.12%</td>
							<th>회사부담금</th>
							<td>3.12%</td>
						</tr>
						<tr>
							<th>장기요양보험</th>
							<th>개인부담분</th>
							<td>7.38%</td>
							<th>회사부담금</th>
							<td>7.38%</td>
						</tr>
						<tr>
							<th>고용보험</th>
							<th>요율</th>
							<th>개인부담분</th>
							<td>0.65%</td>
							<th>회사부담금</th>
							<td>0.65%</td>
						</tr>
						<tr>
							<th>산재보험</th>
							<th>요율</th>
							<th>회사부담금</th>
							<td>%</td>
							<td colspan="2">회사 규정마다 다름</td>
						</tr>
					</table>
				</div>	
			</div>
		</div>	
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>