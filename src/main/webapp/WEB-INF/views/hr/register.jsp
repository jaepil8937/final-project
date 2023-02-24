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
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<h2><p class="fw-bold">인사정보등록</p></h2>
					</sec:authorize>
				</div>
				<div class="col-12">
					<sec:authorize access="hasAnyRole('ROLE_EMPLOYEE')">
						<h2><p class="fw-bold">인사정보</p></h2>
					</sec:authorize>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12 text-end">
					<form class="row row-cols-lg-auto g-3 align-items-center" action="register">
	  					<div class="col-12">
	   						<select class="form-select">
								<option>성명</option>
								<option>직급</option>
								<option>부서</option>
							</select>
	  					</div>
		  				<div class="col-12">
		   					<input type="text" class="form-control" name="keyword">
		  				</div>
		  				<div class="col-12">
		   					<button class="btn btn-primary float-end">검색</button>
		  				</div>
		  			</form>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-3">
					<i class="bi bi-arrow-right-square-fill text-danger"></i> <strong>기본정보</strong>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-12">
					<table class="table" id="table-emp-list">
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
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
								<th>입사일자</th>
								<th>핸드폰</th>
								<th>회사이메일</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${not empty employees }">
							<c:forEach var="emp" items="${employees }">
								<tr data-emp-no="${emp.employeeNo }">
									<td>${emp.employeeNo} </td>
									<td><a href="" class="text-decoration-none">${emp.name} </td>
									<td>${emp.positionName} </td>
									<td>${emp.deptName} </td>
									<td><fmt:formatDate value="${emp.hireDate}" /> </td>
									<td>${emp.mobileTel} </td>
									<td>${emp.comEmail} </td>
								</tr>
							</c:forEach>
						</c:if>
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
					<table class="table table-bordered" id="table-employees">
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
										<img id="dest-image" src="/resources/images/employee/${emp.photo }" class="img-fluid" alt="...">
										<input type="file" class="form-control form-control-sm" name="file1" >	
									</td>	
									<th class="table-secondary text-end">사원번호</th>
									<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="employeeNo" value="${emp.employeeNo }" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'disabled' : '' }/></td>
									<th class="table-secondary text-end">비밀번호</th>
									<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="password" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'disabled' : '' }/></td>	
								</tr>
								<tr>
									<th class="table-secondary text-end">성명</th>
									<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="name" value="${emp.name }" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'disabled' : '' }/></td>
									<th class="table-secondary text-end">생년월일</th>
									<td colspan="2"><input type="date" class="form-control form-control-sm"  style="width: 130px;" name="birthday" value="<fmt:formatDate value="${emp.birthday }" pattern="yyyy-MM-dd" />"/></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">성별</th>
									<td><input class="form-check-input" type="radio" name="gender" value="M"  id="flexRadioDefault1" ${emp.gender eq 'M' ? 'checked' : '' } >
									<label class="form-check-label" for="flexRadioDefault1">남</label>
									<input class="form-check-input" type="radio" name="gender" value="F" id="flexRadioDefault1" ${emp.gender eq 'F' ? 'checked' : '' }>
	  								<label class="form-check-label" for="flexRadioDefault2">여</label>
									</td>	
									
								<tr>
									<th class="table-secondary text-end">메모</th>
									<td colspan="4"><textarea class="form-control" rows="3" name="memo">${emp.memo }</textarea></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">회사전화</th>
									<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="comTel" value="${emp.comTel }" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'disabled' : '' }/></td>
									<th class="table-secondary text-end">자택전화</th>
									<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="homeTel" value="${emp.homeTel }" /></td>
									<th class="table-secondary text-end">핸드폰</th>
									<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" name="mobileTel" value="${emp.mobileTel }" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'disabled' : '' }/></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">회사이메일</th>
									<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;" name="comEmail" value="${emp.comEmail }" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'disabled' : '' }/></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">외부이메일</th>
									<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;" name="extEmail" value="${emp.extEmail }" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'disabled' : '' }/></td>
								</tr>
								
								<tr>
									<th class="table-secondary text-end" rowspan="3">주소</th>
									<td colspan="5">
										<input type="text" class="form-control form-control-sm d-inline-block"  style="width: 130px;" name="zipcode" readonly="readonly" value="${emp.zipcode }" />
										<button type="button" class="btn btn-primary btn-sm" id="btn-search-postcode" >주소찾기</button>
									</td>
								</tr>
								<tr>
									<td colspan="5"><input type="text" class="form-control form-control-sm" name="basicAddress" readonly="readonly" value="${emp.basicAddress }"/></td>
								</tr>
								<tr>
									<td colspan="5"><input type="text" class="form-control form-control-sm" name="detailAddress" value="${emp.detailAddress }" /></td>
								</tr>			
								<tr>
									
									<th class="table-secondary text-end">재직구분</th>
									<td><select style="width: 130px;" name="employeeStatus" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'disabled' : '' } >
											<option ${emp.employeeStatus eq 'N' ? 'selected' : '' } value="N">재직</option>
											<option ${emp.employeeStatus eq 'Y' ? 'selected' : '' } value="Y">휴직</option>
										</select>
									</td>
									<th class="table-secondary text-end">보유권한</th>
									<td colspan="3">
									<input class="form-check-input" type="radio" name="employeeRoleName" id="flexRadioDefault2" value="ROLE_ADMIN" ${emp.employeeRoleName eq 'ROLE_ADMIN' ? 'checked' : '' } >
									<label class="form-check-label" for="flexRadioDefault2">관리자</label>
									<input class="form-check-input" type="radio" name="employeeRoleName" id="flexRadioDefault2" value="ROLE_EMPLOYEE" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'checked' : '' }>
	  								<label class="form-check-label" for="flexRadioDefault2">직원</label></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">부서</th>
									<td>
										<select style="width: 130px;" name="deptNo"/>
											<c:forEach var="dept" items="${departments}">
												<c:choose>
													<c:when test="${emp.employeeRoleName eq 'ROLE_EMPLOYEE' and emp.deptNo ne dept.deptNo }">
														<option value="${dept.deptNo}" disabled> ${dept.deptName}</option>
													</c:when>
													<c:otherwise>
															<option value="${dept.deptNo}"> ${dept.deptName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</td>
									<th class="table-secondary text-end">입사일자</th>
									<td colspan="3"><input type="date" id="start-date" name="hireDate"  style="text-align:center; width:130px" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'readOnly' : ''} value="<fmt:formatDate value="${emp.hireDate }" pattern="yyyy-MM-dd" />"/></td>	
								</tr>
								<tr>
									<th class="table-secondary text-end">직급</th>
									<td>
										<select style="width: 130px;" name="positionNo" />
											<c:forEach var="position" items="${positions}">
												<c:choose>
													<c:when test="${emp.employeeRoleName eq 'ROLE_EMPLOYEE' and emp.positionNo ne position.positionNo }">
														<option value="${position.positionNo}" disabled> ${position.positionName}</option>
													</c:when>
													<c:otherwise>
														<option value="${position.positionNo}"> ${position.positionName}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</td>
									<th class="table-secondary text-end">퇴사일자</th>
									<td colspan="3"><input type="date" id="end-date" name="retirementDate"  style="text-align:center; width:130px" ${emp.employeeRoleName eq 'ROLE_EMPLOYEE' ? 'readOnly' : ''} value="<fmt:formatDate value="${emp.retirementDate }" pattern="yyyy-MM-dd" />"/></td>
								</tr>
								<tr>
									<th class="table-secondary text-end">호봉</th>
									<td>
										<select style="width: 130px;" name="hobong"/>
											<c:forEach var="grade" items="${grade}">
												<c:choose>
													<c:when test="${emp.employeeRoleName eq 'ROLE_EMPLOYEE' and emp.hobong ne grade.hobongGrade }">
														<option value="${grade.hobongGrade }" disabled> ${grade.hobongGrade }</option>
													</c:when>
													<c:otherwise>
														<option value="${grade.hobongGrade }"> ${grade.hobongGrade }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
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
	
	$("#table-emp-list tbody tr").click(function() {
		var empNo = $(this).attr("data-emp-no");
		alert(empNo)
	});
	
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
	        $(":input[name=zipcode]").val(data.zonecode);
	        $(":input[name=basicAddress]").val(address);
				
	        // 상세주소 입력필드에 포커스를 위치시킨다.
	        $(":input[name=detailAddress]").focus();
	      }
	    }).open();
	  });
	})
</script>
</body>
</html>