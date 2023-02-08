<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>사원명부/인사기록카드</title>
<style type="text/css">
	.table-scroll tbody {
    	display:block !important;
    	max-height:300px !important;
    	overflow-y:auto !important;				/* auto <-> scroll */
	}
	.table-scroll thead, .table-scroll tbody tr {
    	display:table !important;
    	width:100% !important;
    	table-layout:fixed !important;
	}	
	
	.table-scroll thead {
		width: 1073px !important;
	}
	.table-scroll {
		width: 1077px !important;
	}
	.modalWrap {
	    width: 80% !important;
    	height: 650px;
    	overflow-y: auto;
    }
</style>
</head>
<body>
<c:set var="menu" value="employee" />
<c:set var="side" value="employeelist" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12 mb-3">
					<h3><p class="fw-bold">사원명부/인사기록카드</p></h3>
				</div>
				<div class="col-12 mb-3">
					<form method="get" action="">
						<div class="border p-3 bg-white">
							<label>검색어</label>
								<select name="sort">
									<option value="name">성명</option>	
									<option value="position">직책</option>
									<option value="dept">부서</option>
								</select>
								<input type="text" name="keyword">
								<button type="submit" class="btn btn-dark float-end">검색</button>
								<input type="checkbox" name="" value="">퇴직자포함
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h6 class="mt-3 mb-3"><strong>사원명부</strong></h6>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<table class="table table-light table-scroll" id="table-employee">
						<colgroup>
							<col width="9%"/>
							<col width="9%"/>
							<col width="9%"/>
							<col width="9%"/>
							<col width="10%"/>
							<col width="12%"/>
							<col width="12%"/>
							<col width="*"/>
						</colgroup>
						<thead>
							<tr class="table-primary text-center">
								<th>사원번호</th>
								<th>성명</th>
								<th>직책</th>
								<th>부서</th>
								<th>입사일자</th>
								<th>헨드폰</th>
								<th>e-mail</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="employee" items="${employees }">
								<tr>
									<td class="text-center">${employee.no }</td>
									<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none">${employee.name }</a></td>
									<td class="text-center">${employee.positionName }</td>
									<td class="text-center">${employee.deptName }</td>
									<td class="text-center">${employee.hire }</td>
									<td class="text-center">${employee.mobileTel }</td>
									<td class="text-center">${employee.companyEmail }</td>
									<td class="text-center">${employee.basicAddress }</td>
								</tr>
								<tr>
									<td class="text-center">${employee.no }</td>
									<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none">${employee.name }</a></td>
									<td class="text-center">${employee.positionName }</td>
									<td class="text-center">${employee.deptName }</td>
									<td class="text-center">${employee.hire }</td>
									<td class="text-center">${employee.mobileTel }</td>
									<td class="text-center">${employee.companyEmail }</td>
									<td class="text-center">${employee.basicAddress }</td>
								</tr>
								<tr>
									<td class="text-center">${employee.no }</td>
									<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none">${employee.name }</a></td>
									<td class="text-center">${employee.positionName }</td>
									<td class="text-center">${employee.deptName }</td>
									<td class="text-center">${employee.hire }</td>
									<td class="text-center">${employee.mobileTel }</td>
									<td class="text-center">${employee.companyEmail }</td>
									<td class="text-center">${employee.basicAddress }</td>
								</tr>
								<tr>
									<td class="text-center">${employee.no }</td>
									<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none">${employee.name }</a></td>
									<td class="text-center">${employee.positionName }</td>
									<td class="text-center">${employee.deptName }</td>
									<td class="text-center">${employee.hire }</td>
									<td class="text-center">${employee.mobileTel }</td>
									<td class="text-center">${employee.companyEmail }</td>
									<td class="text-center">${employee.basicAddress }</td>
								</tr>
								<tr>
									<td class="text-center">${employee.no }</td>
									<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none">${employee.name }</a></td>
									<td class="text-center">${employee.positionName }</td>
									<td class="text-center">${employee.deptName }</td>
									<td class="text-center">${employee.hire }</td>
									<td class="text-center">${employee.mobileTel }</td>
									<td class="text-center">${employee.companyEmail }</td>
									<td class="text-center">${employee.basicAddress }</td>
								</tr>
								<tr>
									<td class="text-center">${employee.no }</td>
									<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none">${employee.name }</a></td>
									<td class="text-center">${employee.positionName }</td>
									<td class="text-center">${employee.deptName }</td>
									<td class="text-center">${employee.hire }</td>
									<td class="text-center">${employee.mobileTel }</td>
									<td class="text-center">${employee.companyEmail }</td>
									<td class="text-center">${employee.basicAddress }</td>
								</tr>
								<tr>
									<td class="text-center">${employee.no }</td>
									<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none">${employee.name }</a></td>
									<td class="text-center">${employee.positionName }</td>
									<td class="text-center">${employee.deptName }</td>
									<td class="text-center">${employee.hire }</td>
									<td class="text-center">${employee.mobileTel }</td>
									<td class="text-center">${employee.companyEmail }</td>
									<td class="text-center">${employee.basicAddress }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	   </div>
	   
	<!-- Modal -->
	<div class="modal" tabindex="-1" id="employeeDetail">
		<div class="container modal-content modalWrap">
			<div class="modal-header">
				<h5 class="modal-title">사용자 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
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
								<td rowspan="5">
									<img id="dest-image" src="/resources/images/employee/default.jpg" class="img-fluid" alt="...">
									<input type="file" class="form-control form-control-sm" name="file1">	
								</td>	
								<th class="table-secondary text-end">사원번호</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
								<th class="table-secondary text-end">비밀번호</th>
								<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>	
							</tr>
							<tr>
								<th class="table-secondary text-end">성명</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
								<th class="table-secondary text-end">영문성명</th>
								<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">성별</th>
								<td><input class="form-check-input" type="radio" name="flexRadioDefault1" id="flexRadioDefault1" checked>
								<label class="form-check-label" for="flexRadioDefault1">남</label>
								<input class="form-check-input" type="radio" name="flexRadioDefault1" id="flexRadioDefault1" >
  								<label class="form-check-label" for="flexRadioDefault2">여</label>
								</td>	
								<th class="table-secondary text-end">앙력 음력</th>
								<td colspan="2"><input class="form-check-input" type="radio" name="flexRadioDefault2" id="flexRadioDefault2" checked>
								<label class="form-check-label" for="flexRadioDefault3">양력</label>
								<input class="form-check-input" type="radio" name="flexRadioDefault2" id="flexRadioDefault2" >
  								<label class="form-check-label" for="flexRadioDefault4">음력</label></td>	
							</tr>
							<tr>
								<th class="table-secondary text-end">결혼유무</th>
								<td><input class="form-check-input" type="radio" name="flexRadioDefault3" id="flexRadioDefault3" checked>
								<label class="form-check-label" for="flexRadioDefault3">기혼</label>
								<input class="form-check-input" type="radio" name="flexRadioDefault3" id="flexRadioDefault3" >
  								<label class="form-check-label" for="flexRadioDefault4">미혼</label></td>	
								<th class="table-secondary text-end">결혼기념일</th>
								<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>	
							</tr>
							<tr>
								<th class="table-secondary text-end">내외국인</th>
								<td><input class="form-check-input" type="radio" name="flexRadioDefault4" id="flexRadioDefault4" checked>
								<label class="form-check-label" for="flexRadioDefault3">내국인</label>
								<input class="form-check-input" type="radio" name="flexRadioDefault4" id="flexRadioDefault4" >
  								<label class="form-check-label" for="flexRadioDefault4">외국인</label></td>	
								<th class="table-secondary text-end">생년월일</th>
								<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>	
							</tr>
							<tr>
								<th class="table-secondary text-end">회사전화</th>
								<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
								<th class="table-secondary text-end">자택전화</th>
								<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
								<th class="table-secondary text-end">핸드폰</th>
								<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">회사이메일</th>
								<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">외부이메일</th>
								<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">급여이메일</th>
								<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end" rowspan="3">주소</th>
								<td colspan="5">
									<input type="text" class="form-control form-control-sm d-inline-block"  style="width: 130px;" name="postcode" readonly="readonly" disabled/>
									<button type="button" class="btn btn-primary btn-sm" id="btn-search-postcode" >주소찾기</button>
								</td>
							</tr>
							<tr>
								<td colspan="5"><input type="text" class="form-control form-control-sm" name="address1" readonly="readonly" disabled /></td>
							</tr>
							<tr>
								<td colspan="5"><input type="text" class="form-control form-control-sm" name="address2"  /></td>
							</tr>
							
							
							<tr>
								<th  class="table-secondary text-end">사업장</th>
								<td><select style="width: 130px;"/>
									<option>사업장1</option>
									<option>사업장2</option>
									<option>사업장3</option>
									<option>사업장4</option>
								</select></td>
								<th class="table-secondary text-end">재직구분</th>
								<td colspan="3"><select style="width: 130px;"/>
									<option>재직</option>
									<option>휴직</option>
								</select></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">부서</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
								<th class="table-secondary text-end">입사일자</th>
								<td colspan="3"><input type="date" id="start-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>	
							</tr>
							<tr>
								<th class="table-secondary text-end">직급</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
								<th class="table-secondary text-end">퇴사일자</th>
								<td colspan="3"><input type="date" id="end-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">직책</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
								<th class="table-secondary text-end">급여계약기준</th>
								<td colspan="3"><select style="width: 130px;"/>
									<option>연봉제</option>
									<option>호봉제</option>
								</select></td>	
							</tr>
							<tr>
								<th class="table-secondary text-end">근태사용</th>
								<td><input type="checkbox"></td>	
								<th class="table-secondary text-end">연차생성기준</th>
								<td colspan="3"><input class="form-check-input" type="radio" name="flexRadioDefault5" id="flexRadioDefault5" checked>
								<label class="form-check-label" for="flexRadioDefault5">입사일</label>
								<input class="form-check-input" type="radio" name="flexRadioDefault5" id="flexRadioDefault5" >
  								<label class="form-check-label" for="flexRadioDefault5">연차기준일</label></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
</div>
	</div>    
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	let modal = new bootstrap.Modal('#employeeDetail');
	
	$("#table-employee a[data-name]").on(function(event) {
		event.preventDefault();
		
		modal.show();
	});
			
	
	
	// 이름이 table-employee인 엘리먼트의 자손 중에서 a엘리먼트이고 data-name 속성을 가지고 있는 것을 선택하고,
	// 선택된 엘리먼트에서 클릭이벤트가 발생할 때 실행될 이벤트 핸들러함수를 등록한다.
	$("#table-employee a[data-name]").click(function(event) {
		event.preventDefault();
		
		let name = $(this).attr('data-name');
		// alert(name);
		
		// 서버로 ajax 요청을 보낸다.
		$.getJSON('/employee/detail.json', )
	});
})

</script>
</body>
</html>