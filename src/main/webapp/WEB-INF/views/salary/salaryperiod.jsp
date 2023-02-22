<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>기간별 급여현황</title>
<style>
	#total-table {
		max-height: 200px; 
		overflow-y: scroll;
	}
	#detail-table {
		max-height: 300px; 
		overflow: scroll;
		white-space: nowrap;   <%-- 자식 엘리먼트가 한줄로 정렬되게 하는 요소 --%>
	}
	table {
		width: 100%;
	}
	thead {
		position: sticky; top:-1px; 
		background-color: lightgray; 
	}
	tfoot {
		position: sticky; bottom: -1px;
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
<c:set var="side" value="salary-book" />
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12">
					<h2><strong>기간별 급여현황</strong></h2>
					<li>연간 급여 내역을 급여년월 기간을 지정하여 조회합니다.</li>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
				 	<ul class="nav nav-tabs">
						<li class="nav-item">
					    	<a class="nav-link" href="salarybook">급여대장</a>
					  	</li>
					    <li class="nav-item">
					    	<a class="nav-link active" href="salaryperiod">기간별 급여현황</a>
					    </li>
					</ul>
				</div>
			</div>
			<div class="row mt-3 text-end">
				<div class="col-12">
					<form id="salary-search" action="/salary/salaryperiod">
						<label>급여기간</label> <input type="date" name="startdate" value="${param.startdate }"/> ~ 
						<input type="date" name="enddate" value="${param.enddate }"/> &nbsp; 
						<button type="submit" class="btn btn-danger btn-sm" id="btn-search">검색</button>
					</form>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
					<h6><strong>급여총계</strong></h6>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="table" id="total-table">
						<table>
							<thead>
								<tr>
									<th>사원번호</th>
									<th>성 명</th>
									<th>지급총액</th>
									<th>공제총액</th>
									<th>실지급액</th>
								</tr>
							</thead>  
							<tbody>
								<c:choose>
									<c:when test="${empty SalaryPeriodSumDto }">
										<tr>
											<td colspan="5" class="text-center">급여 내역이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="dto" items="${SalaryPeriodSumDto.salaryPeriodDtos }">
											<tr>
												<td>${dto.employeeNo }</td>
												<td>${dto.name }</td>
												<td><fmt:formatNumber value="${dto.totalSalary }"/></td>
												<td><fmt:formatNumber value="${dto.deductionSalary }"/></td>
												<td><fmt:formatNumber value="${dto.realSalary }"/></td>
											</tr>
										</c:forEach>	
									</c:otherwise>
								</c:choose>
							</tbody>
							<tfoot>
								<tr>
									<th colspan="2">합&emsp;&emsp;계</th>
									<th><fmt:formatNumber value="${SalaryPeriodSumDto.totalSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${SalaryPeriodSumDto.reductionSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${SalaryPeriodSumDto.realSalaryTtl }"/></th>
								</tr>
							</tfoot>
						</table>
					</div>	
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
					<h6><strong>급여 상세내역</strong></h6>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="table" id="detail-table">
						<table>
							<thead>
								<tr>
									<th>순번</th>
									<th>지급공제명</th>
									<th>2023.01</th>
									<th>2023.02</th>
									<th>2023.03</th>
									<th>2023.04</th>
									<th>2023.05</th>
									<th>2023.06</th>
								</tr>
							</thead>  
							<tbody>
								<tr>
									<td>1</td>
									<td>기본급</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>2</td>
									<td>식대</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>3</td>
									<td>연장수당</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>4</td>
									<td>야간수당</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>5</td>
									<td>휴일근무수당</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>6</td>
									<td>보육수당</td>
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
									<th>지급합계</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
								<tr>
									<th>공제합계</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
								<tr>
									<th>실지급합계</th>
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
<script>
</script>
</body>
</html>