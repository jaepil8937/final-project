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
<c:set var="menu" value="work" />
<c:set var="side" value="monthly-status" />
<%@ include file="../common/navbar.jsp" %>
<div class="container my-3">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
				<div class="col">
					<h1 class="fs-10 p-4" style="font-weight: bold;">월근태현황</h1>
				</div>
			</div>
			<hr>
			<div class="row mb-3 p-4 bg-light" align="center">
				<form>
					<label for="month" style="padding-top: 12px;">근무년월: <input
						   type="month" id="currentMonth" name="month-work" value="" min="" max="2023-12-31">
					</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<th>사원번호: <input type="number" min="1000" max="2000" /></th>&nbsp;
					<th>
						부서 : 
						<select name="dept">
						    <option value="">부서선택</option>
						    <option value="개발팀">개발팀</option>
						    <option value="영업팀">영업팀</option>
						    <option value="인사팀">인사팀</option>
						</select>
					</th>&nbsp;&nbsp;
					<button type="button" class="btn btn-danger btn-sm" >조회</button>
				</form>
			</div>
			<div class="row">
				<div class="col-5 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>월근태현황</strong>
					</p>
				</div>
				<div class="col-7 mb-3 bg-light text-end">
					<p>
						<i class="bi bi-exclamation-circle-fill"></i>
						 아이콘 클릭시 상세내용이 보입니다. 
						<i class="bi bi-square-fill" style="color: #91C483 ;">: 출근</i>  
						<i class="bi bi-square-fill" style="color: #ffc34d ;">: 지각</i>  
						<i class="bi bi-square-fill" style="color: #e76a83 ;">: 조퇴</i>  
						<i class="bi bi-square-fill" style="color: #6495ed ;">: 휴가</i>
					</p>
				</div>
			</div>
		<form>
		<div class="row">
			<table class="table table-bordered table-hover table-sm" id="table-month-status">
				<colgroup>
					<col width="5%">
					<col width="4%">
					<col width="4%">
					<col width="4%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="2%">
					<col width="5%">
				</colgroup>
			  	<thead>
				    <tr class="text-center" style="text-align: center;">
				    		<th rowspan="2">사원번호</th>
				    		<th rowspan="2">성명</th>
				    		<th rowspan="2">부서</th>
				    		<th rowspan="2">직급</th>
				      		<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th>9</th>
							<th>10</th>
							<th>11</th>
							<th>12</th>
							<th>13</th>
							<th>14</th>
							<th>15</th>
							<th>16</th>
							<th rowspan="2">비고</th>
						</tr>
						<tr class="text-center" style="text-align: center;">
				      		<th>17</th>							
				      		<th>18</th>							
				      		<th>19</th>							
				      		<th>20</th>							
				      		<th>21</th>							
				      		<th>22</th>							
				      		<th>23</th>							
				      		<th>24</th>							
				      		<th>25</th>							
				      		<th>26</th>							
				      		<th>27</th>							
				      		<th>28</th>							
				      		<th>29</th>							
				      		<th>30</th>							
				      		<th>31</th>							
				    </tr>
			  	</thead>
				<tbody>
				    <tr class="text-center" style="text-align: center;">
				    		<td rowspan="2">1001</TD>
				    		<td rowspan="2">홍길동</td>
				    		<td rowspan="2">개발팀</td>
				    		<td rowspan="2">사원</td>
				      		<td id="1">1</td>
							<td id="2">2</td>
							<td id="3">3</td>
							<td id="4">4</td>
							<td id="5">5</td>
							<td id="6">6</td>
							<td id="7">7</td>
							<td id="8">8</td>
							<td id="9">9</td>
							<td id="10">10</td>
							<td id="11">11</td>
							<td id="12">12</td>
							<td id="13">13</td>
							<td id="14">14</td>
							<td id="15">15</td>
							<td id="16">16</td>
							<td rowspan="2">
								<p text="center">지각 : 조퇴: 휴가: </p>
							</td>
						</tr>
						<tr class="text-center" style="text-align: center;">
							<td id="17">17</td>
							<td id="18">18</td>
							<td id="19">19</td>
							<td id="20">20</td>
							<td id="21">21</td>
							<td id="22">22</td>
							<td id="23">23</td>
							<td id="24">24</td>
							<td id="25">25</td>
							<td id="26">26</td>
							<td id="27">27</td>
							<td id="28">28</td>
							<td id="29">29</td>
							<td id="30">30</td>
							<td id="31">31</td>
						</tr>
				    </tr>
			  </tbody>
			</table>
			</div>
	    	</div>
	    	</div>
	    	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
document.getElementById('currentMonth').value= 
	new Date().toISOString().slice(0, 7);
</script>
</body>
</html>