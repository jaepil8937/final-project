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
	.table {
		display: block;
		max-height: 430px; 
		overflow-y: scroll;
		white-space: nowrap;   <%-- 자식 엘리먼트가 한줄로 정렬되게 하는 요소 --%>
	}
	
	table {
		width: 100%;
	}
	
	thead th {
		position: sticky; top:0;
		background-color: lightgray;
	}
	
	tfoot th {
		position: sticky; bottom:0;
		background-color: lightgray;
	}
	
	table th, table td {
		border: 1px solid #c0c0c0; 
		padding: 5px;
		text-align: center;
	}	
	
	#table-calcuration input {
		height: 24px;
	}
	
	#auto-calculate, #btn-save, #btn-delete {
		width:80px;
	}
</style>
<c:set var="menu" value="pay" />
<%@ include file="../common/navbar.jsp" %>
<c:set var="side" value="salary-calculate" />
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
			<form id="form-salary" action="/salary/salarycalculate">
				<div class="row mt-3">
					<div class="col-12">
							<label>귀속연월</label> <input type="month" name="basemonth" value="${param.basemonth }"/> &nbsp; 
							<label>정산기간</label> <input type="date" name="startdate" value="${param.startdate }"/> ~ <input type="date" name="enddate" value="${param.enddate }"/> &nbsp; 
							<label>급여지급일</label> <input type="date" name="paydate" value="${param.paydate }"/> &nbsp; 
							<button type="submit" class="btn btn-danger btn-sm" id="btn-search">검색</button>
					</div>	
					<div class="row mt-4">
						<div class="col-7">
					        <div class="table" border="3" id="table-salaries">
					        	<table>
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
										<c:choose>
											<c:when test="${empty TableDto }">
												<tr>
													<td colspan="6" class="text-center">급여 내역이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="salaryDto" items="${TableDto.salaryDtoLists }">
													<tr>
														<td>${salaryDto.employeeNo }</td>
														<td><a href="" data-employee-no="${salaryDto.employeeNo }" data-salary-calculated="${salaryDto.totalSalary gt 0 ? 'Y' : 'N'}" 
														class="text-decoration-none"> ${salaryDto.name }</a></td>
														<td>${salaryDto.deptName }</td>
														<td><fmt:formatNumber value="${salaryDto.totalSalary }" /></td>
														<td><fmt:formatNumber value="${salaryDto.deductionSalary }" /></td>
														<td><fmt:formatNumber value="${salaryDto.realSalary }" /></td>
													</tr>
												</c:forEach>
											</c:otherwise>	
										</c:choose>	
									</tbody>
									<tfoot>
										<tr>
											<th colspan="3">합&emsp;&emsp;&emsp;계</th>
											<th><fmt:formatNumber value="${TableDto.totalSalary }" /></th>
											<th><fmt:formatNumber value="${TableDto.deductionSalary }" /></th>
											<th><fmt:formatNumber value="${TableDto.realSalary }" /></th>
										</tr>
									</tfoot>	
								</table>	
							</div>
						</div>
					
						<div class="col-5">
							<div class="table" border="3" id="table-calcuration">
							<table>
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
										<td><input type="text" size="6" id="base-salary"/></td>
										<td>소득세</td>
										<td><input type="text" size="6" id="income-tax"/></td>
									</tr>
									<tr>
										<td>식대</td>
										<td><input type="text" size="6" id="meal-salary"/></td>
										<td>주민세</td>
										<td><input type="text" size="6" id="residence-tax"/></td>
									</tr>
									<tr>
										<td>연장수당</td>
										<td><input type="text" size="6" id="overtime-salary"/></td>
										<td>국민연금</td>
										<td><input type="text" size="6" id="national-pension"/></td>
									</tr>
									<tr>
										<td>야간수당</td>
										<td><input type="text" size="6" id="night-salary"/></td>
										<td>건강보험</td>
										<td><input type="text" size="6" id="health-insurance"/></td>
									</tr>
									<tr>
										<td>휴일근무수당</td>
										<td><input type="text" size="6" id="holiday-salary"/></td>
										<td>장기요양보험</td>
										<td><input type="text" size="6" id="longterm-insurance"/></td>
									</tr>
									<tr>
										<td>보육수당</td>
										<td><input type="text" size="6" id="care-salary"/></td>
										<td>고용보험</td>
										<td><input type="text" size="6" id="employment-insurance"/></td>
									</tr>
									<tr>
										<td>출장비</td>
										<td><input type="text" size="6" id="business-salary"/></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>상여금</td>
										<td><input type="text" size="6" id="reward-salary"/></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>지급총액</th>
										<th><input type="text" size="6" id="total-salary"/></th>
										<th>공제총액</th>
										<th><input type="text" size="6" id="deduction-salary"/></th>
									</tr>
								</tbody>	
								<tfoot>
									<tr>
										<th colspan="4"><span>실지급액:</span><span id="real-salary"></span>원</th>
									</tr>
								</tfoot>
							</table>
							</div>
							<button type="button" class="btn btn-warning btn-sm" id="auto-calculate">자동계산</button>
							&emsp;&emsp;&nbsp;
							<button type="button" class="btn btn-primary btn-sm" id="btn-save">저장</button>
							<button type="button" class="btn btn-secondary btn-sm" id="btn-delete">삭제하기</button>
						</div>
					</div>
				</div>	
			</form>
		</div>
	</div>
