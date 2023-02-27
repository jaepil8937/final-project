<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>인사발령등록</title>
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
					<h3><p class="fw-bold">인사발령등록</p></h3>
				</div>	
				<div class="col-12 mb-3">
					<form method="post" action="personnel-register">
						<input type="hidden" name="employeeNo" />
						<div class="border p-3 bg-white">
							<div class="w-100 mb-3">
								<label>발령구분</label>
								<select name="type">
									<option>선택</option>
									<option value="입사">입사</option>
									<option value="승진">승진</option>
									<option value="전보">전보</option>
									<option value="휴직">휴직</option>
									<option value="퇴직">퇴직</option>
								</select>
								<label>발령일자</label>
								<input type="date" name="appointmentDate" />
								<label>발령직급</label>
								<select name="positionNo">
									<option selected="selected" disabled="disabled">선택</option>
									<option value="1">사원</option>
									<option value="2">대리</option>
									<option value="3">과장</option>
									<option value="4">차장</option>
									<option value="5">부장</option>
									<option value="6">사장</option>
								</select>
								<label>발령부서</label>
								<select name="deptNo">
									<option selected="selected" disabled="disabled">선택</option>
									<option value="100">기획팀</option>
									<option value="101">설계팀</option>
									<option value="102">분석팀</option>
									<option value="103">디자인팀</option>
									<option value="104">개발팀</option>
									<option value="105">테스트팀</option>
									<option value="106">운영팀</option>
								</select>
							</div>
							<div>
								<label>발령내용</label>
								<input type="text" name="content" style="width:100px;"/>
								<label>비고</label>
								<input type="text" name="note" style="width:100px;"/>
								<button type="button" id="btn-appiontment-update" class="btn btn-dark float-end btn-sm ms-3">발령수정</button>
								<button type="button" id="btn-appiontment-insert" class="btn btn-dark float-end btn-sm">발령등록</button>
							</div>
						</div>
					</form>
				</div>
				<div class="row">
					<div class="row">	
						<div class="col-12">
							<table class="table table-light table-scroll">
								<colgroup>
									<col width="5%"/>
									<col width="6%"/>
									<col width="12%"/>
									<col width="12%"/>
									<col width="12%"/>
									<col width="9%"/>
									<col width="12%"/>
									<col width="*"/>
								</colgroup>
								<thead>
									<tr class="table-primary text-center">
										<th></th>
										<th>사원번호</th>
										<th>성명</th>
										<th>직급</th>
										<th>부서</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="employee" items="${employees }">
										<tr class="text-center">
											<td><input type="checkbox" name="empNo" value="${employee.no }"/></td>
											<td>${employee.no }</td>
											<td>${employee.name }</td>
											<td>${employee.positionName }</td>
											<td>${employee.deptName }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-end">
						<a href="personnel" class="btn btn-dark float-end" style="width:90px;">취소</a>
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
	$("#btn-appiontment-update").click(function() {
		let empNo = $("input[name=empNo]:checked").val();
		$("input[name=employeeNo]").val(empNo);
		let checkedLength =  $("input[name=empNo]:checked").length;
		if (checkedLength == 0) {
			alert("수정할 사원을 선택해주세요.");
			return false;
		}	
		
		if (checkedLength > 1) {
			alert("수정은 하나씩 처리 가능합니다.");
			return false;
		}
		
		let type = $("select[name=type] option:selected").val();
		if (type == '선택') {
			alert("발령구분을 선택해주세요.");
			return false;
		}
		
		let appointmentDate = $("input[name=appointmentDate]").val();
		if (appointmentDate == "") {
			alert("발령일자를 선택해주세요.");
			return false;
		}
		
		$("form").trigger("submit");
	});
	
	$("#btn-appiontment-insert").click(function() {
		let empNo = $("input[name=empNo]:checked").val();
		$("input[name=employeeNo]").val(empNo);
		let checkedLength =  $("input[name=empNo]:checked").length;
		if (checkedLength == 0) {
			alert("등록할 사원을 선택해주세요.");
			return false;
		}	
		
		if (checkedLength > 1) {
			alert("등록은 하나씩 처리 가능합니다.");
			return false;
		}
		
		let type = $("select[name=type] option:selected").val();
		if (type == '선택') {
			alert("발령구분을 선택해주세요.");
			return false;
		}
		
		let appointmentDate = $("input[name=appointmentDate]").val();
		if (appointmentDate == "") {
			alert("발령일자를 선택해주세요.");
			return false;
		}
		
		$("form").trigger("submit");
	});
})
</script>
</body>
</html>