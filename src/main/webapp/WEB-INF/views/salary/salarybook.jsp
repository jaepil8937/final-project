<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>급여대장</title>
<style>
	.table {
		max-height: 500px; 
		overflow: scroll;
		white-space: nowrap;  
		border-collapse: collapse; 
		border-spacing: 0; 
		width: 100%;
	}
	
	th:first-child, td:first-child {
		position: sticky; left:0;
	}
	
	th:nth-child(2), td:nth-child(2) {
		position: sticky; left:74px;
	}
	
	thead {
		position: sticky; top:0; z-index: 1;
		background-color: lightgray; 
	}
	
	tfoot {
		position: sticky; bottom:0;
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
					<h2><strong>급여대장</strong></h2>
					<li>전체 사원의 급여 지급 내역을 한눈에 확인할 수 있습니다.</li>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
				 	<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" href="salarybook">급여대장</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="salaryperiod">기간별 급여현황</a>
					  </li>
					</ul>
				</div>
			</div>
			<form id="salary-table" action="/salary/salarybook">
				<div class="row mt-3 text-end">
					<div class="col-12">
						<label>기준연월</label> <input type="month" name="basemonth" value="${param.basemonth }"/> &nbsp; 
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-12">
						<div class="table" border="3" id="salary-book">
							<table>
								<thead>
									<tr>
										<th style="background-color: lightgray">사원번호</th>
										<th style="background-color: lightgray">성명</th>
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
									<c:choose>
										<c:when test="${empty SalaryBookDto }">
											<tr>
												<td colspan="20" class="text-center">해당 정보가 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="salaryDto" items="${SalaryBookDto.salaryDtoLists }">	
												<tr>
													<td style="background-color: lightgray; font-weight: bold">${salaryDto.employeeNo }</td>
													<td style="background-color: lightgray; font-weight: bold">${salaryDto.name }</td>
													<td>${salaryDto.deptName }</td>
													<td>${salaryDto.positionName }</td>
													<td>${salaryDto.hireDate }</td>
													<c:choose>
														<c:when test="${empty salaryDto.retirementDate }">
															<td>-</td>
														</c:when>
														<c:otherwise>
															<td>${salaryDto.retirementDate }</td>
														</c:otherwise>
													</c:choose>
													<td><fmt:formatNumber value="${salaryDto.baseSalary }"/></td>
													<td><fmt:formatNumber value="${salaryDto.mealSalary }"/></td>
													<td><fmt:formatNumber value="${salaryDto.overtimeSalary }"/></td>
													<td><fmt:formatNumber value="${salaryDto.nightSalary }"/></td>
													<td><fmt:formatNumber value="${salaryDto.holidaySalary }"/></td>
													<td><fmt:formatNumber value="${salaryDto.careSalary }"/></td>
													<td><fmt:formatNumber value="${salaryDto.businessSalary }"/></td>
													<td><fmt:formatNumber value="${salaryDto.rewardSalary }"/></td>
													<td><fmt:formatNumber value="${salaryDto.incomeTax }"/></td>
													<td><fmt:formatNumber value="${salaryDto.residenceTax }"/></td>
													<td><fmt:formatNumber value="${salaryDto.pension }"/></td>
													<td><fmt:formatNumber value="${salaryDto.healthInsurance }"/></td>
													<td><fmt:formatNumber value="${salaryDto.longtermInsurance }"/></td>
													<td><fmt:formatNumber value="${salaryDto.employmentInsurance }"/></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>	
								<tfoot>
									<tr>
										<th colspan="2" style="background-color: lightgray">합 계</th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th><fmt:formatNumber value="${SalaryBookDto.baseSalaryTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.mealSalaryTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.overtimeSalaryTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.nightSalaryTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.holidaySalaryTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.careSalaryTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.businessSalaryTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.rewardSalaryTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.incomeTaxTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.residenceTaxTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.pensionTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.healthInsuranceTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.longtermInsuranceTtl }"/></th>
										<th><fmt:formatNumber value="${SalaryBookDto.employmentInsuranceTtl }"/></th>
									</tr>
								</tfoot>		
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(function() {
	$("input[name=basemonth]").change(function() {
		$("#salary-table").trigger("submit")
	})
})
</script>
</body>
</html>