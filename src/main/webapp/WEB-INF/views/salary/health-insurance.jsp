<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>건강보험 조회</title>
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
					<h2><strong>건강보험 조회</strong></h2>
					<li>사원별 건강보험 납입내역을 확인합니다.</li>
				</div>   
			</div>
			<div class="row mt-3">
				<div class="col-12">
				 	<ul class="nav nav-tabs">
						<li class="nav-item">
					    	<a class="nav-link" href="national-pension">국민연금</a>
					  	</li>
					    <li class="nav-item">
					    	<a class="nav-link active" href="health-insurance">건강보험</a>
					    </li>
					    <li class="nav-item">
					    	<a class="nav-link" href="employment-insurance">고용보험</a>
					    </li>
					</ul>
				</div>
			</div>	
			<div class="row mt-3">
				<div class="col-12">
					<form id="salary-search" class="row row-cols-sm-auto g-3 align-items-center float-end" action="/salary/health-insurance">
						<label>기준년도</label>
						<select name="baseYear" style="height: 36px"></select> &nbsp; 
						<div class="col-12">
							<select class="form-select" name="opt">
								<option value="empName" ${param.opt == 'empName' ? 'selected' : '' }>성명</option>
								<option value="empNo" ${param.opt == 'empNo' ? 'selected' : '' }>사원번호</option>
								<option value="dept" ${param.opt == 'dept' ? 'selected' : '' }>부서</option>
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
				<div class="col-5">
					<h6><strong>기본정보</strong></h6>
				</div>
				<div class="col-7">
					<h6><strong>건강보험 납입내역</strong></h6>
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
								<c:choose>
									<c:when test="${empty SalaryDtos}">
										<tr>
											<td colspan="3" class="text-center">해당 내역이 없습니다.</td> 
										</tr>	
									</c:when>	
									<c:otherwise>
										<c:forEach var="dto" items="${SalaryDtos }">
											<tr>
												<td>${dto.employeeNo }</td>
												<td><a href="" data-employee-no="${dto.employeeNo }" class="text-decoration-none"> ${dto.name }</a></td>
												<td>${dto.deptName }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>			
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-7">
					<div class="table" id="payment-detail">
						<table>
							<thead>
								<tr>
									<th>납입일자</th>
									<th>기준소득월액</th>
									<th>요율(%)</th>
									<th>납입금액</th>
								</tr>
							</thead>
							<tbody>
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
<script>
$(function() {
	
	// 기준년도 선택
	const params = new Proxy (new URLSearchParams(window.location.search), {
		get: (searchParams, prop) => searchParams.get(prop),
	});
	
	let baseYear = params.baseYear || new Date().getFullYear();
	let currentYear = new Date().getFullYear();
	
	for (let count=0; count<10; count++) {
		
		let option = `<option value="\${currentYear}" \${baseYear == currentYear ? 'selected':''}> \${currentYear}년</option>`
		$("select[name=baseYear]").append(option);
		currentYear--;
	}
	
 	$("select[name=baseYear]").change(function() {
		$("#salary-search").trigger("submit")
	}) 
	
	// 사원 클릭시
	$("#employee-info a[data-employee-no]").click(function(event) {
		
		let $tbody = $("#payment-detail table tbody").empty();
		
		event.preventDefault();
		$(this).closest("tr").addClass("table-primary")
			   .siblings().removeClass("table-primary");
		let no = $(this).attr('data-employee-no');
		let year = $("select[name=baseYear]").val();
		$.ajax({
			type : 'GET',
			url: '/salary/contributionDetail',
			data: {empNo : no, baseYear : year},
			dataType: 'json',
			success: function(healthArray) {
				$.each(healthArray, function(index, health) {
					let tr = `
						<tr>
							<td>\${health.payDate}</td>
							<td>\${health.baseIncome.toLocaleString()}</td>
							<td>\${health.healthEmployeeRate.toLocaleString()}</td>
							<td>\${health.healthInsurance.toLocaleString()}</td>
						</tr>
					`;
					$tbody.append(tr);
				})
			}
		})
		
	})
})
</script>
</body>
</html>