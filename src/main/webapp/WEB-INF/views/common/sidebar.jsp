<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	.dropdown-item {
		font-size: x-small;
	}
</style>
</head>
<div class="container bg-dark">
	<nav class="navbar bg-dark fixed-left" data-bs-theme="dark">
		<ul id="main-menu" class="navbar-nav">
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-light" href="#" data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">근태관리</a>
				<ul class="dropdown-menu dropdown-menu-dark" id="sub-menu">
					<li><a class="dropdown-item ${side eq '1' ? 'text-light fw-bold' : '' }" href="#">일일근태등록</a></li>
					<li><a class="dropdown-item ${side eq '2' ? 'text-light fw-bold' : '' }" href="#">월근태생성/마감</a></li>
					<li><a class="dropdown-item ${side eq '3' ? 'text-light fw-bold' : '' }" href="#">휴일달력</a></li>
					<li><a class="dropdown-item ${side eq '3' ? 'text-light fw-bold' : '' }" href="#">휴일일괄설정</a></li>
					<li><a class="dropdown-item ${side eq '4' ? 'text-light fw-bold' : '' }" href="#">휴일/연장/야간근무조회</a></li>
				</ul>
			</li>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-light " href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">휴가관리</a>
				<ul class="dropdown-menu dropdown-menu-dark" id="sub-menu">
					<li><a class="dropdown-item  ${side eq '5' ? 'text-light fw-bold' : '' }" href="#">근속연수별 휴가 설정</a></li>
					<li><a class="dropdown-item  ${side eq 'item-setting' ? 'text-light fw-bold' : '' }" href="/vacation/setting">휴가항목설정</a></li>
					<li><a class="dropdown-item  ${side eq 'item-calculation' ? 'text-light fw-bold' : '' }" href="/vacation/calculation">휴가일수조회</a></li>
					<li><a class="dropdown-item  ${side eq 'item-apply' ? 'text-light fw-bold' : '' }" href="/vacation/apply">휴가신청/취소</a></li>
					<li><a class="dropdown-item  ${side eq 'item-used' ? 'text-light fw-bold' : '' }" href="/vacation/used">휴가사용현황</a></li>
				</ul>
			</li>		
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-light" href="#" data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">인사관리</a>
				<ul class="dropdown-menu dropdown-menu-dark" id="sub-menu">
					<li><a class="dropdown-item ${side eq '1' ? 'text-light fw-bold' : '' }" href="/hr/register">인사정보등록</a></li>
					<li><a class="dropdown-item ${side eq '2' ? 'text-light fw-bold' : '' }" href="/hr/re-register">인사정보재등록</a></li>
					<li><a class="dropdown-item ${side eq 'employeelist' ? 'text-light fw-bold' : '' }" href="/hr/info">사원명부/인사기록카드</a></li>
					<li><a class="dropdown-item ${side eq 'personnel' ? 'text-light fw-bold' : '' }" href="/hr/personnel">인사발령등록</a></li>
					<li><a class="dropdown-item ${side eq 'certificate' ? 'text-light fw-bold' : '' }" href="/hr/issue">증명서발급</a></li>
					<li><a class="dropdown-item ${side eq '6' ? 'text-light fw-bold' : '' }" href="#">회원탈퇴/비밀번호변경</a></li>
				</ul>
			</li>	
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-light" href="#" data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">급여관리</a>
				<ul class="dropdown-menu dropdown-menu-dark" id="sub-menu">
					<li><a class="dropdown-item ${side eq '1' ? 'text-light fw-bold' : '' }" href="/pay/paybase">급여기본정보관리</a></li>
					<li><a class="dropdown-item ${side eq '2' ? 'text-light fw-bold' : '' }" href="/pay/extrapay">기본수당외 수당</a></li>
					<li><a class="dropdown-item ${side eq '3' ? 'text-light fw-bold' : '' }" href="/pay/salarytax">급여비과세표</a></li>
					<li><a class="dropdown-item ${side eq '3' ? 'text-light fw-bold' : '' }" href="/pay/grade">급호테이블</a></li>
					<li><a class="dropdown-item ${side eq '4' ? 'text-light fw-bold' : '' }" href="/pay/simpletax">간이세액조견표</a></li>
					<li><a class="dropdown-item ${side eq '4' ? 'text-light fw-bold' : '' }" href="/pay/insurance">4대보험요율표</a></li>
					<li><a class="dropdown-item ${side eq '4' ? 'text-light fw-bold' : '' }" href="/pay/simpletax">급여계산</a></li>
				</ul>
			</li>	
		</ul>
	</nav>
</div>