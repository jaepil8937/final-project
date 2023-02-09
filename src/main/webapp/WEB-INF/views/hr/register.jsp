<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
<c:set var="menu" value="employee" />
<%@ include file="../common/navbar.jsp" %>
<div class="container mb-3">
	<div class="row mb-3">
		<div class="col-2">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row mb-3">
				<div class="col-12">
					<h2><p class="fw-bold">인사정보등록</p></h2>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12 text-end">
					<form class="row row-cols-lg-auto g-3 align-items-center">
	  					<div class="col-12">
	   						<select class="form-select">
								<option>성명</option>
								<option>직책</option>
								<option>부서</option>
							</select>
	  					</div>
	  				<div class="col-12">
	   					<input type="text" class="form-control">
	  				</div>
	  				<div class="col-12">
	   					<button class="btn btn-primary float-end">검색</button>
	  				</div>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-3">
					<i class="bi bi-arrow-right-square-fill text-danger"></i> <strong>기본정보</strong>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-12">
					<table class="table">
						<colgroup>
							<col width=""/>
							<col width=""/>
							<col width=""/>
							<col width=""/>
							<col width=""/>
							<col width=""/>
							<col width=""/>
							<col width=""/>
						</colgroup>
						<thead>
							<tr>
								<th  class="table-primary">사원번호</th>
								<th>성명</th>
								<th>직책</th>
								<th>부서</th>
								<th>입사일자</th>
								<th>퇴사일자</th>
								<th>핸드폰</th>
								<th>회사이메일</th>
								<th>주소</th>
								<th>메모</th>
							</tr>
						</thead>
						<tbody>
							<td>1000</td>
							<td>홍길동</td>
							<td>사원</td>
							<td>개발팀</td>
							<td>20220101</td>
							<td>20220102</td>
							<td>010-1234-1234</td>
							<td>hong@gmail.com</td>
							<td>서울시 종로구</td>
							<td>안녕하세요</td>
						</tbody>
					</table>
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
						<a href="register" class="btn active btn-light px-4">인적사항</a>
						<a href="family" class="btn btn-light px-4">가족사항</a>
						<a href="education" class="btn btn-light px-4">학력정보</a>
						<a href="order" class="btn btn-light px-4">발령정보</a>
					</div>
				</div>
			</div>
		<form id="form-register" class="border bg-light p-3" method="post" action="register" enctype="multipart/form-data">
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
							<tbody>
								<tr>
									<td rowspan="4">
										<img id="dest-image" src="/resources/images/employee/default.jpg" class="img-fluid" alt="...">
										<input type="file" class="form-control form-control-sm" name="file1">	
									</td>	
									<th class="table-secondary text-end">사원번호</th>
									<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="employeeNo"/></td>
									<th class="table-secondary text-end">비밀번호</th>
									<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="password"/></td>	
								</tr>
								<tr>
									<th class="table-secondary text-end">성명</th>
									<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="name"/></td>
									<th class="table-secondary text-end">생년월일</th>
									<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="birthday"/></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">성별</th>
									<td><input class="form-check-input" type="radio" name="gender"  id="flexRadioDefault1" checked >
									<label class="form-check-label" for="flexRadioDefault1">남</label>
									<input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" >
	  								<label class="form-check-label" for="flexRadioDefault2">여</label>
									</td>	
									
								<tr>
									<th class="table-secondary text-end">메모</th>
									<td colspan="4"><textarea class="form-control" rows="3" name="memo" ></textarea></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">회사전화</th>
									<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="comTel"/></td>
									<th class="table-secondary text-end">자택전화</th>
									<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="homeTel"/></td>
									<th class="table-secondary text-end">핸드폰</th>
									<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="mobileTel"/></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">회사이메일</th>
									<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;" name="comEmail"/></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">외부이메일</th>
									<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;" name="extEmail"/></td>
								</tr>
								
								<tr>
									<th class="table-secondary text-end" rowspan="3">주소</th>
									<td colspan="5">
										<input type="text" class="form-control form-control-sm d-inline-block"  style="width: 130px;" path="zipcode" name="postcode" readonly="readonly" disabled/>
										<button type="button" class="btn btn-primary btn-sm" id="btn-search-postcode" >주소찾기</button>
									</td>
								</tr>
								<tr>
									<td colspan="5"><input type="text" class="form-control form-control-sm" name="address1" path="basicAddress" readonly="readonly" disabled /></td>
								</tr>
								<tr>
									<td colspan="5"><input type="text" class="form-control form-control-sm" name="address2" path="detailAddress" /></td>
								</tr>			
								<tr>
									
									<th class="table-secondary text-end">재직구분</th>
									<td><select style="width: 130px;" name="employeeStatus"/>
											<option>재직</option>
											<option>휴직</option>
										</select>
									</td>
									<th class="table-secondary text-end">보유권한</th>
									<td colspan="3"><input class="form-check-input" type="radio" name="employeeRoleName" id="flexRadioDefault2" checked>
									<label class="form-check-label" for="flexRadioDefault2">관리자</label>
									<input class="form-check-input" type="radio" name="employeeRoleName" id="flexRadioDefault2" >
	  								<label class="form-check-label" for="flexRadioDefault2">직원</label></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">부서</th>
									<td>
										<select style="width: 130px;" name="deptNo"/>
											<c:forEach var="departments" items="${dept}">
												<option value="${dept.no}"> ${dept.name}</option>
											</c:forEach>
												<option value="100">개발팀</option>
												<option value="101">디자인팀</option>
												<option value="102">테스트팀</option>
												<option value="103">기획팀</option>
										</select>
									</td>
									<th class="table-secondary text-end">입사일자</th>
									<td colspan="3"><input type="date" id="start-date" name="hireDate" value="2023-02-03" style="text-align:center; width:130px" /></td>	
								</tr>
								<tr>
									<th class="table-secondary text-end">직급</th>
									<td>
										<select style="width: 130px;" name="positionNo"/>
											<c:forEach var="positions" items="${position}">
												<option value="${position.no}"> ${position.name}</option>
											</c:forEach>
												<option value="1">사원</option>
												<option value="2">대리</option>
												<option value="3">과장</option>
												<option value="4">차장</option>
										</select>
									</td>
									<th class="table-secondary text-end">퇴사일자</th>
									<td colspan="3"><input type="date" id="end-date" name="retirementDate" value="2023-02-03" style="text-align:center; width:130px"/></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">호봉</th>
									<td>
										<select style="width: 130px;" name="hobong"/>
											<option>1호봉</option>
											<option>2호봉</option>
											<option>3호봉</option>
											<option>4호봉</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
					<div class="row p-3">
						<div class="col">
							<button type="submit" class="btn btn-dark" style="float:right;" >저장</button>
								<a href="register" class="btn btn-outline-dark" style="float:right; margin-right: 4px;" >삭제</a>
								<a href="" class="btn btn-outline-dark" style="float:right; margin-right: 4px;" >엑셀업로드</a>
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
	// name이 file1이 파일선택 필드의 값이 변경되면 실행되는 콜백함수를 등록한다.
	document.querySelector('[name=file1]').addEventListener('change', function(event) {
		// FileReader객체를 생성한다.
		var reader = new FileReader();
		// FileReader객체로 파일선택 필드에서 선택한 파일을 읽어온다.
		reader.readAsDataURL(event.target.files[0]);
		// 파일을 전부 읽어오면 <img />태그에 적용시킨다.
		reader.onload = function(){
			var img = document.querySelector('#dest-image');
		    img.src = reader.result;
		};
	});
	
	
	  $("#btn-search-postcode").click(function() {
	    new daum.Postcode({
	      oncomplete: function(data) {
	        // 기본주소 정보를 대입하는 변수를 선언한다.
	        let address;
	        // 사용자가 도로명 주소를 선택했을 때 data.userSelectedType은 R이다.
	        if (data.userSelectedType === 'R') {
	          address = data.roadAddress;
	        } else {
	          address = data.jibunAddress;
	        }
					
	        // 우편번호 입력필드와 기본주소 입력필드에 값을 입력한다.
	        $(":input[name=postcode]").val(data.zonecode);
	        $(":input[name=address1]").val(address);
				
	        // 상세주소 입력필드에 포커스를 위치시킨다.
	        $(":input[name=address2]").focus();
	      }
	    }).open();
	  });
	})
</script>
</body>
</html>