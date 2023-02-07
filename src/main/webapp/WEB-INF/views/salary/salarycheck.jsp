<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>급여조회</title>
</head>
<body>
<style>
    table th, table td {
		border: 1px solid #c0c0c0;
		text-align: center;
	}	
	thead, tfoot {
		background-color: lightgray;
	}
	#auto-calculate, #btn-save {
		width:80px;
	}
</style>
<c:set var="menu" value="pay" />
<%@ include file="../common/navbar.jsp" %>
<c:set var="side" value="" />
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
	
		<div class="col-10">
			<div class="row">
				<div class="col-12">
					<h2><strong>급여조회</strong></h2>
					<li>월별 급여내역을 확인할 수 있습니다.</li>
				</div>
			</div>
		<hr>
			<div class="row mt-3">
				<div class="col-12">
					<form class="row row-cols-sm-auto g-3 align-items-center float-end" method="get" action="list">
						<label>급여년월</label> <input type="month" /> &nbsp; 
						<div class="col-12">
							<select class="form-select" name="opt">
								<option value="name" ${param.opt == 'name' ? 'selected' : '' }>사원이름</option>
								<option value="number" ${param.opt == 'number' ? 'selected' : '' }>사원번호</option>
								<option value="department" ${param.opt == 'department' ? 'selected' : '' }>부서</option>
							</select>
						</div>
						<div class="col-12">
							<input type="text" class="form-control" size="10" name="keyword" value="${param.keyword }"/>
						</div>	
						<div class="col-12">
							<button type="submit" class="btn btn-outline-primary btn-sm" id="btn-search">검색</button>
						</div>	
					</form>	
				</div>	
			</div>	
			<div class="row mt-4">
			<h6><strong>급여목록</strong></h6>
				<div class="col-12 text-end">
			        <table class="table" border="3">
			        	<colgroup>  
							<col width="16%">
							<col width="12%">
							<col width="12%">
							<col width="12%">		
							<col width="16%">		
							<col width="16%">		
							<col width="16%">		
						</colgroup>
						<thead>
							<tr>
								<th>급여지급일</th>
								<th>사원번호</th>
								<th>성 명</th>
								<th>부 서</th>
								<th>지급총액</th>
								<th>공제총액</th>
								<th>실지급액</th>
							</tr>
						</thead>  
						<tbody>
							<tr>
								<td>2023.03.25</td>
								<td>1000</td>
								<td>홍길동</td>
								<td>개발팀</td>
								<td>5,000,000</td>
								<td>200,000</td>
								<td>4,800,000</td>
							</tr>
							<tr>
								<td>2023.03.25</td>
								<td>1000</td>
								<td>홍길동</td>
								<td>개발팀</td>
								<td>5,000,000</td>
								<td>200,000</td>
								<td>4,800,000</td>
							</tr>
							<tr>
								<td>2023.03.25</td>
								<td>1000</td>
								<td>홍길동</td>
								<td>개발팀</td>
								<td>5,000,000</td>
								<td>200,000</td>
								<td>4,800,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-12 text-end">
			       	<table class="table" border="3">
			       		<colgroup>  
							<col width="16%">
							<col width="12%">
							<col width="12%">
							<col width="12%">		
							<col width="16%">		
							<col width="16%">		
							<col width="16%">		
						</colgroup>
						<tfoot>
							<tr>
								<th colspan="4">합&emsp;&emsp;&emsp;계</th>
								<th>35,000,000</th>
								<th>1,400,000</th>
								<th>33,600,000</th>
							</tr>
						</tfoot>	
					</table>
				</div>
			</div>	
			<div class="row mt-4">
				<h6><strong>급여명세서</strong></h6>
				<div class="col-12">
					<table class="table" border="3">
						<colgroup>  
								<col width="10%">
								<col width="22%">
								<col width="23%">
								<col width="22%">		
								<col width="23%">		
							</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th colspan="2">지급항목</th>
								<th colspan="2">공제항목</th>
							</tr>
						</thead>  
						<tbody>
							<tr>
								<td>1</td>
								<td>기본급</td>
								<td></td>
								<td>소득세</td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td>식대</td>
								<td></td>
								<td>주민세</td>
								<td></td>
							</tr>
							<tr>
								<td>3</td>
								<td>연장수당</td>
								<td></td>
								<td>국민연금</td>
								<td></td>
							</tr>
							<tr>
								<td>4</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>5</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>6</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th>합&emsp;계</th>
								<th>지급총액</th>
								<th></th>
								<th>공제총액</th>
								<th></th>
							</tr>
						</tfoot>	
					</table>
				</div>
			</div>
		</div>
	</div>			
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>