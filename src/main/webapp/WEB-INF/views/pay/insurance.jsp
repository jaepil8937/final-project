<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<title>인사관리시스템</title>
</head>
<body>
<c:set var="menu" value="pay" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10 mb-3">
			<div class="row mb-3">
				<div class="col-12">
					<h1>4대보험 요율표</h1>
				</div>
			</div>	
			<form>
				<c:forEach var="insurance" items="${insurance }">
					<div class="col-12 border" >
						<div class="border p-2 bg-light" >기준년도
						<select>	
							<option value="${insurance.year}">${insurance.year}</option>
						</select>
						</div>
					</div>	
					<div class="row mb-3">
						<div class="col-12 text-center">
							<table class="table table-bordered">
								<tr>
									<th rowspan="2" class="bg-light">국민연금</th>
									<th class="bg-light">요율</th>
									<th class="bg-light">개인부담분</th>
									<td>${insurance.pensionEmployeeInsurance } %</td>
									<th class="bg-light">회사부담금</th>
									<td>${insurance.pensionCompanyInsurance } %</td>
								</tr>
								<tr>
									<th class="bg-light">기준소득월액</th>
									<th class="bg-light">하한금액</th>
									<td><fmt:formatNumber value="${insurance.minSalary }" /> 원</td>
									<th class="bg-light">상한금액</th>
									<td><fmt:formatNumber value="${insurance.maxSalary }" /> 원</td>
								</tr>
								<tr>
									<th rowspan="2" class="bg-light">건강보험</th>
									<th class="bg-light">요율</th>
									<th class="bg-light">개인부담분</th>
									<td>${insurance.healthEmployeeInsurance } %</td>
									<th class="bg-light">회사부담금</th>
									<td>${insurance.healthCompanyInsurance }%</td>
								</tr>
								<tr>
									<th class="bg-light">장기요양보험</th>
									<th class="bg-light">개인부담분</th>
									<td>${insurance.longtermEmployeeInsurance } %</td>
									<th class="bg-light">회사부담금</th>
									<td>${insurance.longtermCompanyInsurance } %</td>
								</tr>
								<tr>
									<th class="bg-light">고용보험</th>
									<th class="bg-light">요율</th>
									<th class="bg-light">개인부담분</th>
									<td>${insurance.employmentEmployeeInsurance } %</td>
									<th class="bg-light">회사부담금</th>
									<td>${insurance.employmentCompanyInsurance } %</td>
								</tr>
								<tr>
									<th class="bg-light">산재보험</th>
									<th class="bg-light">요율</th>
									<th class="bg-light">회사부담금</th>
									<td>${insurance.industrialCompanyInsurance } %</td>
									<td colspan="2">회사 규정마다 다름</td>
								</tr>
							</table>
						</div>	
					</div>
				</c:forEach>
			</form>
		</div>	
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>