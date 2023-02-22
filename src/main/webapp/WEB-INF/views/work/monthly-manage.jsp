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
<body>
<c:set var="menu" value="attendences" />
<c:set var="side" value="monthly-manage" />
<%@ include file="../common/navbar.jsp" %>
<div class="container my-3">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
				<div class="col">
					<h1 class="fs-10 p-4" style="font-weight: bold;">월간근태관리</h1>
				</div>
			</div>
			<hr>
		<div class="row mb-3 p-4 bg-light">
			<div class="col-12">
				<label for="month" style="padding-top: 12px;">근무년월: <input
						   type="month" id="currentMonth" name="month-work" value="" min="" max="2023-12-31">
				</label>&emsp;
					<%-- 부서, 직급, 호봉별로 조회하는 것도 나중에 가능하면 추가하기 --%>
				<button type="button" class="btn btn-danger btn-sm">조회</button>
			</div>
		</div>	
		<div class="row">
			<div class="col-6 text-left mb-1">
				<p>
					<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>월근태사용정보</strong>
				</p>
			</div>
		</div>
		<div class="row">
		<div class="col-6">
			<div class="card">
				<div class="card-header" style="font-weight: bold;">월근태 사용정보</div>
				<div class="card-body">
				<div class="text-start align="right">
						<button class="btn btn-secondary btn-sm id="btn-down">월근태엑셀다운로드</button>
					</div>
					<table class="table" id="table-month-list">
						<colgroup>
								<col width="20%">
								<col width="18%">
								<col width="18%">
								<col width="18%">
								<col width="15%">
							</colgroup>
						<thead>
							<tr>
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
								<th>호봉</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1001</td>
								<td>홍길동</td>
								<td>사원</td>
								<td>개발팀</td>
								<td>0</td>
							</tr>
						</tbody>
					</table>
					<div class="text-end">
						<button class="btn btn-dark btn-sm" id="btn-close">마감</button>
					</div>
				<p>
					<i class="bi bi-exclamation-circle-fill"></i>
					월 근태 정보를 확인하세요.<br>
					<i class="bi bi-exclamation-circle-fill"></i>
					총근무일수는 평일근무일수와 휴일근무일수를 합한 일수입니다.<br>
					<i class="bi bi-exclamation-circle-fill"></i>
					휴가사용일수는 연차 사용에 반영되는 일수입니다.<br>
					<i class="bi bi-exclamation-circle-fill"></i>
					기타휴가일수는 연차 사용에 반영되지 않는 일수입니다.
				</p>
				</div>
			</div>
		</div>
			<div class="col-6">
				<div class="card">
					<div class="card-header" style="font-weight: bold;">월근태일수</div>
					<div class="card-body">
						<table class="table" id="table-month-day">
							<colgroup>
								<col width="30%">
								<col width="20%">
								<col width="30%">
								<col width="20%">
							</colgroup>
						<tbody>
							<tr>
								<th>총근무일수</th>
								<td id="">20</td>
								<th>평일근무일수</th>
								<td id="">20</td>
							</tr>
							<tr>
								<th>휴일근무일수</th>
								<td id="">0</td>
								<th>휴가사용일수</th>
								<td id="">0</td>
							</tr>
							<tr>
								<th>기타휴가일수</th>
								<td id="">0</td>
								<th>결근일수</th>
								<td id="">0</td>
							</tr>
						</tbody>
					</table>
					</div>
					<div class="card-header" style="font-weight: bold;">월근태시간</div>
					<div class="card-body">
					<table class="table" id="table-month-time">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tbody>
							<tr>
								<th>평일연장</th>
								<td id="">01:00</td>
								<th>평일야간</th>
								<td id="">00:00</td>
							</tr>
							<tr>
								<th>휴일근로</th>
								<td id="">00:00</td>
								<th>휴일연장</th>
								<td id="">00:00</td>
							</tr>
							<tr>
								<th>휴일야간</th>
								<td id="">00:00</td>
								<th>지각</th>
								<td id="">00:00</td>
							</tr>
							<tr>
								<th>조퇴</th>
								<td id="">00:00</td>
							</tr>
						</tbody>
					</table>
					<div class="text-end">
							<%-- 수정폼사용하거나 페이지에서 바로 수정 --%>
						<button class="btn btn-success btn-sm disabled" id="btn-modify">수정</button>
						<button class="btn btn-primary btn-sm disabled" id="btn-save">저장</button>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
</div>			
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
document.getElementById('currentMonth').value= 
	new Date().toISOString().slice(0, 7);
</script>
</body>
</html>