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
					<button type="button" class="btn btn-outline-dark btn-sm" id="btn-add" data-bs-toggle="modal" data-bs-target="#exampleModal">행추가</button>
				</div>
			<form id="form-educations" method="get" action="/hr/education/del">
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
										<th><input type="checkbox" name="eduNo" value="${edu.educationNo}"></th>
										<td><fmt:formatDate value="${edu.admissionDate}" pattern="yyyy년 M월 d일"/> </td>
										<td>${edu.schoolName} </td>
										<td>${edu.magerDepartment} </td>
										<td> 
											<input class="form-check-input" type="radio" name="graduationType-${edu.educationNo}" value="Y" disabled ${edu.graduationType eq 'Y' ? 'checked' : '' } >
											<label class="form-check-label" for="flexRadioDefault1">졸업</label>
											<input class="form-check-input" type="radio" name="graduationType-${edu.educationNo}" value="N" disabled  ${edu.graduationType eq 'N' ? 'checked' : '' }>
		  									<label class="form-check-label" for="flexRadioDefault2">재학중</label>
										</td>
									</tr>
								</c:forEach>						
							</tbody>
						</table>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>		


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">학력정보 등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form class="p-3 bg-light border" id="form-edu" method="post" action="education">
      		<div class="mb-2">
      			<label class="form-label">입학년월</label>
      			<input type="date" id="start-date"  class="form-control" name="admissionDate" >
      		</div>
      		<div class="mb-2">
      			<label class="form-label">학교명</label>
      			<input type="text" class="form-control" name="schoolName" >
      		</div>
      		<div class="mb-2">
      			<label class="form-label">전공학과</label>
      			<input type="text" class="form-control" name="magerDepartment" >
      		</div>
      		<div class="mb-2">
      			<label class="form-label">졸업여부</label>
      			<div>
      				<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="graduationType"  value="Y" checked>
					  <label class="form-check-label" for="inlineRadio1">졸업</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="graduationType"  value="N">
					  <label class="form-check-label" for="inlineRadio2">재학중</label>
					</div>
      			</div>
      		</div>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="btn-add-edu">저장</button>
      </div>
    </div>
  </div>
</div>				


		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

$("#btn-add-edu").click(function() {
	
	$("#form-edu").trigger('submit')
});


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


	
	// <div id="box-career"> 내부에 미래에 추가된 삭제버튼을 클릭했을 실행될 이벤트 핸들러 등록하기
	$("#box-career").on("click", '.btn-danger', function() {
		// this는 클릭이벤트가 발생할 엘리먼트다.
		// $(this) 함수의 실행결과는 this를 포함하는 jQuery객체다.
		
		// .closest('선택자')는 조상 엘리먼트 중에서 지정한 선택자에 해당하는 가장 가까운 조상엘리먼트가 포함된 jQuery객체를 반환한다.
		$(this).closest('.row').remove();
	});

	
	$("#btn-del").click(function() {
		let $checkboxes = $("#edu-table tbody :checkbox:checked");
		if ($checkboxes.length == 0) {
			alert("체크박스를 선택하세요");
			return;
		}
		
		$("#form-educations").trigger("submit")
		
		/*
		$checkboxes.each(function(index, checkbox) {
			let eduNo = $(checkbox).val();
			if (eduNo != "0") {
				
			}
			$(checkbox).closest("tr").remove();
		}); */
	})

</script>
</body>
</html>