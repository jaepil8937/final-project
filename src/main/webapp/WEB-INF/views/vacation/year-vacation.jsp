<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>애플리케이션</title>
</head>
<style>
</style>
<body>
	<c:set var="menu" value="post" />
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr35">
				<%@ include file="../common/sidebar.jsp"%>
			</div>
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<h1 class="fs-10 p-4">근속연수별 휴가 설정</h1>
					</div>
				</div>
				<div class="row" style="margin-top: 60px; margin-bottom: 20px;">
					<div class="col-6">
						<p>
							<i class="bi bi-arrow-right-square-fill text-danger"></i> 근속연수별
							휴가 설정
						</p>
					</div>
					<div class="col-6">
						<div class="text-end">
							<button id="btn-open-add-row" class="btn btn-light">행추가</button>
							<button id="btn-open-delete-row" class="btn btn-light">행삭제</button>
						</div>
					</div>
				</div>
				<div class="" style="overflow-y: scroll; height: 250px;">
					<form name="deleteform" method="get" action="/vacation/delete">
						<table class="table">
							<colgroup>
								<col width="10%">
								<col width="30%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<thead>
								<tr class="text-center">
									<th><input type="checkbox" name="selectall"
										value="selectall" onclick="selectAll(this)" /></th>
									<th>근속연수</th>
									<th>휴가일수</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody id="my-tbody">
								<c:choose>
									<c:when test="${empty vacationDays }">
										<tr>
											<td colspan="4" class="text-center">근속연수별 휴가일수를 등록해주십시오.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="vacationDay" items="${vacationDays }">
											<!-- 등록된 아래 내용 출력 -->
											<tr class="text-center">
												<th><input type="checkbox" name="workedYear"
													value="${vacationDay.workedYear }"
													onclick="checkSelectAll()"></th>
												<td>${vacationDay.workedYear}년</td>
												<td>${vacationDay.vacationDays}일</td>
												<td></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 근속연수 및 휴가일수 등록 모달창 -->
	<div class="modal" id="modal-add-row">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-2">
							<label class="form-label">년차</label> <input type="number"
								class="form-control" name="workedYear" value="0" />
						</div>
						<div class="mb-2">
							<label class="form-label">휴가일수</label> <input type="number"
								class="form-control" name="vacationDays" value="0" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" id="btn-add-row">추가</button>
				</div>
			</div>
		</div>
	</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	// 행추가
	var rowAddModal = new bootstrap.Modal("#modal-add-row");

	$("#btn-open-add-row").click(function() {
		rowAddModal.show();
	});
	
	$("#btn-add-row").click(function() {

		var yearValue = parseInt($("#modal-add-row :input[name=workedYear]").val());
	 	var dayValue = $("#modal-add-row :input[name=vacationDays]").val();
	 
		$.post("/vacation/add", {workedYear:yearValue, vacationDays:dayValue}, function(vacationDay) {
			 var rowcheck = vacationDay.workedYear;
			 var workedYear = vacationDay.workedYear;
			 var vacationDays = vacationDay.vacationDays;
			
			 var row = `
				 <tr  class="text-center">
					 <th><input type="checkbox" name="workedYear" value="\${workedYear }" onclick="checkSelectAll()"></th>
					 <td>\${workedYear}년</td>
					 <td>\${vacationDays}일</td>
					 <td></td>
				</tr>
		 	`
		 	var rowIndex = -1;
		 	$("#my-tbody tr").each(function(index, tr) {
		 		var $checkbox = $(tr).find(":checkbox");
		 		var year = parseInt($checkbox.val());
		 		if (rowIndex == -1 && year > yearValue) {
		 			rowIndex = index;
		 		}
		 	})
		 	
		 	if (rowIndex != -1) {
				$("#my-tbody tr").eq(rowIndex).before(row);		 		
		 	} else {
		 		$("#my-tbody").append(row);	
		 	}
			rowAddModal.hide();
		}, 'json');
		 
	})
	
	// 행삭제
	$("#btn-open-delete-row").on("click", function () {
		var answer = confirm("삭제하시겠습니까?");
		if (answer) {
			var $checked = $("table input[type=checkbox]:checked");
			
			if ($checked.length < 1) {
				alert("삭제할 데이터를 선택해주세요.");
				return false;
			}
			
			$("form[name=deleteform]").trigger("submit");
		}
		
	});
	
	// 체크박스
	function checkSelectAll() {

	 	const checkboxes 
			= document.querySelectorAll('input[name="workedYear"]');
	 	const checked 
			= document.querySelectorAll('input[name="workedYear"]:checked');
	 	const selectAll 
			= document.querySelector('input[name="selectall"]');
	 	
		if(checkboxes.length === checked.length) {
	 	   selectAll.checked = true;
	 	}else {
	       selectAll.checked = false;
	 	}
 }
 
	  function selectAll(selectAll) {
	 	const checkboxes 
			= document.getElementsByName('workedYear');
	 
		checkboxes.forEach((checkbox) => {
			 checkbox.checked = selectAll.checked
		 })

 }
 </script>
</body>
</html>