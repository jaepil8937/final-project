<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="employee" />
<c:set var="side" value="" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
				<div class="col-12">
					<h2><p class="fw-bold">학력정보</p></h2>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-3">
					<i class="bi bi-arrow-right-square-fill text-danger"></i> <strong>상세정보</strong>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-12">
					<div class="btn-group" >
						<a href="register" class="btn btn-light px-4">인적사항</a>
						<a href="family" class="btn btn-light px-4">가족사항</a>
						<a href="education" class="btn active btn-light px-4">학력정보</a>
						<a href="order" class="btn btn-light px-4">발령정보</a>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col text-end mb-3">
					<button type="button" class="btn btn-outline-dark btn-sm" id="">행삭제</button>
					<button type="button" class="btn btn-outline-dark btn-sm"  id="">행추가</button>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<table class="table table-bordered table-hover table-striped table-sm">
						<colgroup>
							<col width="5%">
							<col width="7%">
							<col width="7%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th><input type="checkbox"></th>
								<th>입학년월</th>
								<th>졸업년월</th>
								<th>학교명</th>
								<th>전공학과</th>
								<th>학위</th>
								<th>졸업구분</th>
								<th>소재지</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								<td><input type="checkbox"></td>
								<td><input type="date" id="start-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>
								<td><input type="date" id="end-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>
								<td>서울대</td>
								<td>전산</td>
								<td>학사</td>
								<td>졸업</td>
								<td>서울</td>
							</tr>
							<tr class="text-center">
								<td><input type="checkbox"></td>
								<td><input type="date" id="start-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>
								<td><input type="date" id="end-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>
								<td>서울대</td>
								<td>전산</td>
								<td>학사</td>
								<td>졸업</td>
								<td>서울</td>
							</tr>
							<tr class="text-center">
								<td><input type="checkbox"></td>
								<td><input type="date" id="start-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>
								<td><input type="date" id="end-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>
								<td>서울대</td>
								<td>전산</td>
								<td>학사</td>
								<td>졸업</td>
								<td>서울</td>
							</tr>											
						</tbody>
					</table>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col text-end">
					<button type="submit" class="btn btn-dark" style="float:right;" id="">저장</button>
				</div>
			</div>
		</div>
	</div>
</div>				
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>