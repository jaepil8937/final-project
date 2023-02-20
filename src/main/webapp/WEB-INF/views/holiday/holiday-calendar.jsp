<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
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
	<c:set var="menu" value="work" />
	<c:set var="side" value="holiday-calendar" />
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr35">
				<%@ include file="../common/sidebar.jsp"%>
			</div>
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<h1 class="fs-10 p-4">휴일달력</h1>
					</div>
				</div>
				<div class="row" style="margin-top: 24px;">
					<div class="shadow-none p-3 mb-5 bg-light rounded">
						<div class="container text-center">
							<form id="" method="post" action="" enctype="">
								<div class="row">
									<div class="col-3">
										<label for="start" style="padding-top: 12px;">근무년월: <input
											type="date" id="" name="" value="" min="2023-01-01"
											max="2023-12-31">
										</label>
									</div>
									<div class="col">
										<p style="padding-top: 7px;">
											<button class="btn btn-danger" style="float: right;">조회</button>
										</p>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 60px;">
					<div class="col-6">
						<div class="nav">
							<button class="btn btn-light" onclick="prevMonth()">&lt;</button>
							<button class="btn btn-light" onclick="nextMonth()">&gt;</button>
							<button class="btn btn-light" onclick="goToday()">오늘</button>
						</div>
					</div>
					<div class="col-6">
						<p>
							<button type="button" class="btn btn-light" style="float: right;">휴일추가</button>
						</p>
					</div>
					<div class="row" style="padding-right: 0px;">
						<table class="table table-bordered" style="margin-top: 16px;">
							<colgroup>
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
							</colgroup>
							<thead>
								<tr class="bg-light text-center">
									<th>일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th>토</th>
								</tr>
							</thead>
						</table>
					</div>
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
