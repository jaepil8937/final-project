<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>인사발령등록</title>
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
				<div class="col-12">
					<h3>인사발령등록</h3>
				</div>	
				<div class="col-12 mb-3">
					<form method="get" action="">
						<div class="border p-3 bg-white">
							<label>발령구분</label>
							<select name="">
								<option value="">입사</option>
								<option value="">승진</option>
								<option value="">전보</option>
								<option value="">휴직</option>
								<option value="">퇴직</option>
							</select>
							<label>발령일자</label>
							<input type="date">~<input type="date">
							<button class="btn btn-dark float-end">검색</button>
						</div>
					</form>
				</div>
				<div class="col-12">
					<div class="col-12" id="personnelDetail">
						<h6>인사발령조회<button type="button" class="float-end">발령등록</button>
									 <button class="float-end">발령취소</button>
						</h6>
							
					</div>	
					<table class="table border p-3 bg-white">
						<colgroup>
							<col width="5%"/>
							<col width="9%"/>
							<col width="9%"/>
							<col width="12%"/>
							<col width="9%"/>
							<col width="9%"/>
							<col width="12%"/>
							<col width="*"/>
						</colgroup>
						<thead>
							<tr>
								<th class="table-primary text-center"></th>
								<th class="table-primary text-center" >No</th>
								<th class="table-primary text-center">발령구분</th>
								<th class="table-primary text-center">발령일자</th>
								<th class="table-primary text-center">사원번호</th>
								<th class="table-primary text-center">성명</th>
								<th class="table-primary text-center">발령내용</th>
								<th class="table-primary text-center">비고</th>
							</tr>
						</thead>
						<tbody>
							<td class="text-center"><input type="checkbox" /></td>
							<td class="text-center">1</td>
							<td class="text-center">승진</td>
							<td class="text-center">20220303</td>
							<td class="text-center">1000</td>
							<td class="text-center">홍길동</td>
							<td class="text-center">사원->대리</td>
							<td class="text-center"></td>
						</tbody>
					</table>
				</div>
			</div>
		</div>
<!-- Modal -->
	<div class="modal fade" id="personnelDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	let model = new bootstrap.Modal("#personnelDetail");

	// 프로그램 목록 클릭시 상세정보 모달창이 나타난다.
	$("#personnelDetail tbody").on('click', '.name', function(event) {
	   event.preventDefault();
	   
	   model.show();
	});
})
</script>
</body>
</html>