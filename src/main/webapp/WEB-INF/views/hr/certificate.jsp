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
								<option>선택</option>
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
					<div class="col-12 d-flex justify-content-between align-items-center mb-3">
						<h6 class="mt-3 mb-3">
							<strong>증명서신청내역</strong>
						</h6>
						<div class="float-end">
							<form id="delete" method="post" action="certificate-delete">
								<input type="hidden" name="employeeNo" />
									<button type="submit" id="btn-delete" class="btn btn-dark float-end">신청취소</button>
							</form>
						</div>	
					</div>
				</div>
				<div class="row">
					<div class="col-12">
					<table class="table table-light table-scroll">
						<thead>
							<tr class="table-primary text-center">
								<th></th>
								<th>사원번호</th>
								<th>증명서구분</th>
								<th>신청일자</th>
								<th>성명</th>
								<th>발행상태</th>
								<th>발행일자</th>
								<th>용도</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty certificates }">
									<tr>
										<td id="item-nothing" colspan="7" class="text-center">목록이 없습니다.</td>
									</tr>
								</c:when> 
								<c:otherwise>
									<c:forEach var="certificate" items="${certificates }">
										<tr class="text-center">
											<td><input type="checkbox" name="empNo" value="${certificate.no }"/></td>
											<td>${certificate.no }</td>
											<td>${certificate.type }</td>
											<td><fmt:formatDate value="${certificate.requestDate }" pattern="yyyy-MM-dd"/></td>
											<td>${certificate.name }</td>
											<td>
												<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
													<a href="approval?no=${certificate.requestNo }" id="btn-approval" class="btn btn-primary btn-sm">승인</a>
													<a href="refer?no=${certificate.requestNo }" id="btn-refer" class="btn btn-danger btn-sm">반려</a>
												</sec:authorize>
												<sec:authorize access="hasAnyRole('ROLE_EMPLOYEE')">
													<span class="badge text-bg-primary">${certificate.requestStatus }</span>
												</sec:authorize>
											</td>
											<td><fmt:formatDate value="${certificate.publishDate }" pattern="yyyy-MM-dd"/></td>
											<td>${certificate.purpose }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
						<div class="modal-footer text-end">
							<button type="button" id="btn-open-form" class="btn btn-dark">신청</button>
							<button type="button" id="btn-close-form" class="btn btn-dark">취소</button>
						</div>
				</div>
				<div id="box-register-form" class="row d-none">
					<div class="col-12">
						<div class="row">
							<div class="col-12">
								<h6 class="mt-3 mb-3">
									<strong>증명서신청</strong>
								</h6>
							</div>	
						</div>
						<form id="register-form" class="border bg-light p-3" method="post" action="issue">
							<table class="table table-light text-center align-middle">
									<tr>
										<th class="table-primary">사원번호</th>
										<td><input value="${employee.employeeNo }" class="form-control" name="employeeNo" disabled/></td>
										<th class="table-primary">성명</th>
										<td colspan=""><input value="${employee.name }" class="form-control" name="name" disabled/></td>
									<tr>
									<tr>
										<th class="table-primary">부서</th>
										<td>
											<input value="${employee.deptName }" class="form-control" name="deptNo" disabled/>
										</td>
										<th class="table-primary">직책</th>
										<td>
											<input value="${employee.positionName }" class="form-control" name="positionNo" disabled/>
										</td>
										<th class="table-primary">호봉</th>
										<td><input value="${employee.hobong }" class="form-control" name="hobong" disabled/></td>
									</tr>
									<tr>
										<th class="table-primary">증명서구분</th>
										<td>
											<select class="form-select" name="type">
												<option>선택</option>
												<option value="재직증명서">재직증명서</option>
												<option value="경력증명서">경력증명서</option>
												<option value="원천징수영수증">원천징수영수증</option>
												<option value="각종근로소득증명서">각종근로소득증명서</option>
												<option value="급여명세서">급여명세서</option>
											</select>
										</td>
										<th class="table-primary">신청일자</th>
										<td><input type="date" class="form-control" name="requestDate"/></td>
										<th class="table-primary">발행일자</th>
										<td><input type="date" class="form-control" name="publishDate"/></td>
									</tr>
									<tr>
										<th class="table-primary">용도</th>
										<td class="text-start" colspan="6"><input type="text" class="form-control w-100" name="purpose"/></td>
									</tr>
									<!-- <tr>
										<th class="table-primary">비고</th>
										<td class="text-start" colspan="6"><input type="text" class="form-control w-75" name="note"/></td>
									</tr> -->
								<div class="text-end">
									<button type="button" id="btn-certificate-insert" class="btn btn-dark float-end">등록</button>
								</div>
							</table>
						</form>
					</div>
				</div>
			</div>
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
	
	$("#btn-certificate-insert").click(function() {
		
		let type = $("select[name=type] option:selected").val();
		if (type == '선택') {
			alert("증명서구분을 선택해주세요.");
			return false;
		}
		
		let requestDate = $("input[name=requestDate]").val();
		if (requestDate == "") {
			alert("신청일자를 선택해주세요.");
			return false;
		}
		
		let publishDate = $("input[name=publishDate]").val();
		if (publishDate == "") {
			alert("발행일자를 선택해주세요.");
			return false;
		}
		$("#register-form").trigger("submit");
	});
	
	$("#btn-delete").click(function() {
		let empNo = $("input[name=empNo]:checked").val();
		$("input[name=employeeNo]").val(empNo);
		
		let checkedLength = $("input[name=empNo]:checked").length;
		if (checkedLength == 0) {
			alert("삭제할 신청서를 선택해주세요.");
			return false;
		}	
		
		if (checkedLength > 1) {
			alert("삭제는 하나씩 처리 가능합니다.");
			return false;
		}
		
		$("#delete").trigger("submit");
	});
	
	$("#btn-approval").click(function() {
		alert("승인되었습니다.");
		return true;
	});
	$("#btn-refer").click(function() {
		alert("반려되었습니다.");
		return true;
	});
	
});
</script>
</body>
</html>