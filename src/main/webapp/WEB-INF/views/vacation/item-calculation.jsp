<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.ui-datepicker-calendar {
    display: none;
    }​
</style>
</head>
<body>
<c:set var="side" value="item-calculation" />
<%@ include file="../common/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr-3">
				<%@ include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-10">
				<div class="row mb-3">
					<h2>휴가일수조회</h2>
				</div>
				<hr>
			<form name="form-search">
				<div class="row mb-3 bg-light p-4">
					<div>
						<label class="form-label"><strong>기준년도</strong></label>
							<select id="search-year" name="baseYear" style="width: 100px">
							</select>
						<label class="form-label"><strong>검색어</strong></label>
						<sec:authentication property="principal" var="loginEmployee" />
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<select name="opt">
								<option value="empNo">사원번호</option>
								<option value="empName">성명</option>
								<option value="dept">부서명</option>
							</select>
							<input type="text" id="search-keyword" name="keyword" value="${loginEmployee.no }" />
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_EMPLOYEE')">
							<select name="opt">
								<option value="empNo">사원번호</option>
							</select>
							<input type="text" id="search-keyword" name="keyword" value="${loginEmployee.no }" readOnly />
						</sec:authorize>
						<button type="button" class="btn btn-danger" style="float:right;" id="btn-search">검색</button>
					</div>
				</div>
			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>휴가일수조회</strong>
					</p>
				</div>
			</div>
			<form>
				<div class="row">
					<table class="table table-bordered table-hover table-striped table-sm" id="calculate-table">
						<colgroup>
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="12%">
							<col width="12%">
							<col width="8%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
								<th>입사일자</th>
								<th>근속기준일</th>
								<th>근속년수</th>
								<th>근속연차</th>
								<th>사용연차</th>
								<th>잔여연차</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="item-noting" colspan="12" class="text-center">기준년도를 선택해 검색해주시기 바랍니다.</td>
							</tr>													
						</tbody>
					</table>
				</div>
				<div class="row mb-2 bg-light m-2">
						<hr>
						<div class="col">
						<p>
							<i class="bi bi-exclamation-circle-fill"></i>
							관리자가 아닌 사원들은 자신의 휴가일수 정보만 조회가 가능합니다.
						</p>
						</div>
				</div>
			</div>	
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(function() {
	function check() {
		let $year = $("#search-year").val();
		let $keyword = $("#search-keyword").val();
		if (!$year) {
			alert("기준년도를 선택하세요.");
			return false;
		}
		if (!$keyword) {
			alert("검색어를 입력하세요.");
			return false;
		}
	}
	
	function searh() {
		$.ajax({
			type: 'GET',
			url : '/vacation/calculate-days',
			data : $("form[name=form-search]").serialize(),
			success : function(item) {
				$('#calculate-table > tbody').empty();
					if (item) {
						let innerHtml = "";
						innerHtml += '<tr class="text-center" name="index">';
						innerHtml += "<td>" + item.empNo + "</td>";
						innerHtml += "<td>" + item.empName + "</td>";
						innerHtml += "<td>" + item.positionName + "</td>";
						innerHtml += "<td>" + item.deptName + "</td>";
						innerHtml += "<td>" + item.hireDate + "</td>";
						innerHtml += "<td>" + item.baseDate + "</td>";
						innerHtml += "<td>" + item.workedYears + "</td>";
						innerHtml += "<td>" + item.vacationDays + "</td>";
						innerHtml += "<td>" + item.usedDays + "</td>";
						innerHtml += "<td>" + item.remainedDays + "</td>";
						innerHtml += '</tr>';
						$('#calculate-table > tbody').append(innerHtml);
					} else {
						let innerHtml = "";
						innerHtml += '<tr>';
						innerHtml += '<td id="item-noting" colspan="12" class="text-center">해당 년도에 대한 휴가 일수 정보가 없습니다.</td>'
						innerHtml += '</tr>';						
						$('#calculate-table > tbody').append(innerHtml);
					}
				}
		})
	}
	
	let now = new Date();
	let now_year = now.getFullYear();
	
	$("#search-year").append("<option value=''>선택</option>");
	// i는 창립년도
	for (let i = 2010; i <= now_year; i++) {
		$("#search-year").append("<option value='"+ i +"'>"+ i +"</option>");
	}
	
	// 엔터키 눌러도 넘어가지 않도록 이벤트 걸기
	$('input[type="text"]').keydown(function() {
		if (event.keyCode === 13) {
			event.preventDefault();
			check();
			searh();
		}
	});
	
	$("#btn-search").click(function() {
		check();
		searh();
	});
	
	
});
</script>
</body>
</html>