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
						<a href="paybank?employeeNo=${paybank.employeeNo }" class="btn btn-light active px-4">급여기본</a>
						<a href="paybankinfo?employeeNo=${paybank.employeeNo }" class="btn btn-light px-4">급여지급</a>
					</div>
				</div>
				<table class="table table-sm">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">			
					</colgroup>
					<thead class="bg-light">
						<tr>
							<th>은행</th>
							<th>계좌번호</th>
							<th>예금주</th>
							<th>퇴직금기산일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${paybank.bankName }</td>
							<td>${paybank.bankAccount }</td>
							<td>${paybank.bankOwner }</td>
							<td><fmt:formatDate value="${paybank.hireDate}" /></td>
						</tr>
					</tbody>
				</table>
					<table class="table table-bordered">
						<colgroup>
							<col width="25%">
							<col width="15%">			
							<col width="10%">			
							<col width="15%">			
							<col width="10%">			
							<col width="15%">			
							<col width="10%">			
						</colgroup>
						<tr>
							<th class="bg-light">국민연금</th>
							<th class="bg-light">기준소득월액</th><td><fmt:formatNumber value="${paybank.pensionBaseSalary}"/></td>
							<th class="bg-light">취득일자</th><td><fmt:formatDate value="${paybank.hireDate}" /></td>
							<th class="bg-light">퇴직일자</th><td><fmt:formatDate value="${paybank.retirementDate}" /></td>
						</tr>				
						<tr>
							<th class="bg-light">건강보험</th>
							<th class="bg-light">기준소득월액</th><td><fmt:formatNumber value="${paybank.healthBaseSalary}"/></td>
							<th class="bg-light">취득일자</th><td><fmt:formatDate value="${paybank.hireDate}" /></td>
							<th class="bg-light">퇴직일자</th><td><fmt:formatDate value="${paybank.retirementDate}" /></td>
						</tr>				
						<tr>
							<th class="bg-light">고용보험</th>
							<th class="bg-light">기준소득월액</th><td><fmt:formatNumber value="${paybank.employmentBaseSalary}"/></td>
							<th class="bg-light">취득일자</th><td><fmt:formatDate value="${paybank.hireDate}" /></td>
							<th class="bg-light">퇴직일자</th><td><fmt:formatDate value="${paybank.retirementDate}" /></td>
						</tr>				
				</table>
				<div class="row mb-2">
					<div class="col">
						<button class="btn btn-outline-dark btn-xs" style="float:right;" data-bs-toggle="modal" data-bs-target="#modal-form-paybank">등록</button>
						<button class="btn btn-outline-dark btn-xs" style="float:right;" data-bs-toggle="modal" data-bs-target="#modal-modify-paybank">수정</button>
					</div>
				</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>