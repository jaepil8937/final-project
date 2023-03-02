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
						<a href="/hr/password" class="btn btn-dark active px-4">비밀번호 변경</a>
						<a href="/hr/delete" class="btn btn-outline-dark px-4">탈퇴하기</a>
					</div>
				</div>
			</div>
				<div class="col-12">
					<c:if test="${param.error eq 'fail' }">
						<h3>이전 비밀번호가 일치하지 않습니다.</h3>
					</c:if>
					<form id="form-change-password" class="border bg-light p-3" method="post" action="password">
						<div class="mb-3">
							<label class="form-label">이전 비밀번호</label>
							<input type="password" class="form-control" name="oldPassword">
						</div>
						<div class="mb-3">
							<label class="form-label">새 비밀번호</label>
							<input type="password" class="form-control" id="password" name="password">
						</div>
						<div class="mb-3">
							<label class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="password-confirm">
						</div>
						<div class="text-end">
							<button type="submit" class="btn btn-dark btn-sm">비밀번호 변경</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	   $("#form-change-password").submit(function() {
	      let oldPassword = $(":password[name=oldPassword]").val();
	      let password = $("#password").val();
	      let passwordConfirm = $("#password-confirm").val();
	      
	      if (oldPassword == "") {
	         alert("이전 비밀번호는 필수 입력값입니다.");
	         return false;
	      }
	      if (password == "") {
	         alert("새 비밀번호는 필수 입력값입니다.");
	         return false;
	      }
	      if (passwordConfirm == "") {
	         alert("비밀번호 확인은 필수 입력값입니다.");
	         return false;
	      }
	      if (oldPassword == password) {
	         alert("새 비밀번호를 이전 비밀번호와 같은 값으로 지정할 수 없습니다.");
	         return false;
	      }
	      if (password != passwordConfirm) {
	         alert("새 비밀번호와 비밀번호 확인 값이 서로 일치하지 않습니다.");
	         return false;
	      }
	      
	      return true;
	   });
	})
</script>
</body>
</html>