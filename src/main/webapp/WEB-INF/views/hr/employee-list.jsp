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
	    width: 100% !important;
    	height: 650px;
    	margin: 0 auto;
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
					<form method="get" action="/hr/info">
						<div class="border p-3 bg-white">
							<label>검색어</label>
								<select name="sort" style="width:60px; text-align:center;">
									<option>선택</option>
									<option value="name" ${param.sort eq 'name' ? 'selected' : '' }>성명</option>	
									<option value="position" ${param.sort eq 'position' ? 'selected' : '' }>직책</option>
									<option value="dept" ${param.sort eq 'dept' ? 'selected' : '' }>부서</option>
								</select>
								<input type="text" name="keyword" value="${param.keyword }" placeholder="검색어를 입력하세요" style="margin-left:20px;">
								<input type="checkbox" name="status" value="Y" style="margin:10px;" ${param.status eq  'Y' ? 'checked' : ''}/>퇴직자포함
								<button type="submit" class="btn btn-dark float-end">검색</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h6 class="mt-3 mb-3">
						<strong>사원명부</strong>
					</h6>
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
								<th>핸드폰</th>
								<th>e-mail</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty employees }">
									<tr>
										<td id="item-nothing" colspan="12" class="text-center">목록이 없습니다.</td>
									</tr>
								</c:when> 
								<c:otherwise>
									<c:forEach var="employee" items="${employees }">
										<tr>
											<td class="text-center">${employee.no }</td>
											<td class="text-center"><a href="" data-name="${employee.name }" class="text-decoration-none" >${employee.name }</a></td>
											<td class="text-center">${employee.positionName }</td>
											<td class="text-center">${employee.deptName }</td>
											<td class="text-center"><fmt:formatDate value="${employee.hire }" pattern="yyyy-MM-dd"/></td>
											<td class="text-center">${employee.mobileTel }</td>
											<td class="text-center">${employee.companyEmail }</td>
											<td class="text-center">${employee.basicAddress }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
	   </div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="employeeDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style ="width: 65vw !important; max-width: 100vw;">
	    <div class="modal-content modalWrap">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">인사상세정보</h1>
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
								<td rowspan="4">
									<img id="dest-image" src="/resources/images/employee/default.jpg" class="img-fluid" alt="...">
									<input type="file" class="form-control form-control-sm" name="file1">	
								</td>	
								<th class="table-secondary text-end">사원번호</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="employeeNo"/></td>
								<th class="table-secondary text-end">비밀번호</th>
								<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="password"/></td>	
							</tr>
							<tr>
								<th class="table-secondary text-end">성명</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="name"/></td>
								<th class="table-secondary text-end">생년월일</th>
								<td colspan="2"><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="birthday"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">성별</th>
								<td><input class="form-check-input" type="radio" name="flexRadioDefault1" path="gender" id="flexRadioDefault1" checked >
								<label class="form-check-label" for="flexRadioDefault1">남</label>
								<input class="form-check-input" type="radio" path="gender" name="flexRadioDefault1" id="flexRadioDefault1" >
  								<label class="form-check-label" for="flexRadioDefault2">여</label>
								</td>	
								
							<tr>
								<th class="table-secondary text-end">메모</th>
								<td colspan="4"><textarea class="form-control" rows="3" name="memo" path="memo"></textarea></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">회사전화</th>
								<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="com_tel"/></td>
								<th class="table-secondary text-end">자택전화</th>
								<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="home_tel"/></td>
								<th class="table-secondary text-end">핸드폰</th>
								<td colspan="1"><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="mobile_tel"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">회사이메일</th>
								<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;" path="com-email"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">외부이메일</th>
								<td colspan="5"><input type="text" class="form-control form-control-sm"  style="width: 600px;" path="ext_email"/></td>
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
								<td colspan="5"><input type="text" class="form-control form-control-sm" name="address2" path="detailAddress"  /></td>
							</tr>
							
							
							<tr>
								
								<th class="table-secondary text-end">재직구분</th>
								<td><select style="width: 130px;" path="employeeStatus"/>
									<option>재직</option>
									<option>휴직</option>
								</select></td>
								<th class="table-secondary text-end">보유권한</th>
								<td colspan="3"><input class="form-check-input" type="radio" name="flexRadioDefault2" id="flexRadioDefault2" checked>
								<label class="form-check-label" for="flexRadioDefault2">관리자</label>
								<input class="form-check-input" type="radio" name="flexRadioDefault2" id="flexRadioDefault2" >
  								<label class="form-check-label" for="flexRadioDefault2">직원</label></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">부서</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="deptNo" /></td>
								<th class="table-secondary text-end">입사일자</th>
								<td colspan="3"><input type="date" id="start-date" name="" value="2023-02-03" style="text-align:center; width:130px" path="hireDate"/></td>	
							</tr>
							<tr>
								<th class="table-secondary text-end">직급</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;"/></td>
								<th class="table-secondary text-end">퇴사일자</th>
								<td colspan="3"><input type="date" id="end-date" name="" value="2023-02-03" style="text-align:center; width:130px"/></td>
							</tr>
							<tr>
								<th class="table-secondary text-end">직책</th>
								<td><input type="text" class="form-control form-control-sm"  style="width: 130px;" path="positionName" /></td>
								<th class="table-secondary text-end">급여계약기준</th>
								<td colspan="3"><select style="width: 130px;"/>
									<option>연봉제</option>
									<option>호봉제</option>
								</select></td>	
							</tr>
							<tr>
								<th  class="table-secondary text-end">호봉</th>
									<td><select style="width: 130px;" path="hobong"/>
										<option>사업장1</option>
										<option>사업장2</option>
										<option>사업장3</option>
										<option>사업장4</option>
									</select></td>	
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
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>	
</div>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("select[name=sort]").on('change',function() {
	       let sortValue = $(this).children("option:selected").text();
	       if(sortValue == "선택") {
	      	 $("input[name=keyword]").attr("placeholder", "검색어를 선택하세요");
	       }
	       $("input[name=keyword]").attr("placeholder", sortValue + "을(를) 입력하세요");
	    });

	let modal = new bootstrap.Modal('#employeeDetail');
	
	$("#table-employee tbody").on('click', 'a', function(event) {
		event.preventDefault();
		
		let name = $(this).attr('data-name');
		console.log(name);
		modal.show();
	})
})
</script>
</body>
</html>