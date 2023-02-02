<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<c:set var="side" value="test" />
<%@ include file="../common/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr-3">
				<%@ include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-10">
				<div class="row">
					<h1>휴가일수조회</h1>
					<hr>
				</div>
			<form>
				<div class="mb-2 text-end">
					<label class="form-label">근태구분</label>
						<select style="width: 150px">
							<option>전체</option>
							<option>연차</option>
							<option>병가</option>
						</select>
						<button type="button" class="btn btn-dark btn-sm text-end" id="btn-search-postcode">검색</button>
				</div>
				</form>
				<div class="row">
					<div class="col-3 text-left">
						<p>
							<i class="bi bi-arrow-right-square "></i>
							근속연수별 휴가 설정
						</p>
					</div>
					<div class="col-9 text-end">
						<button>행추가</button>
					</div>
				</div>
				<div class="row">
					<table class="table table-sm border-top">
						<colgroup>
							<col width="5%">
							<col width="7%">
							<col width="7%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="*">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th><input type="checkbox"></th>
								<th>구분</th>
								<th>코드</th>
								<th>명칭</th>
								<th>연차반영</th>
								<th>사용여부</th>
								<th>유급반영</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								<td><input type="checkbox"></td>
								<td>휴가</td>
								<td>00</td>
								<td>휴가(연차)</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
								<td><input type="text" class="form-control form-control-xs w-100"></td>
							</tr>
							<tr class="text-center">
								<td><input type="checkbox"></td>
								<td>휴가</td>
								<td>00</td>
								<td>휴가(연차)</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
								<td><input type="text" class="form-control form-control-xs w-100"></td>
							</tr>
							<tr class="text-center">
								<td><input type="checkbox"></td>
								<td>휴가</td>
								<td>00</td>
								<td>휴가(연차)</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
								<td><input type="text" class="form-control form-control-xs w-100"></td>
							</tr>												
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col text-end">
						<button>저장</button>
					</div>
				</div>
			</div>	
		</div>
		<div class="row">
			<hr>
			<p>
				<i class="bi bi-exclamation-circle-fill"></i>
				코드는 휴가신청시 사용하는 항목을 등록합니다. 코드를 설정하셔야 휴가신청을 진행할 수 있습니다.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;예)연차(년차), 병가, 경조휴가 등
			</p>
			<p>
				<i class="bi bi-exclamation-circle-fill"></i>
				코드 등록시 연차 반영이 선택되어 있는 코드는 휴가 신청의 휴가 일수를 결재 완료시 사용 연차에 "+"를 해줍니다.
			</p>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>