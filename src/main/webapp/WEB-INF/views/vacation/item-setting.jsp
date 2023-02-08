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
<style>
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	input:focus {outline: none;}
</style>
</head>
<body>
<c:set var="side" value="item-setting" />
<%@ include file="../common/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr-3">
				<%@ include file="../common/sidebar.jsp" %>
			</div>
			<div class="col-10">
				<div class="row mb-3">
					<h2>휴가항목설정</h2>
				</div>
				<hr>
			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>휴가항목설정</strong>
					</p>
				</div>
			</div>
			<form id="form-setting" method="post" action="/setting">
				<div class="row">
					<div class="col text-end mb-3">
						<button type="button" class="btn btn-outline-dark btn-sm" style="float:right;" id="btn-add-row">행추가</button>
					</div>
				<div class="row">
					<table class="table table-bordered table-sm" id="table-item">
						<colgroup>
							<col width="5%">
							<col width="7%">
							<col width="7%">
							<col width="12%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="*">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th><input type="checkbox" id="check-all"></th>
								<th>구분</th>
								<th>코드</th>
								<th>명칭</th>
								<th>연차반영</th>
								<th>사용여부</th>
								<th>유급반영</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
						<!-- 등록된 게시글이 없으면 아래 내용을 출력한다. -->
						<c:choose>
							<c:when test="${empty items }">
								<tr>
									<td id="item-noting" colspan="12" class="text-center">설정된 휴가항목이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${items }">
									<!-- 등록된 휴가항목이 있으면 등록된 휴가항목들의 갯수만큼 아래 내용을 출력한다. -->
									<tr class="text-center">
										<td><input type="checkbox" name="chk"></td>
										<td>휴가</td>
										<td><input type="number" name="code" value="${item.code }" style="text-align:center; width:50px; border:0 solid black;" readOnly></td>
										<td><input type="text" id="item-name" name="name" value="${item.name }" style="text-align:center; width:100px; border:0 solid black;"></td>
										<td><input type="checkbox" name="used" ${item.used eq 'Y' ? "checked" : ""} value="${item.used eq 'Y' ? 'Y' : 'N' }"></td>
										<td><input type="checkbox" name="deleted" ${item.deleted eq 'Y' ? "checked" : ""} value="${item.deleted eq 'Y' ? 'Y' : 'N' } "></td>
										<td><input type="checkbox" name="payed" ${item.payed eq 'Y' ? "checked" : ""} value="${item.payed eq 'Y' ? 'Y' : 'N' }"></td>
										<td><input type="text" class="form-control form-control-xs w-100"></td>									
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>											
							</tbody>
					</table>
				</div>
				<div class="row mb-2 bg-light m-2">
						<hr>
						<div class="col">
						<p>
							<i class="bi bi-exclamation-circle-fill"></i>
							코드는 휴가신청시 사용하는 항목을 등록합니다. 코드는 자동으로 설정됩니다.<br>
							&nbsp;&nbsp;&nbsp;&nbsp;예)연차(년차), 병가, 경조휴가 등
						</p>
						<p>
							<i class="bi bi-exclamation-circle-fill"></i>
							코드 등록시 연차 반영이 선택되어 있는 코드는 휴가 신청의 휴가 일수를 결재 완료시 사용 연차에 "+"를 해줍니다.
						</p>
						</div>
				</div>
				<div class="row">
					<div class="col text-end">
						<button type="button" class="btn btn-dark" style="float:right;" id="item-add">저장</button>
					</div>
				</div>
				</form>
			</div>	
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	let checkbox = $("input[name=chk]:checked").length;
	
	// 개별체크백수 개수의 따른 전체선택/전체해제 선택처리 기능 구현
	function checkAll() {
	    $("input[name=chk]").on('click', function() {
	        if($('input[name=chk]:checked').length == $('input[name=chk]').length){
	            $('#check-all').prop('checked',true);
	        }else{
	           $('#check-all').prop('checked',false);
	        }
	    })		
	}
	// 행추가 버튼 클릭을 통한 행 추가 기능 구현
	$('#btn-add-row').click(function() {
		let row_index = $("input[name=chk]").length + 1;
		if (row_index === 1) {
			row_index = 1;
		}
		let innerHtml = "";
		innerHtml += '<tr class="text-center">';
		innerHtml += '	<td><input type="checkbox" name="chk"></td>';
		innerHtml += '	<td>휴가</td>';
		innerHtml += '	<td><input type="number" name="code" value="' + row_index + '" style="text-align:center; width:50px; border:0 solid black;" readOnly></td>';
		innerHtml += '	<td><input type="text" name="name" value="" style="text-align:center; width:100%; border:0 solid black;"></td>';
		innerHtml += '	<td><input type="checkbox" name="used" value="" class="is_check"></td>';
		innerHtml += '	<td><input type="checkbox" name="deleted" value="" class="is_check"></td>';
		innerHtml += '	<td><input type="checkbox" name="payed" value="" class="is_check"></td>';
		innerHtml += '	<td><input type="text" class="form-control form-control-xs w-100"></td>';
		innerHtml += '</tr>';
		$("#item-noting").addClass("d-none");
	    $('#table-item > tbody:last').append(innerHtml);
	    checkAll();
	    
	  });
	
	// 체크박스 전체선택/전체해제 기능 구현
    //최상단 체크박스 클릭
    $("#check-all").on('click', function(){
        //클릭되었으면
        if($("#check-all").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    })
    
    checkAll();
	
	
    $("#item-add").click(function() {
    	// 체크된 체크박스가 없으면 알림창.
    	if($("input[name=chk]:checked").length == 0) {
    		alert("수정/저장할 휴가 항목을 선택하세요.");
    		return false;
    	} else {
    		var itemArr = [];
    		$("input[name=chk]:checked").each(function(){
    			var thisRow = $(this).closest('tr');
	    		var items_code = thisRow.find('td:eq(2)').find('input').val();
	    		var items_name = thisRow.find('td:eq(3)').find('input').val();
	    		var items_used = thisRow.find('td:eq(4)').find('input').is(':checked') ? 'Y' : 'N';
	    		var items_deleted = thisRow.find('td:eq(5)').find('input').is(':checked') ? 'Y' : 'N';
	    		var items_payed = thisRow.find('td:eq(6)').find('input').is(':checked') ? 'Y' : 'N';
	    		
	    		// 명칭 입력하지 않으면 알림창.
	    		if (items_name == "") {
	    			alert("명칭을 입력하세요.");
	    			return false;
	    		}
	    			
	    			
	    		var data = {
	    				"code" : items_code,
	    				"name" : items_name,
	    				"used" : items_used,
	    				"deleted" : items_deleted,
	    				"payed" : items_payed
	    		};
	    		
	    		itemArr.push(data);
    			
    		});
	    		$.ajax({
	    			type: 'post',
	    			url: '/vacation/setting',
	    			data: JSON.stringify(itemArr),
	    			contentType: 'application/json',
	    			dataType: 'json',
	    			success: function(data) {
	    				if (data.result == "ok") {
	    					$("input[name=chk]").prop("checked",false);
	    				}
	    			}
	    		});
    		
    	}
    });
});
</script>
</body>
</html>