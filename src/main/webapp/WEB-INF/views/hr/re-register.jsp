<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
					<h2><p class="fw-bold">인사정보재등록</p></h2>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-12 text-end">
					<form class="row row-cols-lg-auto g-3 align-items-center">
	  					<div class="col-12">
	   						<h6>검색어</h6>
	  					</div>
	  					<div class="col-12">
	   						<input type="text" class="form-control">
	  					</div>
	  					<div class="col-12">
	   						<button class="btn btn-primary float-end">검색</button>
	  					</div>
	  				</form>
				</div>
			</div>
			
			<div class="row mb-2 bg-light m-2">
						<hr>
						<div class="col">
						<p>
							<i class="bi bi-exclamation-circle-fill"></i>
							회원가입이 된 상태의 회원 정보를 인사에서 삭제할 경우 다시 복원하기 위한 메뉴입니다.
						</p>
						</div>
				</div>
			
			<div class="row mb-3">
				<div class="col-3">
					<i class="bi bi-arrow-right-square-fill text-danger"></i> <strong>사원목록</strong>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-12">
					<table class="table" id="table-employees">
						<colgroup>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
						</colgroup>
						<thead>
							<tr>
								<th>사원번호</th>
								<th>성명</th>
								<th>핸드폰</th>
								<th>외부이메일</th>
								<th>생년월일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty employees }" >
								<c:forEach var="emp" items="${employees }">
									<tr data-emp-no="${emp.employeeNo }" >
										<td>${emp.employeeNo} </td>
										<td><a href="" class="text-decoration-none">${emp.name}</a> </td>
										<td>${emp.mobileTel} </td>
										<td>${emp.extEmail} </td>
										<td><fmt:formatDate value="${emp.birthday}" /> </td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		<form id="form-reregister" class="border bg-light p-3" method="post" action="re-register" >
			<div class="row mb-3">
				<div class="col-3">
					<i class="bi bi-arrow-right-square-fill text-danger"></i> <strong>사원번호등록</strong>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<table class="table table-bordered ">
						<colgroup>
							<col width="15%"/>
							<col width="35%"/>
							<col width="15%"/>
							<col width="35%"/>
						</colgroup>
						<tbody>			
							<tr>
								<th class="table-secondary text-end">사원번호</th>
								<td colsapn="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="employeeNo" /></td>
								<th class="table-secondary text-end">성명</th>
								<td ><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="name" /></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">핸드폰</th>
								<td ><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="mobileTel" /></td>
								<th class="table-secondary text-end">외부이메일</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="extEmail" /></td>
							</tr>	
						</tbody>
					</table>
					<div class="row p-3">
						<div class="col-12 text-end">
							<button type="submit" class="btn btn-dark" id="">인사정보 재등록</button>
						</div>
					</div>	
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
	
	$("#table-employees tbody a").click(function(event) {
		event.preventDefault();
		
		var $tr = $(this).closest("tr");
		var no = $tr.find("td:eq(0)").text();
		var name = $tr.find("td:eq(1)").text();
		var tel = $tr.find("td:eq(2)").text();
		var email = $tr.find("td:eq(3)").text();
		
		$(":input[name=employeeNo]").val(no);
		$(":input[name=name]").val(name);
		$(":input[name=mobileTel]").val(tel);
		$(":input[name=extEmail]").val(email);
	});

	$("#dupli").click(function() {
		
		if (employeeNo = employeeNo) {
			alert("이미 존재하는 사원번호이거나 휴직중인 직원이 아닙니다."); // 재직중인 사원번호랑 동일할때
			return false;
		}
	});
		
	$("#form-reregister").submit(function () {
		
	
		if (employeeNo != name ) {
			alert("이름이 일치하지 않습니다."); // 입력한 사원번호와 이름이 일치하지 않을때
			return false;
		}
		
		if (employeeNo != mobileTel ) {
			alert("핸드폰번호가 일치하지 않습니다."); // 입력한 사원번호와 핸드폰번호가 일치하지 않을때
			return false;
		}
		
		if (employeeNo != extEmail ) {
			alert("외부이메일이 일치하지 않습니다."); // 입력한 사원번호와 외부이메일이 일치하지 않을때
			return false;
		}
		
		if (employeeNo != birthday ) {
			alert("생년월일이 일치하지 않습니다."); // 입력한 사원번호와 생년월일이 일치하지 않을때
			return false;
		}
		
	})
});
</script>
</body>
</html>