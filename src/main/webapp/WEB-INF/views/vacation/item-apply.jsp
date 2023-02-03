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
<c:set var="side" value="item-apply" />
<%@ include file="../common/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr-3">
				<%@ include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-10">
				<div class="row mb-3">
					<h2>휴가신청/취소</h2>
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
						<strong>휴가사용현황</strong>
					</p>
				</div>
			</div>
			<form>
				<div class="row">
					<table class="table table-bordered table-hover table-striped table-sm">
						<colgroup>
							<col width="3%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="5%">
							<col width="7%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>No</th>
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
								<th>일수</th>
								<th>휴가구분</th>
								<th>신청일</th>
								<th>시작일</th>
								<th>종료일</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								<td>1</td>
								<td>1001</td>
								<td>홍길동</td>
								<td>사원</td>
								<td>개발팀</td>
								<td>1</td>
								<td>연차</td>
								<td>2022-01-15</td>
								<td>2022-01-17</td>
								<td>2022-01-20</td>
							</tr>
							<tr class="text-center">
								<td>2</td>
								<td>1001</td>
								<td>홍길동</td>
								<td>사원</td>
								<td>개발팀</td>
								<td>1</td>
								<td>연차</td>
								<td>2022-01-15</td>
								<td>2022-01-17</td>
								<td>2022-01-20</td>
							</tr>
							<tr class="text-center">
								<td>3</td>
								<td>1001</td>
								<td>홍길동</td>
								<td>사원</td>
								<td>개발팀</td>
								<td>1</td>
								<td>연차</td>
								<td>2022-01-15</td>
								<td>2022-01-17</td>
								<td>2022-01-20</td>
							</tr>												
						</tbody>
					</table>
				</div>
				<div class="row mb-2 bg-light m-2">
						<hr>
						<div class="col">
						<p>
							<i class="bi bi-exclamation-circle-fill"></i>
							휴가신청에서 결재상태가 "승인"된 휴가만 조회됩니다. 
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