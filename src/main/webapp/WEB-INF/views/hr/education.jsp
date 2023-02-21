<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
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
			<div class="row mb-3">
				<div class="col-12">
					<h2><p class="fw-bold">학력정보</p></h2>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-3">
					<i class="bi bi-arrow-right-square-fill text-danger"></i> <strong>상세정보</strong>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<div class="btn-group" >
						<a href="register" class="btn btn-light px-4">인적사항</a>
						<a href="family" class="btn btn-light px-4">가족사항</a>
						<a href="education" class="btn active btn-light px-4">학력정보</a>
						<a href="order" class="btn btn-light px-4">발령정보</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col text-end mb-3">
					<button type="button" class="btn btn-outline-dark btn-sm" id="btn-del">행삭제</button>
					<button type="button" class="btn btn-outline-dark btn-sm"  id="btn-add">행추가</button>
				</div>
			</div>
			
			<form id="form-register" method="post" action="education" name="delete">
			<div class="row">
				<div class="col-12">
					<table class="table table-bordered  table-sm" id="edu-table">
						<colgroup>
							<col width="10%">
							<col width="22.5%">
							<col width="22.5%">
							<col width="22.5%">
							<col width="22.5%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th><input type="checkbox" id="checkbox-all-toggle" onchange="toggleAllCheckUncheck()" ></th>
								<th>입학년월</th>
								<th>학교명</th>
								<th>전공학과</th>
								<th>졸업구분</th>	
							</tr>
						</thead>
						<tbody>
							<c:forEach var="edu" items="${educations }">
								<tr class="text-center align-middle">
									<th><input type="checkbox" name="eduNo" value="${edu.employeeNo}"></th>
									<td><fmt:formatDate value="${edu.admissionDate}" pattern="yyyy년 M월 d일"/> </td>
									<td>${edu.schoolName} </td>
									<td>${edu.magerDepartment} </td>
									<td> 
										<input class="form-check-input" type="radio" name="graduationType-${edu.employeeNo}" value="Y"  ${edu.graduationType eq 'Y' ? 'checked' : '' } >
										<label class="form-check-label" for="flexRadioDefault1">졸업</label>
										<input class="form-check-input" type="radio" name="graduationType-${edu.employeeNo}" value="N"  ${edu.graduationType eq 'N' ? 'checked' : '' }>
	  									<label class="form-check-label" for="flexRadioDefault2">재학중</label>
									</td>
								</tr>
							</c:forEach>
							<tr class="text-center align-middle">
								<td>
									<input type="checkbox" name="eduNo" value="0">
								</td>
								<td>
									<input type="date" id="start-date"  class="form-control" name="admissionDate" >
								</td>
								<td>
									<input type="text" class="form-control" name="schoolName" >
								</td>
								<td>
									<input type="text" class="form-control" name="magerDepartment" >
								</td>
								<td>
									<input class="form-check-input" type="radio" name="graduationType" value="Y"  id="flexRadioDefault1" >
									<label class="form-check-label" for="flexRadioDefault1">졸업</label>
									<input class="form-check-input" type="radio" name="graduationType" value="N" id="flexRadioDefault1" >
	  								<label class="form-check-label" for="flexRadioDefault2">재학중</label>
								</td>	
							</tr>										
						</tbody>
					</table>
				</div>
			</div>
			
				<div class="row">
					<div class="col text-end">
						<button type="submit" class="btn btn-dark" style="float:right;" >저장</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>				
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function toggleAllCheckUncheck() {
	// 전체 선택/해제 체크박스의 체크상태를 조회하다.
	var el = document.querySelector("#checkbox-all-toggle");
	var currentChecked = el.checked;
	
	// 모든 보유기술 체크박스의 체크상태를 위에서 조회한 전체 선택/해제 체크박스의 체크상태와 같은 상태로 만든다.
	var collection = document.querySelectorAll('[name=eduNo]');
	for (var index = 0; index < collection.length; index++) {
		var el = collection[index];
		el.checked = currentChecked;
	}
}
function checkAll() {
	// 체크박스 전체 선택하기
	var collection = document.querySelectorAll('[name=eduNo]');
	for (var index = 0; index < collection.length; index++) {
		var el = collection[index];
		el.checked = true;
	}
}
function uncheckAll() {
	// 체크박스 전체 선택하기
	var collection = document.querySelectorAll('[name=eduNo]');
	for (var index = 0; index < collection.length; index++) {
		var el = collection[index];
		el.checked = false;
	}
}

$("#edu-table tbody").on('change', ":checkbox[name=eduNo]", function() {
	let checkboxLen = $("#edu-table tbody :checkbox[name=eduNo]").length;
	let checkedCheckboxLen = $("#edu-table tbody :checkbox[name=eduNo]:checked").length;


if (checkboxLen == checkedCheckboxLen) {
		$("#checkbox-all-toggle").prop("checked", true);
	} else {
		$("#checkbox-all-toggle").prop("checked", false);
	}
})

$(function() {
	var count = 0;
	$("#btn-add").click(function() {
		
		var eduRowsLength = $("#edu-table tbody tr").length;
		if (eduRowsLength >= 10) {
			alert("학력정보 입력필드는 최대 10개까지만 추가 가능합니다.");
			return;
		}
		
		count++;
		
		var htmlContent = `
			<tr class="text-center align-middle">
			<td>
				<input type="checkbox" name="eduNo">
			</td>
			<td>
				<input type="date" id="start-date"  class="form-control">
			</td>
			<td>
				<input type="text" class="form-control">
			</td>
			<td>
				<input type="text" class="form-control">
			</td>
			<td>
				<input class="form-check-input" type="radio" name="graduationType-\${count}" value="Y"  id="flexRadioDefault1" >
				<label class="form-check-label" for="flexRadioDefault1">졸업</label>
				<input class="form-check-input" type="radio" name="graduationType-\${count}" value="N" id="flexRadioDefault1" >
					<label class="form-check-label" for="flexRadioDefault2">재학중</label>
			</td>	
		</tr>		
		`;
		$("#edu-table tbody").append(htmlContent);
	});
	
	// <div id="box-career"> 내부에 미래에 추가된 삭제버튼을 클릭했을 실행될 이벤트 핸들러 등록하기
	$("#box-career").on("click", '.btn-danger', function() {
		// this는 클릭이벤트가 발생할 엘리먼트다.
		// $(this) 함수의 실행결과는 this를 포함하는 jQuery객체다.
		
		// .closest('선택자')는 조상 엘리먼트 중에서 지정한 선택자에 해당하는 가장 가까운 조상엘리먼트가 포함된 jQuery객체를 반환한다.
		$(this).closest('.row').remove();
	});
})


</script>
</body>
</html>