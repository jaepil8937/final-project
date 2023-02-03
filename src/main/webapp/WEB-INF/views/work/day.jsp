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
<c:set var="menu" value="post" />
<%@ include file="../common/navbar.jsp" %>
<div class="container my-3">
	<%-- 버튼크기와 버튼색상 --%>
	<style>
		.button {
		  background-color: #5154E9;
		  border: none;
		  color: white;
		  padding: 15px 32px;
		  text-align: center;
		  text-decoration: none;
		  font-size: 18px;
		  display: inline-block;
		  margin: 4px 2px;
		  cursor: pointer;
		}
		
		.button1 {width: 150px; border-radius: 5px; }
		.button2 {width: 100px; border-radius: 5px; background-color: #B40431;} 
	</style>
	<div class="row">
		
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
		<div class="row mb-3">
		<div class="col">
			<h1 class="fs-10 p-4" style="font-weight: bold;">일일 근태 등록</h1>
		</div>
		<div class="row">
			<h3 class="border p-4 bg-light">
				<div class="row">
			<div class="col-5 text-center">
				<button type="button" class="button button1">출근</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="button button1">퇴근</button>
			</div>
			<%-- 근무일자설정 --%>
			<div class="col-5 text-end">
				<label></label> <p style="font-size:18px" for="date">근무일자 : 
					<input type="date"
					       id="date"
					       max="2024-01-01"
					       min="2022-01-01"
					       value="sysdate">
				</label>
			</div>
			<%-- 근무일자 조회 --%>
			<div class="col-2 text-15">
				<button type="button" class="button button2">조회</button>
			</div>
		</div>
			</h3>
		</div>		
		<div class="row">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">근무일자</th>
			      <th scope="col">사원번호</th>
			      <th scope="col">출근시간</th>
			      <th scope="col">퇴근시간</th>
			      <th scope="col">근무시간</th>
			      <th scope="col">휴일근로</th>
			      <th scope="col">연장근로</th>
			      <th scope="col">야간근로</th>
			    </tr>
			  </thead>
			<tbody>
			    <tr>
			      <th>2023.02.02</th>
			      <td>1001</td>
			      <td>09:00</td>
			      <td>18:00</td>
			      <td>08:00</td>
			      <td>01:00</td>
			      <td>00:00</td>
			      <td>00:00</td>
			    </tr>
			</tbody>
		</div>
		
		</table>
		</div>
		
	</div>
	</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>