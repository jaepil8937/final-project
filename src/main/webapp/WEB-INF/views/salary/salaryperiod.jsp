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
		white-space: nowrap; 
	}
	table {
		width: 100%;
	}
	thead {
		position: sticky; top:-1px; z-index: 1;
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
	#detail-table th:first-child, 
	#detail-table td:first-child {
		position: sticky; left:0;
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
					<li>기간별 급여 현황을 확인할 수 있습니다.</li>
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
						<button type="button" class="btn btn-danger btn-sm" id="btn-search">검색</button>
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
											<td colspan="5" class="text-center">급여기간을 선택하여 검색해주시기 바랍니다.</td>
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
									<th style="background-color: lightgray">기준년월</th>
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
									<th>장기요양보험</th>
									<th>고용보험</th>
								</tr>
							</thead>  
							<tbody>
								<c:choose>
									<c:when test="${empty periodDetailDtos }">
										<tr>
											<td colspan="15">급여기간을 선택하여 검색해주시기 바랍니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="detailDto" items="${periodDetailDtos.salaryDtoLists }">
											<tr>
												<td style="background-color: lightgray"><strong>${detailDto.baseYearMonth }</strong></td>
												<td><fmt:formatNumber value="${detailDto.baseSalary }"/></td>
												<td><fmt:formatNumber value="${detailDto.mealSalary }"/></td>
												<td><fmt:formatNumber value="${detailDto.overtimeSalary }"/></td>
												<td><fmt:formatNumber value="${detailDto.nightSalary }"/></td>
												<td><fmt:formatNumber value="${detailDto.holidaySalary }"/></td>
												<td><fmt:formatNumber value="${detailDto.careSalary }"/></td>
												<td><fmt:formatNumber value="${detailDto.businessSalary }"/></td>
												<td><fmt:formatNumber value="${detailDto.rewardSalary }"/></td>
												<td><fmt:formatNumber value="${detailDto.incomeTax }"/></td>
												<td><fmt:formatNumber value="${detailDto.residenceTax }"/></td>
												<td><fmt:formatNumber value="${detailDto.pension }"/></td>
												<td><fmt:formatNumber value="${detailDto.healthInsurance }"/></td>
												<td><fmt:formatNumber value="${detailDto.longtermInsurance }"/></td>
												<td><fmt:formatNumber value="${detailDto.employmentInsurance }"/></td>
											</tr>
										</c:forEach>	
									</c:otherwise>	
								</c:choose>
							</tbody>
							<tfoot>
								<tr>
									<th style="background-color: lightgray">합 계</th>
									<th><fmt:formatNumber value="${periodDetailDtos.baseSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.mealSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.overtimeSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.nightSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.holidaySalaryTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.careSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.businessSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.rewardSalaryTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.incomeTaxTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.residenceTaxTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.pensionTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.healthInsuranceTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.longtermInsuranceTtl }"/></th>
									<th><fmt:formatNumber value="${periodDetailDtos.employmentInsuranceTtl }"/></th>
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
$(function() {
	$("#btn-search").click(function() {
		let startdate = $("input[name=startdate]").val();
		if (startdate == "") {
			alert("급여시작기간을 선택하세요.");
			return false;
		}
		let enddate = $("input[name=enddate]").val();
		if (enddate == "") {
			alert("급여마감기간을 선택하세요.");
			return false;
		}
		$("#salary-search").trigger("submit");
	})	
})
</script>
</body>
</html>