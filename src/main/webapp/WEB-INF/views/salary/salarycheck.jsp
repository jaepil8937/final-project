<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>급여조회</title>
</head>
<style>
    table th, table td {
		border: 1px solid #c0c0c0;
		text-align: center;
		height: 35px;
	}	
	
	thead, tfoot {
		background-color: lightgray;
		width: 1070px;
	}
	
	#salary-list tbody {
		display: block;
		height: 225px;
		max-height: 225px;
		overflow-y: scroll; 
		width: 1072px;
	}
	
	#salary-list thead, #salary-list tfoot, #salary-list tbody tr {
		display: table;
		width: 100%;
		table-layout: fixed;
	}
</style>
<body>
<c:set var="menu" value="pay" />
<%@ include file="../common/navbar.jsp" %>
<c:set var="side" value="salary-check" />
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
	
		<div class="col-10">
			<div class="row">
				<div class="col-12">
					<h2><strong>급여조회</strong></h2>
					<li>급여내역을 기준연월, 성명, 사원번호, 부서명으로 검색할 수 있습니다.</li>
				</div>
			</div>
			<hr>
			<div class="row mt-3">
				<div class="col-12">
					<form id="salary-search" class="row row-cols-sm-auto g-3 align-items-center float-end" action="/salary/salarycheck">
						<label>기준연월</label> <input type="month" name="basemonth" value="${param.basemonth }"/> &nbsp; 
						<div class="col-12">
							<select class="form-select" name="opt">
								<option value="empName" ${param.opt == 'empName' ? 'selected' : '' }>성명</option>
								<option value="empNo" ${param.opt == 'empNo' ? 'selected' : '' }>사원번호</option>
								<option value="dept" ${param.opt == 'dept' ? 'selected' : '' }>부서명</option>
							</select>
						</div>
						<div class="col-12">
							<input type="text" class="form-control" size="10" name="keyword" value="${param.keyword }"/>
						</div>	
						<div class="col-12">
							<button type="submit" class="btn btn-danger btn-sm" id="btn-search">검색</button>
						</div>
					</form>	
				</div>	
			</div>	
			<div class="row mt-3">
			<h6><strong>급여목록</strong></h6>
				<div class="col-12 text-end">
			        <table class="table" border="3" id="salary-list">
						<thead>
							<tr>
								<th style="width:150.51px">급여지급일</th>
								<th style="width:150.51px">사원번호</th>
								<th style="width:150.51px">성 명</th>
								<th style="width:150.51px">부 서</th>
								<th style="width:150.51px">지급총액</th>
								<th style="width:150.51px">공제총액</th>
								<th>실지급액</th>
							</tr>
						</thead>  
						<tbody>
							<c:choose>
								<c:when test="${empty TableDto }">
									<tr>
										<td colspan="7" class="text-center">급여 내역이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>	
									<c:forEach var="salaryDto" items="${TableDto.salaryDtoLists }">
										<tr>
											<td id="pay-date">${salaryDto.payDate }</td>
											<td>${salaryDto.employeeNo }</td>
											<td>${salaryDto.name }</a></td>
											<td>${salaryDto.deptName }</td>
											<td><fmt:formatNumber value="${salaryDto.totalSalary }" /></td>
											<td><fmt:formatNumber value="${salaryDto.deductionSalary }" /></td>
											<td><fmt:formatNumber value="${salaryDto.realSalary }" /></td>
										</tr>
									</c:forEach>	
								</c:otherwise>	
							</c:choose>		
						</tbody>
						<tfoot>
							<tr>
								<th colspan="4" style="width:602.04px">합 &emsp;&emsp;&emsp;계</th>
								<th style="width:150.51px"><fmt:formatNumber value="${TableDto.totalSalary }" /></th>
								<th style="width:150.51px"><fmt:formatNumber value="${TableDto.deductionSalary }" /></th>
								<th><fmt:formatNumber value="${TableDto.realSalary }" /></th>
							</tr>
						</tfoot>	
					</table>
				</div>
			</div>	
			<div class="row mt-3">
				<h6><strong>급여명세서</strong></h6>
				<div class="col-12">
					<table class="table" border="3" id="salary-detail">
						<colgroup>  
								<col width="10%">
								<col width="22%">
								<col width="23%">
								<col width="22%">		
								<col width="23%">		
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th colspan="2">지급항목</th>
								<th colspan="2">공제항목</th>
							</tr>
						</thead>  
						<tbody>
							<tr>
								<td>1</td>
								<td>기본급</td>
								<td id="base-salary"></td>
								<td>소득세</td>
								<td id="income-tax"></td>
							</tr>
							<tr>
								<td>2</td>
								<td>식대</td>
								<td id="meal-salary"></td>
								<td>주민세</td>
								<td id="residence-tax"></td>
							</tr>
							<tr>
								<td>3</td>
								<td>연장수당</td>
								<td id="overtime-salary"></td>
								<td>국민연금</td>
								<td id="national-pension"></td>
							</tr>
							<tr>
								<td>4</td>
								<td>야간수당</td>
								<td id="night-salary"></td>
								<td>건강보험</td>
								<td id="health-insurance"></td>
							</tr>
							<tr>
								<td>5</td>
								<td>휴일근무수당</td>
								<td id="holiday-salary"></td>
								<td>장기요양보험</td>
								<td id="longterm-insurance"></td>
							</tr>
							<tr>
								<td>6</td>
								<td>보육수당</td>
								<td id="care-salary"></td>
								<td>고용보험</td>
								<td id="employment-insurance"></td>
							</tr>
							<tr>
								<td>7</td>
								<td>출장비</td>
								<td id="business-salary"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>8</td>
								<td>상여금</td>
								<td id="reward-salary"></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th>합 &emsp;계</th>
								<th>지급총액</th>
								<th id="total-salary"></th>
								<th>공제총액</th>
								<th id="deduction-salary"></th>
							</tr>
						</tfoot>	
					</table>
				</div>
			</div>
		</div>
	</div>			
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(function() {
	
	$("input[name=basemonth]").change(function() {
		$("#salary-search").trigger("submit")
	})
	
	$("#salary-list tr").click(function(event) {
		clearTable();
		event.preventDefault();
		let tr = $(this);
		tr.addClass("table-primary").siblings().removeClass("table-primary");
		
		let no = $(this).find("td:nth(1)").text();
		let date = $(this).find("td:nth(0)").text();
	
		$.getJSON('/salary/salaryDetail', {empNo : no, paydate : date}, function(salary) { 
			let baseSalary = new Number(salary.baseSalary).toLocaleString()
			$("#base-salary").text(baseSalary);
			let incomeTax = new Number(salary.incomeTax).toLocaleString()
			$("#income-tax").text(incomeTax);
			let mealSalary = new Number(salary.mealSalary).toLocaleString()
			$("#meal-salary").text(mealSalary);
			let residenceTax = new Number(salary.residenceTax).toLocaleString()
			$("#residence-tax").text(residenceTax);
			let overtimeSalary = new Number(salary.overtimeSalary).toLocaleString()
			$("#overtime-salary").text(overtimeSalary);
			let pension = new Number(salary.pension).toLocaleString()
			$("#national-pension").text(pension);
			let nightSalary = new Number(salary.nightSalary).toLocaleString()
			$("#night-salary").text(nightSalary);
			let healthInsurance = new Number(salary.healthInsurance).toLocaleString()
			$("#health-insurance").text(healthInsurance);
			let holidaySalary = new Number(salary.holidaySalary).toLocaleString()
			$("#holiday-salary").text(holidaySalary);
			let longtermInsurance = new Number(salary.longtermInsurance).toLocaleString()
			$("#longterm-insurance").text(longtermInsurance);
			let careSalary = new Number(salary.careSalary).toLocaleString();
			$("#care-salary").text(careSalary);
			let employmentInsurance = new Number(salary.employmentInsurance).toLocaleString()
			$("#employment-insurance").text(employmentInsurance);
			let businessSalary = new Number(salary.businessSalary).toLocaleString()
			$("#business-salary").text(businessSalary);
			let rewardSalary = new Number(salary.rewardSalary).toLocaleString()
			$("#reward-salary").text(rewardSalary);
			let totalSalary = new Number(salary.totalSalary).toLocaleString()
			$("#total-salary").text(totalSalary);
			let deductionSalary = new Number(salary.deductionSalary).toLocaleString()
			$("#deduction-salary").text(deductionSalary);
		})
	})
	
	function clearTable() {
		$("#base-salary").text(0);
		$("#income-tax").text(0);
		$("#meal-salary").text(0);
		$("#residence-tax").text(0);
		$("#overtime-salary").text(0);
		$("#national-pension").text(0);
		$("#night-salary").text(0);
		$("#health-insurance").text(0);
		$("#holiday-salary").text(0);
		$("#longterm-insurance").text(0);
		$("#care-salary").text(0);
		$("#employment-insurance").text(0);
		$("#business-salary").text(0);
		$("#reward-salary").text(0);
		$("#total-salary").text(0);
		$("#deduction-salary").text(0);
	}
})
</script>
</body>
</html>