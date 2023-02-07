<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>급여계산</title>
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
					<h2><strong>급여계산</strong></h2>
					<li>월별, 사원별 급여정보를 입력, 저장, 관리하는 메뉴입니다. 귀속연월을 확인하세요.</li>
				</div>
			</div>
		<hr>
			<div class="row mt-3">
				<div class="col-12">
					<label>귀속연월</label> <input type="month" /> &nbsp; 
					<label>정산기간</label> <input type="date" /> ~ <input type="date" /> &nbsp; 
					<label>급여지급일</label> <input type="date" />
				</div>	
				<div class="row mt-5">
					<div class="col-6">
				        <table class="table" border="3">
							<thead>
								<tr>
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
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>5,000,000</td>
									<td>200,000</td>
									<td>4,800,000</td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>5,000,000</td>
									<td>200,000</td>
									<td>4,800,000</td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>5,000,000</td>
									<td>200,000</td>
									<td>4,800,000</td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>5,000,000</td>
									<td>200,000</td>
									<td>4,800,000</td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>5,000,000</td>
									<td>200,000</td>
									<td>4,800,000</td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>5,000,000</td>
									<td>200,000</td>
									<td>4,800,000</td>
								</tr>
								<tr>
									<td>1000</td>
									<td>홍길동</td>
									<td>개발팀</td>
									<td>5,000,000</td>
									<td>200,000</td>
									<td>4,800,000</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th colspan="3">합&emsp;&emsp;&emsp;계</th>
									<th>35,000,000</th>
									<th>1,400,000</th>
									<th>33,600,000</th>
								</tr>
							</tfoot>	
						</table>
					</div>
					
					<div class="col-6">
						<table class="table" border="3">
							<colgroup>  
								<col width="25%">
								<col width="25%">
								<col width="25%">
								<col width="25%">		
							</colgroup>
							<thead>
								<tr>
									<th colspan="2">지급항목</th>
									<th colspan="2">공제항목</th>
								</tr>
							</thead>  
							<tbody>
								<tr>
									<td>기본급</td>
									<td><input type="text" name="base-salary" size="10"/></td>
									<td>소득세</td>
									<td><input type="text" name="income-tax" size="10"/></td>
								</tr>
								<tr>
									<td>식대</td>
									<td><input type="text" name="" size="10"/></td>
									<td>주민세</td>
									<td><input type="text" name="" size="10"/></td>
								</tr>
								<tr>
									<td>연장수당</td>
									<td><input type="text" name="" size="10"/></td>
									<td>국민연금</td>
									<td><input type="text" name="" size="10"/></td>
								</tr>
								<tr>
									<td>야간수당</td>
									<td><input type="text" name="" size="10"/></td>
									<td>건강보험</td>
									<td><input type="text" name="" size="10"/></td>
								</tr>
								<tr>
									<td>휴일근무수당</td>
									<td><input type="text" name="" size="10"/></td>
									<td>장기요양보험</td>
									<td><input type="text" name="" size="10"/></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>고용보험</td>
									<td><input type="text" name="" size="10"/></td>
								</tr>
								<tr>
									<th>지급총액</th>
									<th><input type="text" name="" size="10"/></th>
									<th>공제총액</th>
									<th><input type="text" name="" size="10"/></th>
								</tr>
							</tbody>	
							<tfoot>
								<tr>
									<th colspan="4">실지급액: 원</th>
								</tr>
							</tfoot>
						</table>
						<button type="button" class="btn btn-warning btn-sm" id="auto-calculate">자동계산</button>
						&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;
							<button class="btn btn-primary btn-sm" id="btn-save">저장</button>
							<button type="button" class="btn btn-secondary btn-sm" id="btn-delete">내용지우기</button>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>			

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>