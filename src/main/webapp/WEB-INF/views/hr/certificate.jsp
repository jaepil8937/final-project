<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>증명서발급</title>
<style type="text/css">
	.table-scroll tbody {
    	display:block !important;
    	max-height:300px !important;
    	overflow-y:auto !important;				/* auto <-> scroll */
	}
	.table-scroll thead, .table-scroll tbody tr {
    	display:table !important;
    	width:100% !important;
    	table-layout:fixed !important;
	}	
	
	.table-scroll thead {
		width: 1073px !important;
	}
	.table-scroll {
		width: 1077px !important;
	}
</style>
</head>
<body>
<c:set var="menu" value="employee" />
<c:set var="side" value="" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
   <div class="row">
   		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12 mb-3">
					<h3><p class="fw-bold">증명서발급</p></h3>
				</div>
				<div class="col-12 mb-3">
					<form method="get" action="">
						<div class="border p-3 bg-white">
							<label>증명서구분</label>
							<select name="sort">
								<option value="proof" ${param.sort eq 'proof' ? 'selected' : '' }>재직증명서</option>
								<option value="career" ${param.sort eq 'career' ? 'selected' : '' }>경력증명서</option>
								<option value="withholding" ${param.sort eq 'withholding' ? 'selected' : '' }>원천징수영수증</option>
								<option value="income" ${param.sort eq 'income' ? 'selected' : '' }>각종근로소득증명서</option>
								<option value="payslip" ${param.sort eq 'payslip' ? 'selected' : '' }>급여명세서</option>
							</select>
							<label>신청일자</label>
							<input type="date" name="startDate" value="${param.startDate }">~<input type="date" name="endDate" value="${param.endDate }">
							<button type="submit" class="btn btn-dark float-end">검색</button>
						</div>
					</form>
				</div>
				<div class="row">
					<div class="col-12">
						<h6 class="mt-3 mb-3">
							<strong>증명서신청내역</strong>
						</h6>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
					<table class="table table-light table-scroll">
						<thead>
							<tr class="table-primary text-center">
								<th></th>
								<th>신청번호</th>
								<th>증명서구분</th>
								<th>신청일자</th>
								<th>사원번호</th>
								<th>성명</th>
								<th>발행상태</th>
								<th>발행일자</th>
								<th>용도</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty items }">
									<tr>
										<td id="item-nothing" colspan="12" class="text-center">목록이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="certificate" items="${certificates }">
										<tr class="text-center">
											<td><input type="checkbox" /></td>
											<td>${certificate.requestNo }</td>
											<td>${certificate.type }</td>
											<td>${certificate.requestDate }</td>
											<td>${certificate.no }</td>
											<td>${certificate.name }</td>
											<td>${certificate.requestStatus }</td>
											<td>${certificate.publishDate }</td>
											<td>${certificate.purpose }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-12">
						<h6 class="mt-3 mb-3">
							<strong>증명서신청</strong>
						</h6>
					</div>	
				</div>
				<div id="box-register-form" class="row d-none">
					<div class="col-12">
						<form id="register-form" class="border bg-light p-3">
							<table class="table table-light text-center">
									<tr>
										<th class="table-primary">신청번호</td>
										<td>20230101</td>
										<th class="table-primary">증명서구분</td>
										<td>재직증명서</td>
										<th class="table-primary">신청일자</td>
										<td>2020-02-10</td>
									<tr>
									<tr>
										<th class="table-primary">사원번호</td>
										<td>1000</td>
										<th class="table-primary">성명</td>
										<td>홍길동</td>
										<th class="table-primary">발행일자</td>
										<td>2020-02-11</td>
									</tr>
									<tr>
										<th class="table-primary">부서</td>
										<td>개발팀</td>
										<th class="table-primary">직책</td>
										<td>대리</td>
										<th class="table-primary">호봉</td>
										<td>1</td>
									</tr>
									<tr>
										<th class="table-primary">용도</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th class="table-primary">비고</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
			<div class="modal-footer">
				<button type="button" id="btn-open-form" class="btn btn-dark float-end">발령등록</button>
				<button type="button" id="btn-close-form"  class="btn btn-dark float-end">발령취소</button>
			</div>
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn-open-form").click(function() {
		$("#box-register-form").removeClass("d-none");
	});
	$("#btn-close-form").click(function() {
		$("#box-register-form").addClass("d-none");
	});
})
</script>
</body>
</html>