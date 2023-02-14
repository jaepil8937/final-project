<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<style>
	.table-col-row {
		display:flex;
		display: -webkit-box;
		display: -ms-flexbox;
		overflow-x: auto;
		overflow-y: hidden;
	}
	.table-col-row tbody {
		display:flex;
	}
	.table-col-row th, .table-col-row td{display:block}
	
</style>
</head>
<body>
<c:set var="side" value="item-apply" />
<%@ include file="../common/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr-3">
				<%@ include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-10">
				<div class="row mb-3">
					<h2>휴가신청/취소</h2>
				</div>
				<hr>
			<form name="form-search">
				<div class="row mb-3 bg-light p-4">
					<div>
						<label class="form-label"><strong>기준년도</strong></label>
						<select id="search-year" name="baseYear" style="width: 100px">
						</select>
						<label class="form-label"><strong>결재상태</strong></label>
						<select id="search-status" name="status" style="width: 100px">
							<option >전체</option>
							<option value="대기">대기</option>
							<option value="승인">승인</option>
							<option value="반려">반려</option>
						</select>
						<label class="form-label"><strong>사원번호</strong></label>
						<input type="text" id="text-empNo" name="empNo" value="" style="text-align:center; width:100px" />
						<button type="button" class="btn btn-danger" style="float:right;" id="btn-search">검색</button>
					</div>
				</div>
			</form>
			<ul class="nav nav-tabs mb-3">
		 		 <li class="nav-item">
		  		  <a class="nav-link active"><strong>휴가신청</strong></a>
		 		 </li>	
		 	</ul>
			<div class="row mb-3 bg-light">
				<hr>
				<div class="col">
				<p>
					<i class="bi bi-exclamation-circle-fill"></i>
					휴가신청후 결재상태가 "승인"된 경우에만 휴가 사용일수에 "+"가 되고, 잔여일수에 "-"가 됩니다.
				</p>
				</div>
			</div>		
			<div class="row mb-2 bg-light">
				<div style="width:33%;float:left;">
					<table class="table-sm table-col-row">
						<thead>
							<tr class="text-center">
								<th>사원번호</th>
								<th>사용연차</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" name="input-empNo" value="1001" style="text-align:center; width:100px" disabled/></td>
								<td><input type="text" name="input-used-days" value="1" style="text-align:center; width:100px" disabled/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="width:33%;float:right;">
					<table class="table-sm table-col-row">
						<thead>
							<tr class="text-center">
								<th>성명</th>
								<th>잔여연차</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" name="input-empName" value="홍길동" style="text-align:center; width:100px" disabled/></td>
								<td><input type="text" name="input-remained-days" value="10" style="text-align:center; width:100px" disabled/></td>
							</tr>
						</tbody>
					</table>	
				</div>	
				<div style="width:33%;float:left;">
					<table class="table-sm table-col-row">
						<thead>
							<tr class="text-center">
								<th>기간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" name="input-start-day" value="2021-01-01" style="text-align:center; width:100px" disabled/>~
								<input type="text" name="input-last-day" value="2021-12-31" style="text-align:center; width:100px" disabled/>
								</td>
							</tr>
						</tbody>
					</table>								
				</div>
			</div>
			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>휴가신청내역</strong>
					</p>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered table-hover table-striped table-sm" id="used-table">
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="7%">
						<col width="10%">
						<col width="10%">
						<col width="7%">
						<col width="10%">
						<col width="*">
						<col width="0%">
					</colgroup>
					<thead>
						<tr class="text-center">
							<th>No</th>
							<th>신청일</th>
							<th>휴가구분</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>일수</th>
							<th>결재상태</th>
							<th>휴가사유</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="item-noting" colspan="12" class="text-center">기준년도를 선택해 검색해주시기 바랍니다.</td>
						</tr>											
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-6 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>휴가신청/수정/취소</strong>
					</p>
				</div>
				<div class="col-6 mb-1">
						<a href="" class="btn btn-outline-dark btn-sm" style="float:right; margin-right: 4px;" id="">양식다운로드</a>
				</div>
			</div>
			<form method="post" enctype="multipart/form-data">
				<table class="table">
					<tr class="fw-bold">
						<td>휴가신청일 <input type="date" id="currentDate" name="" value="2023-02-03" style="text-align:center; width:130px" disabled/></td>
						<td>휴가기간 <input type="date" id="vacation-start-date" name="" value="2023-02-03" style="text-align:center; width:130px"/>~
								<input type="date" id="vacation-end-date" name="" value=""style="text-align:center; width:130px"/>
								(일수: <input type="text" id="day-count"name="" value="" style="text-align:center; width:40px" disabled/>일)
						</td>
						<td>휴가구분 
							<select name="vacation-item-name" style="width: 80px">
							<option value="연차">연차</option>
							<option value="병가">병가</option>
							<option value="출산휴가">출산휴가</option>
							<option value="반차">반차</option>
							</select>
						</td>
						<td>결재상태 <input type="text" id="vacation-status" value="대기" style="text-align:center; width:70px" disabled/></td>
					</tr>
				</table>
				<table class="table">
					<tr class="fw-bold">
						<td>휴가사유 <input type="text" id="vacation-reason" style="width:500px;"></td>
						<td>첨부파일 <input type="file" id="fileUpload" /></td>
					</tr>
				</table>
				<div class="row mb-2">
					<div class="col">
						<a href="" class="btn btn-outline-dark btn-sm" style="float:right; margin-right: 4px;" id="">반려</a>
						<a href="" class="btn btn-outline-dark btn-sm" style="float:right; margin-right: 4px;" id="">승인</a>
					</div>
				</div>
				<div class="row mb-2 bg-light m-2">
					<hr>
					<div class="col">
					<p>
						<i class="bi bi-exclamation-circle-fill"></i>
						기존의 휴가신청 내역을 조회/수정/취소를 하고싶다면, 휴가신청내역에서 해당하는 신청정보를 클릭하세요.
					</p>
					<p>
						<i class="bi bi-exclamation-circle-fill"></i>
						결재상태가 이미 "승인"된 휴가신청은 수정 후 결재상태가 "대기"상태로 변경됩니다. <br>
						&nbsp;&nbsp;&nbsp;&nbsp수정하고자 하는 휴가신청의 휴가 시작일이 현재일보다 과거라면 수정할 수 없습니다.
					</p>		
					<p>
						<i class="bi bi-exclamation-circle-fill"></i>
						결재상태가 "대기", "반려"상태인 휴가신청만 삭제할 수 있습니다.
					</p>									
					</div>
			</div>
			<div class="row p-3">
				<div class="col">
					<button type="submit" id="register-vacation-info" class="btn btn-dark" style="float:right;" id="">신청</button>
					<a href="" id="cancel-vacation-info" class="btn btn-danger d-none" style="float:right; margin-right: 4px;" id="">취소</a>
					<a href="" id="modify-vacation-info" class="btn btn-dark d-none" style="float:right; margin-right: 4px;" id="">수정</a>
				</div>
			</div>
			</form>
			</div>	
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(function() {
	
	function days() {
		let $startDate = new Date($("#vacation-start-date").val());
		let $endDate = new Date($("#vacation-end-date").val());
		if ($startDate && $endDate) {
			let $days = Math.round(($endDate.getTime() - $startDate.getTime()) / 1000 / 60 / 60 / 24) + 1;
			$("#day-count").val($days);
		}
	}
	
	$("input[type=date]").on("change", function() {
		days();
	});
	
	function check() {
		let $year = $("#search-year").val();
		let $empNo = $("#text-empNo").val();
		if (!$year) {
			alert("기준년도를 선택하세요.");
			return false;
		}
		if (!$empNo) {
			alert("사원번호를 입력하세요.");
			return false;
		}
	}
	
	function searh() {
		$.ajax({
			type: 'GET',
			url : '/vacation/apply-list',
			data : $("form[name=form-search]").serialize(),
			success : function(data) {
				let dataArr = new Array();
				dataArr = data.usedVacationsList;
				
				let innerHtml = "";
				$('#used-table > tbody').empty();
				
				$("input[name=input-empNo]").val(data.calculatedDays.empNo);
				$("input[name=input-empName]").val(data.calculatedDays.empName);
				$("input[name=input-used-days]").val(data.calculatedDays.usedDays);
				$("input[name=input-remained-days]").val(data.calculatedDays.remainedDays);
				$("input[name=input-last-day]").val(data.calculatedDays.baseDate);
				$("input[name=input-start-day]").val(data.calculatedDays.baseYear +"-01-01");
				if (!data.usedVacationsList) {
					innerHtml += '<tr>';
					innerHtml += '<td id="item-noting" colspan="12" class="text-center">해당 년도에 대한 휴가 신청 내역이 없습니다.</td>'
					innerHtml += '</tr>';
					$('#used-table > tbody').append(innerHtml);
				} else {
					for (let i=0; i<dataArr.length; i++) {
						let index = i + 1;
						innerHtml += '<tr class="text-center" name="index" id="click_event">';
						innerHtml += "<td>" + index + "</td>";
						innerHtml += "<td>" + dataArr[i].requestDate + "</td>";
						innerHtml += "<td>" + dataArr[i].itemName + "</td>";
						innerHtml += "<td>" + dataArr[i].startDate + "</td>";
						innerHtml += "<td>" + dataArr[i].endDate + "</td>";
						innerHtml += "<td>" + dataArr[i].days + "</td>";
						innerHtml += "<td>" + dataArr[i].status + "</td>";
						innerHtml += "<td>" + dataArr[i].reason + "<input type='button' class='btn btn-outline-dark btn-sm' style='float:right; margin-right: 4px;' id='click_event' value='조회'><input type='hidden' class='d-none' name='request-no' value='" + dataArr[i].no  +"'></td>";
						innerHtml += '</tr>';
					}
						$('#used-table > tbody').append(innerHtml);
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
	
	$('#currentDate').val(new Date().toISOString().substring(0, 10));
	
	$(document).on('click', '#click_event', function(event){
		// 동적 이벤트 중복 방지
		event.stopImmediatePropagation();
		var $thisRow = $(this).closest('tr'); 
		var $no = $thisRow.find('td:eq(7)').find('input[name=request-no]').val();
		
		$.ajax({
			type: 'GET',
			url : '/vacation/apply-request-info',
		    data: {no: $no}, 
		    dataType: "json",
		    success: function(data) {
		    	$("#currentDate").val(data.requestDate);
		    	$("#vacation-start-date").val(data.startDate);
		    	$("#vacation-end-date").val(data.endDate);
		    	$("#day-count").val(data.days);
		    	$("select[name=vacation-item-name]").val(data.itemName);
		    	$("#vacation-status").val(data.status);
		    	$("#vacation-reason").val(data.reason);
		    	
		    	$("#modify-vacation-info").removeClass("d-none");
		    	$("#cancel-vacation-info").removeClass("d-none");
		    	$("#register-vacation-info").addClass("d-none");
		    	
		    }
		})
	});
});
</script>
</body>
</html>