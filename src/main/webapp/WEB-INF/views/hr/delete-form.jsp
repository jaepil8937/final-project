<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	trimDirectiveWhitespaces="true"%>
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
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
				<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
				<div class="col-12">
					<div class="btn-group">
						<a href="/hr/password" class="btn btn-outline-dark px-4">비밀번호 변경</a>
						<a href="/hr/delete" class="btn btn-dark active px-4">탈퇴하기</a>
					</div>
				</div>
			</div>
					<c:if test="${param.error eq 'fail' }">
						<h3>비밀번호가 일치하지 않습니다.</h3>
					</c:if>
			<form id="form-delete" class="border bg-light p-3" method="post" action="delete">
				<div class="mb-3">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password">
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-dark btn-sm">탈퇴</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#form-delete").submit(function() {
		let password = $("#form-delete :input[name=password]").val();
		
		if (password == "") {
			alert("비밀번호는 필수입력값입니다.");
			return false;
		}
		return true;
	});
})

</script>
</body>
</html>