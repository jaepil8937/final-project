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
					<h1>급여기본정보관리</h1>
				</div>
			</div>		
			<h4>상세정보</h4>
				<div class="col-12 mb-2">
					<div class="btn-group" >
						<a href="paybank" class="btn active btn-light px-4">급여기본</a>
						<a href="paybankinfo" class="btn btn-light px-4">급여지급</a>
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
							<td>서울은행</td>
							<td>100220023002</td>
							<td>홍길동</td>
							<td>2022/02/22</td>
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
							<th class="bg-light">기준소득월액</th><td>4,800,000</td>
							<th class="bg-light">취득일자</th><td>2022/02/22</td>
							<th class="bg-light">퇴직일자</th><td>2022/02/22</td>
						</tr>				
						<tr>
							<th class="bg-light">건강보험</th>
							<th class="bg-light">기준소득월액</th><td>4,800,000</td>
							<th class="bg-light">취득일자</th><td>2022/02/22</td>
							<th class="bg-light">퇴직일자</th><td>2022/02/22</td>
						</tr>				
						<tr>
							<th class="bg-light">고용보험</th>
							<th class="bg-light">기준소득월액</th><td>4,800,000</td>
							<th class="bg-light">취득일자</th><td>2022/02/22</td>
							<th class="bg-light">퇴직일자</th><td>2022/02/22</td>
						</tr>				
				</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>