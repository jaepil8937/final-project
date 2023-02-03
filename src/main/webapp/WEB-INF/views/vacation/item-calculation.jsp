<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
</head>
<body>
<c:set var="side" value="item-calculation" />
<%@ include file="../common/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr-3">
				<%@ include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-10">
				<div class="row mb-3">
					<h2>휴가일수조회</h2>
				</div>
				<hr>
			<form>
				<div class="row mb-3 bg-light p-4">
					<div>
						<label class="form-label"><strong>기준년도</strong></label>
						<input type="text" id="datepicker" >
						<label class="form-label"><strong>검색어</strong></label>
						<select>
							<option>사원번호</option>
							<option>성명</option>
						</select>
						<input type="text" />
						<button type="button" class="btn btn-danger" style="float:right;" id="btn-search">검색</button>
					</div>
				</div>
			</form>
			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>휴가일수조회</strong>
					</p>
				</div>
			</div>
			<form>
				<div class="row">
					<table class="table table-bordered table-hover table-striped table-sm">
						<colgroup>
							<col width="10%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="12%">
							<col width="12%">
							<col width="7%">
							<col width="7%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
								<th>입사일자</th>
								<th>근속기준일</th>
								<th>근속년수</th>
								<th>근속연차</th>
								<th>사용연차</th>
								<th>잔여연차</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								<td>1001</td>
								<td>홍길동</td>
								<td>사원</td>
								<td>개발팀</td>
								<td>2011-04-01</td>
								<td>2021-12-31</td>
								<td>1</td>
								<td>15</td>
								<td>3</td>
								<td>12</td>
							</tr>
							<tr class="text-center">
								<td>1001</td>
								<td>홍길동</td>
								<td>사원</td>
								<td>개발팀</td>
								<td>2011-04-01</td>
								<td>2021-12-31</td>
								<td>1</td>
								<td>15</td>
								<td>3</td>
								<td>12</td>
							</tr>
							<tr class="text-center">
								<td>1001</td>
								<td>홍길동</td>
								<td>사원</td>
								<td>개발팀</td>
								<td>2011-04-01</td>
								<td>2021-12-31</td>
								<td>1</td>
								<td>15</td>
								<td>3</td>
								<td>12</td>
							</tr>														
						</tbody>
					</table>
				</div>
				<div class="row mb-2 bg-light m-2">
						<hr>
						<div class="col">
						<p>
							<i class="bi bi-exclamation-circle-fill"></i>
							관리자가 아닌 사원들은 자신의 휴가일수 정보만 조회가 가능합니다.
						</p>
						</div>
				</div>
				<div class="row">
					<div class="col text-end">
						<button type="submit" class="btn btn-dark" style="float:right;" id="">저장</button>
					</div>
				</div>
				</form>
			</div>	
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
</script>
</body>
</html>