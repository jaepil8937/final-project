<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>인사발령등록</title>
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
</style>
</head>
<body>
<c:set var="menu" value="employee" />
<c:set var="side" value="" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-2 bg-dark mr-3">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10">
			<div class="row">
				<div class="col-12 mb-3">
					<h3><p class="fw-bold">인사발령등록</p></h3>
				</div>	
				<div class="col-12 mb-3">
					<form method="get" action="">
						<div class="border p-3 bg-white">
							<label>발령구분</label>
							<select name="sort">
								<option>선택</option>
								<option value="join" ${param.sort eq 'join' ? 'selected' : '' }>입사</option>
								<option value="promotion" ${param.sort eq 'promotion' ? 'selected' : '' }>승진</option>
								<option value="transfer" ${param.sort eq 'transfer' ? 'selected' : '' }>전보</option>
								<option value="leave" ${param.sort eq 'leave' ? 'selected' : '' }>휴직</option>
								<option value="retirement" ${param.sort eq 'retirement' ? 'selected' : '' }>퇴직</option>
							</select>
							<label>발령일자</label>
							<input type="date" name="startDate" value="${param.startDate }">~<input type="date" name="endDate" value="${param.endDate }">
							<button type="submit" class="btn btn-dark float-end">검색</button>
						</div>
					</form>
				</div>
				<div class="row">
					<div class="col-12 d-flex justify-content-between align-items-center mb-3">
						<h6>
							<strong>인사발령조회</strong>
						</h6>
						<div class="float-end">
							<form>
								<button type="submit" class="btn btn-dark float-end">발령취소</button>
							</form>
						</div>	
					</div>
					<div class="row">	
						<div class="col-12">
							<table class="table table-light table-scroll">
								<colgroup>
									<col width="5%"/>
									<col width="6%"/>
									<col width="12%"/>
									<col width="12%"/>
									<col width="12%"/>
									<col width="9%"/>
									<col width="12%"/>
									<col width="*"/>
								</colgroup>
								<thead>
									<tr class="table-primary text-center">
										<th></th>
										<th>No</th>
										<th>발령구분</th>
										<th>발령일자</th>
										<th>사원번호</th>
										<th>성명</th>
										<th>발령내용</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty personnels }">
											<tr>
												<td id="item-nothing" colspan="12" class="text-center">목록이 없습니다.</td>
											</tr>
										</c:when> 
										<c:otherwise>
											<c:forEach var="personnel" items="${personnels }">
												<tr class="text-center">
													<td><input type="checkbox" /></td>
													<td>1</td>
													<td>${personnel.type }</td>
													<td><fmt:formatDate value="${personnel.appointmentDate }" pattern="yyyy-MM-dd"/></td>
													<td>${personnel.no }</td>
													<td>${personnel.name }</td>
													<td>${personnel.content }</td>
													<td>${personnel.note }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-end">
						<form>
							<a href="personnel-register" class="btn btn-dark float-end">발령등록</a>
						</form>
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