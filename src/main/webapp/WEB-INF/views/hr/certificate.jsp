<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>증명서발급</title>
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
			<div class="row">
				<div class="col-12">
					<h3>증명서발급</h3>
				</div>
				<div class="col-12 mb-3">
					<form method="get" action="">
						<div class="border p-3 bg-white">
							<select name="">
								<option value="">재직증명서</option>
								<option value="">경력증명서</option>
								<option value="">원천징수영수증</option>
								<option value="">각종근로소득증명서</option>
								<option value="">급여명세서</option>
							</select>
							<input type="date">~<input type="date">
							<button class="btn btn-dark float-end">검색</button>
						</div>
					</form>
				</div>
				<div class="col-12">
					<h6>증명서신청내역<button class="btn btn-dark float-end">발령등록</button>
								  <button class="btn btn-dark float-end">발령취소</button></h6>
				</div>
				<table class="table border p-3 bg-white">
						<thead>
							<tr>
								<th class="text-center"></th>
								<th class="table-primary text-center" >신청번호</th>
								<th class="table-primary text-center">증명서구분</th>
								<th class="table-primary text-center">신청일자</th>
								<th class="table-primary text-center">사원번호</th>
								<th class="table-primary text-center">성명</th>
								<th class="table-primary text-center">발행상태</th>
								<th class="table-primary text-center">발행일자</th>
								<th class="table-primary text-center">용도</th>
							</tr>
						</thead>
						<tbody>
							<td class="text-center"><input type="checkbox" /></td>
							<td class="text-center">1</td>
							<td class="text-center">재직증명서</td>
							<td class="text-center">2022.01.26</td>
							<td class="text-center">1000</td>
							<td class="text-center">홍길동</td>
							<td class="text-center">발행완료</td>
							<td class="text-center">2022.01.30</td>
							<td class="text-center">용도</td>
						</tbody>
				</table>
				<div class="col-12">
					<h6>증명서신청내역</h6>
				</div>
					<table class="table border p-3 bg-white">
						<tbody>
							<td>신청번호</td>
							<td></td>
							<td>증명서구분</td>
							<td></td>
							<td>신청일자</td>
						</tbody>
						<tbody>
							<td>사원번호</td>
							<td></td>
							<td>성명</td>
							<td></td>
							<td>발행일자</td>
						</tbody>
						<tbody>
							<td>부서</td>
							<td></td>
							<td>직책</td>
							<td></td>
							<td>호봉</td>
						</tbody>
						<tbody>
							<td>용도</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tbody>
						<tbody>
							<td>비고</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tbody>
					</table>
			</div>
		</div>
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>