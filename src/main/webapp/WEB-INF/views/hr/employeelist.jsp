<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>사원명부/인사기록카드</title>
<style type="text/css">
	.table-scroll tbody {
    	display:block !important;
    	max-height:400px !important;
    	overflow-y:auto !important;				// auto <-> scroll
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
<c:set var="side" value="employeelist" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12 mb-3">
					<h3>사원명부/인사기록카드</h3>
				</div>
				<div class="col-12">
					<form method="get" action="sample">
						<div class="border p-3 bg-white">
							<label>검색어</label>
								<select name="sort">
									<option value="">성명</option>	
									<option value="">직책</option>
									<option value="">부서</option>
								</select>
								<input type="text" name="keyword">
								<button type="submit" class="btn btn-dark float-end">검색</button>
								<input type="checkbox">퇴직자포함
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h6 class="mt-3 mb-3"><strong>인사발령조회</strong></h6>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<table class="table table-light table-scroll" id="table-employee" >
						<colgroup>
							<col width="9%"/>
							<col width="9%"/>
							<col width="9%"/>
							<col width="9%"/>
							<col width="10%"/>
							<col width="12%"/>
							<col width="12%"/>
							<col width="*"/>
						</colgroup>
						<thead>
							<tr class="table-light text-center">
								<th>사원번호</th>
								<th>성명</th>
								<th>직책</th>
								<th>부서</th>
								<th>입사일자</th>
								<th>헨드폰</th>
								<th>e-mail</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="employee" items="${employees }">
								<tr>
									<td class="text-center">${employee.no }</td>
									<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none">${employee.name }</a></td>
									<td class="text-center">${employee.positionName }</td>
									<td class="text-center">${employee.deptName }</td>
									<td class="text-center">${employee.hire }</td>
									<td class="text-center">${employee.mobileTel }</td>
									<td class="text-center">${employee.companyEmail }</td>
									<td class="text-center">${employee.basicAddress }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	   </div>
	   
	<!-- Modal -->
	<div class="modal fade" id="employeeDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">인사상세정보</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="row">
	        	<div class="col-12">
	        		<table class="table" id="table-user">
						<thead>
							<tr>
								<th class="text-center">사원번호</th>
								<th class="text-center">성명</th>
								<th class="text-center">직책</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="employee" items="${employees }">
								<td class="text-center">${employee.no }</td>
								<td class="text-center">${employee.name }</td>
								<td class="text-center">${employee.positionName }</td>
							</c:forEach>
						</tbody>
					</table>
	        	</div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>    
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	// 이름이 table-employee인 엘리먼트의 자손 중에서 a엘리먼트이고 data-name 속성을 가지고 있는 것을 선택하고,
	// 선택된 엘리먼트에서 클릭이벤트가 발생할 때 실행될 이벤트 핸들러함수를 등록한다.
	$("#table-employee a[data-name]").click(function(event) {
		event.preventDefault();
		
		let name = $(this).attr('data-name');
		// alert(name);
	});
})

</script>
</body>
</html>