<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>애플리케이션</title>
</head>
<style>
</style>
<body>
<c:set var="menu" value="post" />
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr35">
			<%@ include file="../common/sidebar.jsp"%>
		</div>
		<div class="col">
			<div class="row mb-3">
				<div class="col">
					<h1 class="fs-10 p-4">근속연수별 휴가 설정</h1>
				</div>
			</div>
			<div class="row" style="margin-top: 60px; margin-bottom: 20px;">
				<div class="col-6">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i> 근속연수별 휴가 설정
					</p>
				</div>
					<div class="col-6">
						<p style="padding-top: 7px;">
							<button class="btn btn-light" style="float: right;">행추가</button>
							<button class="btn btn-light"
								style="float: right; margin-right: 5px;">행삭제</button>
						</p>
					</div>
					</div>
				<div class="" style="overflow-y: scroll; height:250px;">
					<table class="table">
						<thead>
						<colgroup>
							<col width="1%">
							<col width="4%">
							<col width="4%">
							<col width="12%">
						</colgroup>
							<tr class="text-center">
								<th></th>
								<th>근속연수</th>
								<th>휴가일수</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								<th><input type="checkbox"></th>
								<td>1</td>
								<td>15.0</td>
								<td></td>
							</tr>
							<tr class="text-center">
								<th><input type="checkbox"></th>
								<td>2</td>
								<td>15.0</td>
								<td></td>
							</tr>
							<tr class="text-center">
								<th><input type="checkbox"></th>
								<td>3</td>
								<td>16.0</td>
								<td></td>
							</tr>
							<tr class="text-center">
								<th><input type="checkbox"></th>
								<td>4</td>
								<td>16.0</td>
								<td></td>
							</tr>
							<tr class="text-center">
								<th><input type="checkbox"></th>
								<td>5</td>
								<td>17.0</td>
								<td></td>
							</tr>
							<tr class="text-center">
								<th><input type="checkbox"></th>
								<td>6</td>
								<td>17.0</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row">
						<div class="col">
							<p style="padding-top: 7px;">
								<button class="btn btn-dark" style="float: right;">저장</button>
							</p>
						</div>
					</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>
