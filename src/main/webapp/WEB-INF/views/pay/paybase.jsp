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
<%@ include file="../common/navbar.jsp" %>
<div class="container mb-3">
	<div class="row mb-3">
	
		<div class="col-3">
			사이드바 넣을 곳 
		</div>
		
		<div class="col-9 mb-3">
			<div class="row mb-3">
				<div class="col">
					<h1>급여기본정보관리</h1>
				</div>
			</div>		
			<h4>기본정보</h4>
			<table class="table table-sm" id="PayBase">
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
					<tr>
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
					<tr>
						<td>10001</td>
						<td>홍길동</td>
						<td>사원</td>
						<td>개발부</td>
						<td>2020/11/20</td>
						<td>010-1111-1111</td>
						<td>hong@naver.com</td>
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