<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>애플리케이션</title>
</head>
<style>
</style>
<body>
	<c:set var="menu" value="work" />
	<c:set var="side" value="holiday-setting" />
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr35">
				<%@ include file="../common/sidebar.jsp"%>
			</div>
			<div class="col-10">
				<div class="row mb-3">
					<div class="col">
						<h2>휴일일괄설정</h2>
					</div>
				</div>
				<hr>
				<div class="row" style="margin-top: 24px;">
					<div class="shadow-none p-3 mb-5 bg-light rounded">
						<div class="container text-center">
							<form id="" method="get" action="/holiday/holiday-setting">
								<div class="row">
									<div class="col-4">
										<label for="start" style="padding-top: 12px;">기간: <input
											type="text" name="daterange" value="" size="22" />
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
				<div class="row">
					<div class="col-3 text-left">
						<p>
							<i class="bi bi-arrow-right-square-fill text-danger"></i>
							<strong>휴일일괄설정</strong>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-6 text-left mb-1">
						<p>
							<button type="button" class="btn btn-light" style="float: left;">엑셀파일 불러오기</button>
						</p>
					</div>
					<div class="col-6">
						<p>
							<button type="button" class="btn btn-light" style="float: right;">엑셀파일다운</button>
						</p>
					</div>
					<div class="row" style="padding-right: 0px;">
						<table class="table" style="margin-top: 16px;">
							<thead>
							<colgroup>
								<col width="5%">
								<col width="5%">
								<col width="10%">
								<col width="40%">
								<col width="40%">
							</colgroup>
							<tr class="bg-light text-center">
								<th></th>
								<th>기준일자</th>
								<th>휴일명</th>
								<th>일자구분</th>
								<th>휴일구분</th>
							</tr>
							</thead>
							<tbody>
								<tr class="text-center">
									<th><input type="checkbox"></th>
									<td><label for="start"><input type="date" id=""
											name="" value="" min="2023-01-01" max="2023-12-31"
											style="padding-left: 50px; padding-right: 50px;"> </label></td>
									<td><input type="name" id="text" value="" size="21"></td>
									<td><select class="form-select form-select-sm"
										aria-label=".form-select-sm example">
											<option selected>일자구분</option>
											<option value="1">무급휴일</option>
											<option value="2">유급휴일</option>
									</select></td>
									<td><select class="form-select form-select-sm"
										aria-label=".form-select-sm example">
											<option selected>휴일구분</option>
											<option value="1">법정공휴일</option>
											<option value="2">대체공휴일</option>
											<option value="3">회사공휴일</option>
									</select></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col">
							<p style="padding-top: 7px;">
								<button class="btn btn-dark" style="float: right;">저장</button>
								<button class="btn btn-danger"
									style="float: right; margin-right: 5px;">삭제</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script>
	$(function() {
		$('input[name="daterange"]').daterangepicker(
				{
					"locale" : {
						"format" : "YYYY-MM-DD",
						"separator" : " ~ ",
						"applyLabel" : "확인",
						"cancelLabel" : "취소",
						"fromLabel" : "From",
						"toLabel" : "To",
						"customRangeLabel" : "Custom",
						"weekLabel" : "W",
						"daysOfWeek" : [ "월", "화", "수", "목", "금", "토",
								"일" ],
						"monthNames" : [ "1월", "2월", "3월", "4월", "5월",
								"6월", "7월", "8월", "9월", "10월", "11월",
								"12월" ],
						"firstDay" : 1
					},
					"startDate" : "2023-01-01",
					"endDate" : "2023-12-31",
					"drops" : "down"
				},
				function(start, end, label) {
					console.log('New date range selected: '
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD')
							+ ' (predefined range: ' + label + ')');
				});
	});
</script>
</body>
</html>
