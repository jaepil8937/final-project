<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>급여대장</title>
<style>
	.table {
		display: block;
		height: 420px;
		max-height: 420px; 
		overflow: scroll;
		white-space: nowrap;   <%-- 자식 엘리먼트가 한줄로 정렬되게 하는 요소 --%>
	}

	table {
		border-collapse: collapse; 
		border-spacing: 0; 
		width:100%;
	}
	
	thead th {
		position: sticky; top:0;
		background-color: lightgray;
	}
	
	tfoot th {
		position: sticky; bottom:0;
		background-color: lightgray;
	}
	
	table th, table td {
		border: 1px solid #c0c0c0; 
		padding: 5px;
		text-align: center;
	}	
	
</style>
</head>
<body>
<c:set var="menu" value="pay" />
<%@ include file="../common/navbar.jsp" %>
<c:set var="side" value="" />
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12">
					<h2><strong>급여대장</strong></h2>
					<li>급여테이블 리스트와 세부 급여정보를 한눈에 확인하고 관리할 수 있습니다.</li>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
				 	<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" href="salarybook">급여대장</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">기간별 급여현황조회</a>
					  </li>
					</ul>
				</div>
			</div>
			<div class="row mt-3 text-end">
				<div class="col-12">
					<label>급여년월</label> <input type="month" /> &nbsp; 
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
					<div class="table" border="3" id="salary-book">
						<table>
							<thead>
								<tr>
									<th>사원번호</th>
									<th>성명</th>
									<th>부서</th>
									<th>직책</th>
									<th>입사일</th>
									<th>퇴사일</th>
									<th>기본급</th>
									<th>식대</th>
									<th>연장수당</th>
									<th>야간수당</th>
									<th>휴일근무수당</th>
									<th>보육수당</th>
									<th>출장비</th>
									<th>상여금</th>
									<th>소득세</th>
									<th>주민세</th>
									<th>국민연금</th>
									<th>건강보험</th>
									<th>장기요양</th>
									<th>고용보험</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>부장</td>
									<td>2023.04.25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>부장</td>
									<td>2023.04.25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>부장</td>
									<td>2023.04.25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>부장</td>
									<td>2023.04.25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>부장</td>
									<td>2023.04.25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>부장</td>
									<td>2023.04.25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>부장</td>
									<td>2023.04.25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>부장</td>
									<td>2023.04.25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>	
							<tfoot>
								<tr>
									<th>합계</th>
									<th>지급총액</th>
									<th></th>
									<th>공제총액</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>		
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