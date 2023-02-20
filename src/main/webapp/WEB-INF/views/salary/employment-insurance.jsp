<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>고용보험 조회</title>
<style>
	.table {
		max-height: 420px; 
		overflow-y: scroll;
	}
	table {
		width: 100%;
	}
	thead {
		position: sticky; top:-1px; 
		background-color: lightgray; 
	}
	table th, table td {
		border: 1px solid black;
		padding: 5px;
		text-align: center;
	}
</style>
</head>
<body>
<c:set var="menu" value="pay" />
<%@ include file="../common/navbar.jsp" %>
<c:set var="side" value="national-pension" />
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12">
					<h2><strong>고용보험 조회</strong></h2>
					<li>사원별 고용보험 납입내역을 확인합니다.</li>
				</div>   
			</div>
			<div class="row mt-3">
				<div class="col-12">
				 	<ul class="nav nav-tabs">
						<li class="nav-item">
					    	<a class="nav-link" href="national-pension">국민연금</a>
					  	</li>
					    <li class="nav-item">
					    	<a class="nav-link" href="health-insurance">건강보험</a>
					    </li>
					    <li class="nav-item">
					    	<a class="nav-link active" href="employment-insurance">고용보험</a>
					    </li>
					</ul>
				</div>
			</div>	
			<div class="row mt-3">
				<div class="col-12">
					<form id="salary-search" class="row row-cols-sm-auto g-3 align-items-center float-end" action="/salary/salarycheck">
						<label>기준년도</label><input type="number" min="1900" max="2099" step="1" value="2023"  size="10"/> &nbsp; 
						<div class="col-12">
							<select class="form-select" name="opt">
								<option value="empName">성명</option>
								<option value="empNo">사원번호</option>
								<option value="dept">부서</option>
							</select>
						</div>
						<div class="col-12">
							<input type="text" class="form-control" size="10" name="keyword" value=""/>
						</div>	
						<div class="col-12">
							<button type="submit" class="btn btn-danger btn-sm" id="btn-search">검색</button>
						</div>
					</form>	
				</div>	
			</div>
			<div class="row mt-3">
				<div class="col-5">
					<h6><strong>기본정보</strong></h6>
				</div>
				<div class="col-7">
					<h6><strong>고용보험 납입내역</strong></h6>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-5">
					<div class="table" id="employee-info">
						<table>
							<thead>
								<tr>
									<th>사원번호</th>
									<th>성 명</th>
									<th>부 서</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1000</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1001</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1002</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1003</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1004</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1004</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1004</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1004</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1004</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1004</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1004</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1004</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-7">
					<div class="table" id="payment-detail">
						<table>
							<thead>
								<tr>
									<th>No</th>
									<th>납입일자</th>
									<th>기준소득월액</th>
									<th>요율(%)</th>
									<th>납입금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>2</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>3</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>4</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>					
		</div>	
	</div>	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>