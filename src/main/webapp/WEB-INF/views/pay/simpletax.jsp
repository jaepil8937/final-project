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
					<h1>간이세액조건표</h1>
				</div>
			</div>	
				
			<div class="col-12">
				<h1 class="border p-2 bg-light fs-4 mt-1">검색년월</h1>
			</div>
		<div>
			<table class="table table-bordered">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
					<col width="*">
				</colgroup>
				<tr>
					<th colspan="2">월급여(천원)</th>
					<th colspan="10">공제대상 가족수</th>
				<tr>
				<tr>
					<th>이상</th>
					<th>미만</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>6</th>
					<th>7</th>
					<th>8</th>
					<th>9</th>
					<th>10</th>
				<tr>
					<th>1,000,000</th>
					<th>1,500,000</th>
					<td>50,000</td>
					<td>45,000</td>
					<td>40,000</td>
					<td>35,000</td>
					<td>30,000</td>
					<td>25,000</td>
					<td>20,000</td>
					<td>15,000</td>
					<td>10,000</td>
					<td>5,000</td>
				</tr>
				<tr>
					<th>1,000,000</th>
					<th>1,500,000</th>
					<td>50,000</td>
					<td>45,000</td>
					<td>40,000</td>
					<td>35,000</td>
					<td>30,000</td>
					<td>25,000</td>
					<td>20,000</td>
					<td>15,000</td>
					<td>10,000</td>
					<td>5,000</td>
				</tr>
				<tr>
					<th>1,000,000</th>
					<th>1,500,000</th>
					<td>50,000</td>
					<td>45,000</td>
					<td>40,000</td>
					<td>35,000</td>
					<td>30,000</td>
					<td>25,000</td>
					<td>20,000</td>
					<td>15,000</td>
					<td>10,000</td>
					<td>5,000</td>
				</tr>
			</table>
		</div>			
	</div>
</div>	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>