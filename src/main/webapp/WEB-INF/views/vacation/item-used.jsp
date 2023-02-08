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
</head>
<body>
<c:set var="side" value="item-used" />
<%@ include file="../common/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr-3">
				<%@ include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-10">
				<div class="row mb-3">
					<h2>휴가사용현황</h2>
				</div>
				<hr>
			<form name="form-search">
				<div class="row mb-3 bg-light p-4">
					<div>
						<label class="form-label"><strong>기준년도</strong></label>
							<select id="year" name="baseYear" style="width: 100px">
							</select>
						<label class="form-label"><strong>검색어</strong></label>
						<select name="opt">
							<option value="empNo">사원번호</option>
							<option value="empName">성명</option>
							<option value="dept">부서명</option>
						</select>
						<input type="text" name="keyword" value=""/>
						<button type="button" class="btn btn-danger" style="float:right;" id="btn-search">검색</button>
					</div>
				</div>
			</form>
			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>휴가사용현황</strong>
					</p>
				</div>
			</div>
				<div class="row">
					<table class="table table-bordered table-hover table-striped table-sm" id="used-table">
						<colgroup>
							<col width="3%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="5%">
							<col width="7%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>No</th>
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
								<th>일수</th>
								<th>휴가구분</th>
								<th>신청일</th>
								<th>시작일</th>
								<th>종료일</th>
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
							휴가신청에서 결재상태가 "승인"된 휴가만 조회됩니다. 
						</p>
						<p>
							<i class="bi bi-exclamation-circle-fill"></i>
							관리자가 아닌 사원들은 자신의 사용현황 정보만 조회가 가능합니다.
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
	// 엔터키 눌러도 넘어가지 않도록 이벤트 걸기
	$('input[type="text"]').keydown(function() {
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	});
	
	let now = new Date();
	let now_year = now.getFullYear();
	
	$("#year").append("<option value=''>선택</option>");
	// i는 창립년도
	for (let i = 2010; i <= now_year; i++) {
		$("#year").append("<option value='"+ i +"'>"+ i +"</option>");
	}
	
	$("#btn-search").click(function() {
		$.ajax({
			type: 'GET',
			url : '/vacation/used-search',
			data : $("form[name=form-search]").serialize(),
			success : function(result) {
				$('#used-table > tbody').empty();
				if (result.length >= 1) {
					result.forEach(function(item) {
						let row_index = $("#used-table > tbody > tr[name=index]").length + 1;
						if (row_index === 1) {
							row_index = 1;
						}
						let innerHtml = "";
						innerHtml += '<tr class="text-center" name="index">';
						innerHtml += "<td>" + row_index + "</td>";
						innerHtml += "<td>" + item.empNo + "</td>";
						innerHtml += "<td>" + item.empName + "</td>";
						innerHtml += "<td>" + item.positionName + "</td>";
						innerHtml += "<td>" + item.deptName + "</td>";
						innerHtml += "<td>" + item.days + "</td>";
						innerHtml += "<td>" + item.itemName + "</td>";
						innerHtml += "<td>" + item.requestDate + "</td>";
						innerHtml += "<td>" + item.startDate + "</td>";
						innerHtml += "<td>" + item.endDate + "</td>";
						innerHtml += '</tr>';
						$('#used-table > tbody').append(innerHtml);
					})
				} else {
					let innerHtml = "";
					innerHtml += '<tr>';
					innerHtml += '<td id="item-noting" colspan="12" class="text-center">해당 년도에 대한 휴가 사용 정보가 없습니다.</td>'
					innerHtml += '</tr>';
					$('#used-table > tbody').append(innerHtml);
				}
			}
		})
	});
	
});
	
</script>
</body>
</html>