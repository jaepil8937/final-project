<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link ${menu eq 'home' ? 'active' : '' }" href="/">인사관리시스템</a></li>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle ${menu eq 'employee' ? 'active' : '' }" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						인사
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">인사정보</a></li>
						<li><a class="dropdown-item" href="#">증명서관리</a></li>
						<li><a class="dropdown-item" href="#">내정보관리</a></li>
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle ${menu eq 'attendences' ? 'active' : '' }" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						근무
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">근태관리</a></li>
						<li><a class="dropdown-item" href="#">휴가관리</a></li>
					</ul>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle ${menu eq 'salary' ? 'active' : '' }" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						급여
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">급여기본정보관리</a></li>
						<li><a class="dropdown-item" href="#">기본수당 외 수당관리</a></li>
						<li><a class="dropdown-item" href="#">급여기초정보설정/조회</a></li>
						<li><a class="dropdown-item" href="#">급여계산</a></li>
						<li><a class="dropdown-item" href="#">급여조회</a></li>
						<li><a class="dropdown-item" href="#">국민연금/건강보험/고용보험 조회</a></li>
					</ul>
				</li>
			</sec:authorize>	
		</ul>
		<sec:authorize access="isAuthenticated()">
			<span class="navbar-text"><strong class="text-white"><sec:authentication property="principal.name"/></strong>님 환영합니다.</span>
		</sec:authorize>
		<ul class="navbar-nav">
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="nav-link" href="/logout" id="logout">로그아웃</a></li>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<li class="nav-item"><a class="nav-link ${menu eq 'login' ? 'active' : '' }" href="/login">로그인</a></li>
			</sec:authorize>
		</ul>
	</div>
</nav>
<form id="form-logout" method="post" action="logout">
	<sec:csrfInput />
</form>
<script>		
	function logout(event) {
		event.preventDefault();
		document.getElementById("form-logout").submit();
	}
</script>