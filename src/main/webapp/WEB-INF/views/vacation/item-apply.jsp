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
<c:set var="menu" value="work" />
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
							<option value="취소">취소</option>
						</select>
						<label class="form-label"><strong>사원번호</strong></label>
						<sec:authentication property="principal" var="loginEmployee" />
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">	
						<input type="text" id="text-empNo" name="empNo" value="${loginEmployee.no }" style="text-align:center; width:100px" />
						</sec:authorize>					
						<sec:authorize access="hasAnyRole('ROLE_EMPLOYEE')">
						<input type="text" id="text-empNo" name="empNo" value="${loginEmployee.no }" style="text-align:center; width:100px" readOnly />
						</sec:authorize>
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
								<td><input type="text" name="input-empNo" value="${loginEmployee.no }" style="text-align:center; width:100px" disabled/></td>
								<td><input type="text" name="input-used-days" style="text-align:center; width:100px" disabled/></td>
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
								<td><input type="text" name="input-empName" value="${loginEmployee.name }" style="text-align:center; width:100px" disabled/></td>
								<td><input type="text" name="input-remained-days" style="text-align:center; width:100px" disabled/></td>
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
								<td><input type="text" name="input-start-day" style="text-align:center; width:100px" disabled/>~
								<input type="text" name="input-last-day" style="text-align:center; width:100px" disabled/>
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
						<col width="9%">
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
						<button type="button" id="clean-form" class="btn btn-success btn-sm" style="float:right;" id="">신규/초기화</button>
				</div>
			</div>
			<form method="post" action="" id="form-register">
				<table class="table">
					<tr class="fw-bold">
						<td>휴가신청일 <input type="date" id="currentDate" name="requestDate"  style="text-align:center; width:130px" readOnly/></td>
						<td>휴가기간 <input type="date" id="vacation-start-date" name="startDate" style="text-align:center; width:130px"/>~
								<input type="date" id="vacation-end-date" name="endDate" style="text-align:center; width:130px"/>
								(일수: <input type="text" id="day-count" name="days" style="text-align:center; width:40px" readOnly/>일)
						</td>
						<td>휴가구분 
							<select name="itemCode" style="width: 80px">
							<c:forEach var="item" items="${items }">
								<c:if test="${item.deleted eq 'Y' }">
									<option value=${item.code }>${item.name }</option>
								</c:if>
							</c:forEach>
							</select>
						</td>
						<td>결재상태 <input type="text" id="vacation-status" name="status" value="대기" style="text-align:center; width:70px" readOnly/></td>
					</tr>
				</table>
				<table class="table">
					<tr class="fw-bold">
						<td>휴가사유 <input type="text" name="reason" id="vacation-reason" style="width:500px;">
							<input type="hidden" class="d-none" name="no" value="" id="vacation-no">
						</td>
					</tr>
				</table>
				<div class="row mb-2">
					<div class="col">
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<button type="button" id="update-status-refusal" class="btn btn-outline-dark btn-sm" style="float:right; margin-right: 4px;">반려</button>
							<button type="button" id="update-status-approval" class="btn btn-outline-dark btn-sm" style="float:right; margin-right: 4px;">승인</button>
						</sec:authorize>
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
					<button type="button" id="register-vacation-info" class="btn btn-dark" style="float:right;" id="">신청</button>
					<button type="button" id="cancel-vacation-info" class="btn btn-danger d-none" style="float:right; margin-right: 4px;">취소</button>
					<button type="button" id="modify-vacation-info" class="btn btn-dark d-none" style="float:right; margin-right: 4px;">수정</button>
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
	
	let reqNo;
	
	$(document).on('click', '#click_event', function(event){
		// 동적 이벤트 중복 방지
		event.stopImmediatePropagation();
		let $thisRow = $(this).closest('tr'); 
		let $no = $thisRow.find('td:eq(7)').find('input[name=request-no]').val();
		reqNo = $no;
		
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
		    	$("#vacation-no").val(data.no);
		    	
		    	$("#modify-vacation-info").removeClass("d-none");
		    	$("#cancel-vacation-info").removeClass("d-none");
		    	$("#register-vacation-info").addClass("d-none");
		    }
		})
	});
	
	$("#update-status-approval").click(function() {
		let $status = $("#vacation-status").val();
		
		if ($status === "승인") {
			alert("이미 승인처리된 휴가신청내역입니다.");
			return false;
		}
		$.ajax({
			type: 'GET',
			url : '/vacation/approve',
		    data: {no: reqNo}, 
		    dataType: "json",
		    success: function(data) {
		    	alert("승인 처리 되었습니다.");
		    	searh();
		    	$("#vacation-status").val(data.status);
		    }
		})
	});
	
	$("#update-status-refusal").click(function() {
		let $status = $("#vacation-status").val();
		
		if ($status === "반려") {
			alert("이미 반려처리된 휴가신청내역입니다.");
			return false;
		}
		$.ajax({
			type: 'GET',
			url : '/vacation/refusal',
		    data: {no: reqNo}, 
		    dataType: "json",
		    success: function(data) {
		    	alert("반려 처리 되었습니다.");
		    	searh();
		    	$("#vacation-status").val(data.status);
		    }
		})
	});
	
	$("#clean-form").click(function() {
		$('#currentDate').val(new Date().toISOString().substring(0, 10));
    	$("#vacation-start-date").val("");
    	$("#vacation-end-date").val("");
    	$("#day-count").val("");
    	$("select[name=vacation-item-name]").val("");
    	$("#vacation-status").val("대기");
    	$("#vacation-reason").val("");
    	
    	$("#modify-vacation-info").addClass("d-none");
    	$("#cancel-vacation-info").addClass("d-none");
    	$("#register-vacation-info").removeClass("d-none");
	});
	
	$("#register-vacation-info").click(function() {
		let $startDate = $("#vacation-start-date").val();
		let $endDate = $("#vacation-end-date").val();
		let $reason = $("#vacation-reason").val();
		
		if (!$startDate) {
			alert("휴가 시작일을 입력하세요.");
			return false;
		}
		
		if (!$endDate) {
			alert("휴가 종료일을 입력하세요.");
			return false;
		}
		
		if (!$reason) {
			alert("휴가 사유를 입력하세요.");
			return false;
		}
		
		let insConfirm = confirm("휴가를 신청하시겠습니까?")
		if (insConfirm) {
			alert("휴가신청이 완료되었습니다.");
		} else {
			alert("휴가신청이 취소되었습니다.");
		}
		
		$("#vacation-no").attr("name", "");
		
		$("#form-register").attr("action", "insert-request");
		$("#form-register").trigger("submit");
	});
	
	$("#modify-vacation-info").click(function() {
		let $startDate = $("#vacation-start-date").val();
		let $endDate = $("#vacation-end-date").val();
		let $reason = $("#vacation-reason").val();
		
		if (!$startDate) {
			alert("휴가 시작일을 입력하세요.");
			return false;
		}
		
		if (!$endDate) {
			alert("휴가 종료일을 입력하세요.");
			return false;
		}
		
		if (!$reason) {
			alert("휴가 사유를 입력하세요.");
			return false;
		}
		
		let mdfConfirm = confirm("휴가 신청 내역을 수정하시겠습니까?")
		if (mdfConfirm) {
			alert("내역이 수정되었습니다. \n관리자가 '승인'시 휴가 사용이 가능합니다.");
		}
		
		$("#form-register").attr("action", "modify-request");
		$("#form-register").trigger("submit");
	});
	
	$("#cancel-vacation-info").click(function() {
		let $status = $("#vacation-status").val();
		
		if ($status === "취소") {
			alert("이미 취소된 휴가 신청 내역입니다.");
			return false;
		}
		
		if ($status === "승인") {
			alert("결재상태가 '대기', '반려'상태인 휴가신청만 삭제할 수 있습니다.");
			return false;
		}
		
		let delConfirm = confirm("휴가 신청을 취소하시겠습니까?")
		if (delConfirm) {
			alert("휴가신청내역이 취소되었습니다.");
		}
		
		$("#form-register").attr("action", "cancel-request");
		$("#form-register").trigger("submit");
	});
});
</script>
</body>
</html>