</div>			
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(function() {	
	$("input[name=basemonth]").change(function() {
		$("input[name=startdate]").val("");
		$("input[name=enddate]").val("");
		$("input[name=paydate]").val("");
		$("#form-salary").trigger("submit");
	})
	
	let selectedEmployeeNo;
	let selectedMonth;
	let selectedTotalSalary;   
	let selectedDeductionSalary;
	let selectedRealSalary;
	let selectedCompleted;
	
	// 급여정보 조회하기
	$("#table-salaries a[data-employee-no]").click(function(event) {
		clearTable();
		event.preventDefault();
		$(this).closest("tr").addClass("table-primary")
    	 	   .siblings().removeClass("table-primary");
		let no = $(this).attr('data-employee-no');              
		let month = $("input[name=basemonth]").val();
		let completed = $(this).attr('data-salary-calculated');    
		let totalSalary = $(this).closest("tr").find("td:eq(3)");      // 선택된 지급총액
		let deductionSalary = $(this).closest("tr").find("td:eq(4)");  // 선택된 공제총액
		let realSalary = $(this).closest("tr").find("td:eq(5)");       // 선택된 실지급액
		
		if (completed == "Y") {
			setSalaryHistory(no, month);
		} else if (completed == "N") {
			setSalaryBasicInfo(no);
		}
		selectedEmployeeNo = no;
		selectedMonth = month;
		selectedTotalSalary = totalSalary;  
		selectedDeductionSalary = deductionSalary;
		selectedRealSalary = realSalary;
		selectedCompleted = completed;
	})
	
	// 사원 급여 정보 가져오기
	function setSalaryHistory(no, month) {
		$.ajax({
			type: 'GET',
			url: '/salary/calculateDetail',
			data: {empNo : no, basemonth : month},
			dataType: 'json',
			success: function(salary) {
				$("input[name=basemonth]").val(salary.baseYearMonth);
				$("input[name=startdate]").val(salary.startDate);
				$("input[name=enddate]").val(salary.endDate);
				$("input[name=paydate]").val(salary.payDate);
				let baseSalary = new Number(salary.baseSalary).toLocaleString();
				$("#base-salary").val(baseSalary);
				let incomeTax = new Number(salary.incomeTax).toLocaleString();
				$("#income-tax").val(incomeTax);
				let mealSalary = new Number(salary.mealSalary).toLocaleString();
				$("#meal-salary").val(mealSalary);
				let residenceTax = new Number(salary.residenceTax).toLocaleString();
				$("#residence-tax").val(residenceTax);
				let overtimeSalary = new Number(salary.overtimeSalary).toLocaleString();
				$("#overtime-salary").val(overtimeSalary);
				let pension = new Number(salary.pension).toLocaleString();
				$("#national-pension").val(pension);
				let nightSalary = new Number(salary.nightSalary).toLocaleString();
				$("#night-salary").val(nightSalary);
				let healthInsurance = new Number(salary.healthInsurance).toLocaleString();
				$("#health-insurance").val(healthInsurance);
				let holidaySalary = new Number(salary.holidaySalary).toLocaleString();
				$("#holiday-salary").val(holidaySalary);
				let longtermInsurance = new Number(salary.longtermInsurance).toLocaleString();
				$("#longterm-insurance").val(longtermInsurance);
				let careSalary = new Number(salary.careSalary).toLocaleString();
				$("#care-salary").val(careSalary);
				let employmentInsurance = new Number(salary.employmentInsurance).toLocaleString();
				$("#employment-insurance").val(employmentInsurance);
				let businessSalary = new Number(salary.businessSalary).toLocaleString();
				$("#business-salary").val(businessSalary);
				let rewardSalary = new Number(salary.rewardSalary).toLocaleString();
				$("#reward-salary").val(rewardSalary);
				let totalSalary = new Number(salary.totalSalary).toLocaleString();
				$("#total-salary").val(totalSalary);
				let deductionSalary = new Number(salary.deductionSalary).toLocaleString();
				$("#deduction-salary").val(deductionSalary);
				let realSalary = new Number(salary.realSalary).toLocaleString();
				$("#real-salary").text(realSalary);
				
			}
		})
	}
	
	// 급여내역 없는 사원의 기본정보 가져오기
	function setSalaryBasicInfo(no) {
		$.ajax({
			type: 'GET',
			url: '/salary/basicInfo',
			data: {empNo : no},
			dataType: 'json',
			success: function(salaryInfo) {
				let baseSalary = new Number(salaryInfo.baseSalary).toLocaleString();
				$("#base-salary").val(baseSalary);
			}
		})
	}
	
	// input태그 값 리셋하기
	function clearTable() {
		$("#base-salary").val(0);
		$("#income-tax").val(0);
		$("#meal-salary").val(0);
		$("#residence-tax").val(0);
		$("#overtime-salary").val(0);
		$("#national-pension").val(0);
		$("#night-salary").val(0);
		$("#health-insurance").val(0);
		$("#holiday-salary").val(0);
		$("#longterm-insurance").val(0);
		$("#care-salary").val(0);
		$("#employment-insurance").val(0);
		$("#business-salary").val(0);
		$("#reward-salary").val(0);
		$("#total-salary").val(0);
		$("#deduction-salary").val(0);
		$("#real-salary").text(0);
	}
	
	// 자동계산
	$("#auto-calculate").click(function() {
		let baseSalary = parseInt($("#base-salary").val().replaceAll(",", ""));
		let mealSalary = parseInt($("#meal-salary").val().replaceAll(",", ""));
		let overtimeSalary = parseInt($("#overtime-salary").val().replaceAll(",", ""));
		let nightSalary = parseInt($("#night-salary").val().replaceAll(",", ""));
		let holidaySalary = parseInt($("#holiday-salary").val().replaceAll(",", ""));
		let careSalary = parseInt($("#care-salary").val().replaceAll(",", ""));
		let businessSalary = parseInt($("#business-salary").val().replaceAll(",", ""));
		let rewardSalary = parseInt($("#reward-salary").val().replaceAll(",", ""));
		let incomeTax = parseInt($("#income-tax").val().replaceAll(",", ""));
		let residenceTax = parseInt($("#residence-tax").val().replaceAll(",", ""));
		let pension = parseInt($("#national-pension").val().replaceAll(",", ""));
		let healthInsurance = parseInt($("#health-insurance").val().replaceAll(",", ""));
		let longtermInsurance = parseInt($("#longterm-insurance").val().replaceAll(",", ""));
		let employmentInsurance = parseInt($("#employment-insurance").val().replaceAll(",", ""));
		$("#total-salary").val((baseSalary + mealSalary + overtimeSalary + nightSalary + holidaySalary + careSalary + businessSalary + rewardSalary).toLocaleString());
		$("#deduction-salary").val((incomeTax + residenceTax + pension + healthInsurance + healthInsurance + employmentInsurance).toLocaleString());
		let totalSalary = baseSalary + mealSalary + overtimeSalary + nightSalary + holidaySalary + careSalary + businessSalary + rewardSalary;
		let deductionSalary = incomeTax + residenceTax + pension + healthInsurance + healthInsurance + employmentInsurance;
		$("#real-salary").text((totalSalary-deductionSalary).toLocaleString());
	})
	
	// 급여정보 저장하기 - 입력된 값 읽기
	$("#btn-save").click(function() {
		
		let baseYearMonth = $("input[name=basemonth]").val();
		let startDate = $("input[name=startdate]").val();
		let endDate = $("input[name=enddate]").val();
		let payDate = $("input[name=paydate]").val();
		if (baseYearMonth=="") {
			alert("귀속연월을 선택하세요.");
			return false;
		}
		if (startDate=="") {
			alert("정산시작기간을 선택하세요.");
			return false;
		}
		if (endDate=="") {
			alert("정산마감기간을 선택하세요.");
			return false;
		}
		if (payDate=="") {
			alert("급여지급일을 선택하세요.");
			return false;
		}
		let salary = {
			employeeNo : selectedEmployeeNo,	
			baseYearMonth : $("input[name=basemonth]").val(),
			startDate : $("input[name=startdate]").val(),
			endDate : $("input[name=enddate]").val(),
			payDate : $("input[name=paydate]").val(),
			baseSalary : $("#base-salary").val().replaceAll(",", ""),
			mealSalary : $("#meal-salary").val().replaceAll(",", ""),
			overtimeSalary : $("#overtime-salary").val().replaceAll(",", ""),
			nightSalary : $("#night-salary").val().replaceAll(",", ""),
			holidaySalary : $("#holiday-salary").val().replaceAll(",", ""),
			careSalary : $("#care-salary").val().replaceAll(",",""),
			businessSalary : $("#business-salary").val().replaceAll(",", ""),
			rewardSalary : $("#reward-salary").val().replaceAll(",", ""),
			incomeTax : $("#income-tax").val().replaceAll(",", ""),
			residenceTax : $("#residence-tax").val().replaceAll(",", ""),
			pension : $("#national-pension").val().replaceAll(",", ""),
			healthInsurance : $("#health-insurance").val().replaceAll(",", ""),
			longtermInsurance : $("#longterm-insurance").val().replaceAll(",", ""),
			employmentInsurance : $("#employment-insurance").val().replaceAll(",", "")
		}
		
		let saveSalary = JSON.stringify(salary);
		
		// 급여정보 저장하기 - 급여내역 있는 사원의 급여 수정하기와 급여내역 없는 사원의 급여 저장하기
		if (selectedCompleted == "Y") {
			updateSalary();
		} else if (selectedCompleted == "N") {
			storeSalary();
		}
		function storeSalary(){
			$.ajax({
				type : 'POST',
				url : '/salary/saveSalary',
				data : saveSalary,
				contentType : 'application/json',
				dataType : 'json',
				success : function(savedSalary) {
					let totalSalary = new Number(savedSalary.totalSalary).toLocaleString();        // 저장버튼 클릭하면 1번째 테이블 지급총액 변경
					selectedTotalSalary.text(totalSalary);           
					let deductionSalary = new Number(savedSalary.deductionSalary).toLocaleString();
					selectedDeductionSalary.text(deductionSalary);
					let realSalary = new Number(savedSalary.realSalary).toLocaleString();
					selectedRealSalary.text(realSalary);
					
					let totalSalary2 = new Number(salary.totalSalary).toLocaleString();            // 저장버튼 클릭하면 2번째 테이블 지급총액 변경
					$("#total-salary").val(totalSalary);
					let deductionSalary2 = new Number(salary.deductionSalary).toLocaleString();
					$("#deduction-salary").val(deductionSalary);
					let realSalary2 = new Number(salary.realSalary).toLocaleString();
					$("#real-salary").text(realSalary);
										
					// 저장과 동시에 합계 출력하기
					generateTotalSalary();
					
					// 저장버튼 클릭 후에 다시 사원을 클릭해도 저장한 급여가 출력되도록 하기.
					$("#table-salaries tbody tr.table-primary a").attr('data-salary-calculated', "Y");   

					alert("저장되었습니다.");
				}
			})
		}	
		function updateSalary(){
			$.ajax({
				type : 'PUT',
				url : '/salary/updateSalary',
				data : saveSalary,
				contentType : 'application/json',
				dataType : 'json',
				success : function(updatedSalary) {
					let totalSalary = new Number(updatedSalary.totalSalary).toLocaleString();        // 저장버튼 클릭하면 1번째 테이블 지급총액 변경
					selectedTotalSalary.text(totalSalary);           
					let deductionSalary = new Number(updatedSalary.deductionSalary).toLocaleString();
					selectedDeductionSalary.text(deductionSalary);
					let realSalary = new Number(updatedSalary.realSalary).toLocaleString();
					selectedRealSalary.text(realSalary);
					
					let totalSalary2 = new Number(salary.totalSalary).toLocaleString();            // 저장버튼 클릭하면 2번째 테이블 지급총액 변경
					$("#total-salary").val(totalSalary);
					let deductionSalary2 = new Number(salary.deductionSalary).toLocaleString();
					$("#deduction-salary").val(deductionSalary);
					let realSalary2 = new Number(salary.realSalary).toLocaleString();
					$("#real-salary").text(realSalary);
					
					generateTotalSalary();
					
					alert("수정되었습니다.");	
				}
			})
		}
	})
	
	// 급여내역 삭제하기
	$("#btn-delete").click(function() {
		let answer = confirm('삭제하시겠습니까?');
		if (answer) {
			$.ajax({
				type: "GET",
				url: "/salary/deleteSalary",
				data: {empNo : selectedEmployeeNo, basemonth : selectedMonth},
				dataType: 'json',
				success: function(response) {
					$("input[name=startdate]").val("");
					$("input[name=enddate]").val("");
					$("input[name=paydate]").val("");
					$("#base-salary").val("");
					$("#income-tax").val("");
					$("#meal-salary").val("");
					$("#residence-tax").val("");
					$("#overtime-salary").val("");
					$("#national-pension").val("");
					$("#night-salary").val("");
					$("#health-insurance").val("");
					$("#holiday-salary").val("");
					$("#longterm-insurance").val("");
					$("#care-salary").val("");
					$("#employment-insurance").val("");
					$("#business-salary").val("");
					$("#reward-salary").val("");
					$("#total-salary").val("");
					$("#deduction-salary").val("");
					$("#real-salary").text("");
					selectedTotalSalary.text("0"); 
					selectedDeductionSalary.text("0");
					selectedRealSalary.text("0");
					
					generateTotalSalary();
				}
			})
		}
	})
	
	// 저장과 동시에 합계 출력하기
	function generateTotalSalary() {
		
		let total1 = 0;              
		$("#table-salaries tbody td:nth-child(4)").each(function(index, td) {
			let text = $(td).text().replaceAll(",",'');
			total1 += parseInt(text);
		})
		$("#table-salaries tfoot th:nth-child(2)").text(total1.toLocaleString());
		
		let total2 = 0;
		$("#table-salaries tbody td:nth-child(5)").each(function(index, td) {
			let text = $(td).text().replaceAll(",",'');
			total2 += parseInt(text);
		})
		$("#table-salaries tfoot th:nth-child(3)").text(total2.toLocaleString());
		
		let total3 = 0;
		$("#table-salaries tbody td:nth-child(6)").each(function(index, td) {
			let text = $(td).text().replaceAll(",",'');
			total3 += parseInt(text);
		})
		$("#table-salaries tfoot th:nth-child(4)").text(total3.toLocaleString());

	}
	
})

</script>
</body>
</html>