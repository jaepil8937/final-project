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
					<h2><p class="fw-bold">발령정보</p></h2>
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
						<a href="education" class="btn btn-light px-4">학력정보</a>
						<a href="order" class="btn active btn-light px-4">발령정보</a>
					</div>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-12">
					<table class="table table-bordered">
						<colgroup>
							<col width="16%"/>
							<col width="16%"/>
							<col width="16%"/>
							<col width="16%"/>
							<col width="16%"/>
							<col width="16%"/>
						</colgroup>
						<tr>
							<th class="table-secondary text-end">현부서</th>
							<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="deptName" /></td>
							<th class="table-secondary text-end">현직급</th>
							<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="positionName"  /></td>
							<th class="table-secondary text-end">호봉</th>
							<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="hobong" /></td>
						</tr>
					</table>
				</div>
			</div>
				<div class="row">
					<table class="table table-bordered table-hover table-striped table-sm"  id="table-orders">
						<colgroup>
							<col width="5%">
							<col width="7%">
							<col width="7%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>No</th>
								<th>발령구분</th>
								<th>발령일자</th>
								<th>발령내용</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty personnels }">
									<tr>
										<td id="item-nothing" colspan="12" class="text-center">목록이 없습니다.</td>
									</tr>
								</c:when> 
								<c:otherwise>
									<c:forEach var="personnel" items="${personnels }">
										<tr class="text-center">
											<td><a href="" class="text-decoration-none" > ${personnel.no }</a></td>
											<td>${personnel.type }</td>
											<td><fmt:formatDate value="${personnel.appointmentDate }" pattern="yyyy-MM-dd"/></td>
											<td>${personnel.content }</td>
											<td>${personnel.note }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
			
		
				
				
				
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#table-orders tbody a").click(function(event) {
		event.preventDefault();
		
		var empNo = $(this).text();
		
		$.getJSON("/hr/empInfo", {empNo:empNo}, function(emp) {
			$(":input[name=deptName]").val(emp.deptName);
			$(":input[name=positionName]").val(emp.positionName);
			$(":input[name=hobong]").val(emp.hobong);
		
		})
	
	});
});

</script>
</body>
</html>