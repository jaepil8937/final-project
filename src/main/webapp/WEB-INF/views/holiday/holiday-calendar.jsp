<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>애플리케이션</title>
</head>
<style>
.form-select:disabled {
    background-color: white;
}
.form-control:disabled {
    background-color: white;
}
/* 이전/다음/오늘 버튼 회색 */
.fc-prev-button.fc-button.fc-button-primary {
	background-color: hsl(210deg 17% 98%);
	border-color: hsl(210deg 17% 98%);
	color: black;
}

.fc-next-button.fc-button.fc-button-primary {
	background-color: hsl(210deg 17% 98%);
	border-color: hsl(210deg 17% 98%);
	color: black;
}

.fc-today-button.fc-button.fc-button-primary {
	background-color: hsl(210deg 17% 98%);
	border-color: hsl(210deg 17% 98%);
	color: black;
}

/* 날짜 검은색 */
.fc-day a {
	color: black;
	text-decoration: none;
}
/* 일요일 날짜 빨간색 */
.fc-day-sun a {
	color: red;
	text-decoration: none;
}
/* 토요일 날짜 파란색 */
.fc-day-sat a {
	color: blue;
	text-decoration: none;
}
/* disabled background */
input[class="form-control"]:disabled {
  background: white;
}

select[class="form-select form-select-sm"]:disabled {
  background: white;
} 
.fc-h-event .fc-event-title-container {
    text-align: right;
    font-weight: bold;
}
.fc-event-title-container{
color: white;
background: red;
border-color:white;
} 
</style>
<body>
	<c:set var="menu" value="work" />
	<c:set var="side" value="holiday-calendar" />
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr35">
				<%@ include file="../common/sidebar.jsp"%>
			</div>
			<div class="col-10">
				<div class="row mb-3">
					<div class="col">
						<h2>휴일달력</h2>
					</div>
				</div>
				<hr>
				<div class="row" style="margin-top: 60px;">
					<div class="col-12">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 일정 등록/수정 모달 -->
    <div id="calendarBox">
        <div id="calendar"></div>
    </div>
	<!-- 휴일정보등록 modal 추가 -->
    <div class="modal" id="calendarModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">휴일정보등록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">기준일자</label>
	                       		<input type="date" class="form-control" id="calendarDate" name="calendarDate">
                        <label for="taskId" class="col-form-label">일자구분</label>
	                        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="dateType" name="dateType">
								<option value="무급휴일" selected>무급휴일</option>
								<option value="유급휴일">유급휴일</option>
							</select>
						<label for="taskId" class="col-form-label">휴일구분</label>
	                        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="holidayType" name="holidayType">
								<option value="법정공휴일" selected>법정공휴일</option>
								<option value="대체공휴일">대체공휴일</option>
								<option value="회사공휴일">회사공휴일</option>
							</select>
                        <label for="taskId" class="col-form-label">휴일명</label>
                       	 	<input type="text" class="form-control" id="calendarContent" name="calendarContent">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" id="addCalendar">등록</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
	<!-- 휴일정보 확인 및 수정 modal -->
    <div class="modal" id="calendar-info-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">휴일상세정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">기준일자</label>
                        	<sec:authorize  access="hasRole('ADMIN')"> 
                       			<input type="date" class="form-control" id="calendarDate" name="calendarDate" >
                       		</sec:authorize>
                       		<sec:authorize access="hasRole('EMPLOYEE')">
                       			<input type="date" class="form-control" id="calendarDate" name="calendarDate" disabled="disabled" />
                       		</sec:authorize>
                        <label for="taskId" class="col-form-label">일자구분</label>
	                       <sec:authorize  access="hasRole('ADMIN')">
		                        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="dateType" name="dateType">
									<option value="무급휴일" selected>무급휴일</option>
									<option value="유급휴일">유급휴일</option>
								</select>
							</sec:authorize>
							<sec:authorize  access="hasRole('EMPLOYEE')">
		                        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="dateType" name="dateType" disabled="disabled">
									<option value="무급휴일" selected>무급휴일</option>
									<option value="유급휴일">유급휴일</option>
								</select>
							</sec:authorize>
						<label for="taskId" class="col-form-label">휴일구분</label>
	                        <sec:authorize  access="hasRole('ADMIN')">
		                        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="holidayType" name="holidayType">
									<option value="법정공휴일" selected>법정공휴일</option>
									<option value="대체공휴일">대체공휴일</option>
									<option value="회사공휴일">회사공휴일</option>
								</select>
							</sec:authorize>
							<sec:authorize  access="hasRole('EMPLOYEE')">
		                        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="holidayType" name="holidayType" disabled="disabled">
									<option value="법정공휴일" selected>법정공휴일</option>
									<option value="대체공휴일">대체공휴일</option>
									<option value="회사공휴일">회사공휴일</option>
								</select>
							</sec:authorize>
                        <label for="taskId" class="col-form-label">휴일명</label>
                        	<sec:authorize  access="hasRole('ADMIN')">
                       	 		<input type="text" class="form-control" id="calendarContent" name="calendarContent">
                       	 	</sec:authorize>
                       	 	<sec:authorize  access="hasRole('EMPLOYEE')">
                       	 		<input type="text" class="form-control" id="calendarContent" name="calendarContent" disabled="disabled">
                       	 	</sec:authorize>
                    </div>
                </div>
                <sec:authorize access="hasRole('ADMIN')">
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-danger" id="deleteCalendar">삭제</button>
	                </div>
                </sec:authorize>
            </div>
        </div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
	<script src="https://momentjs.com/downloads/moment.js" type="text/javascript"></script>
	<script type="text/javascript">	
	
		let clickedEvent = null;
		// 휴일 정보 등록 모달 설정
		let calendarModal = new bootstrap.Modal("#calendarModal");
		// 휴일 상세정보 모달 설정
		let calendarInfoModal = new bootstrap.Modal("#calendar-info-modal");
	
		let calendar = new FullCalendar.Calendar(document.getElementById("calendar"), {
              locale: 'ko',
              initialView: 'dayGridMonth',
              events: function(info, successCallback, failureCallback) {
      			refreshEvents(info, successCallback);
      		   }, 
      		eventClick: function(info) {   // 동록된 일정 클릭시 휴일상세정보 모달
      			console.log(info);
           	    clickedEvent = info.event;
           	    
      			let date = info.event.startStr;
      			let name = info.event.title;
      			let dateType = info.event.extendedProps.dateType;
      			let holidayType = info.event.extendedProps.holidayType;
      			
      			$("#calendar-info-modal :input[name=calendarDate]").val(date);
      			$("#calendar-info-modal :input[name=dateType]").val(dateType);
      			$("#calendar-info-modal :input[name=holidayType]").val(holidayType);
      			$("#calendar-info-modal :input[name=calendarContent]").val(name);
  
      			calendarInfoModal.show();
      		},
            <sec:authorize access="hasRole('ADMIN')">  // 휴일등록 모달창 : 관리자만 접근
              dateClick: function(info) {
            	  let clickedDate = info.dateStr;
            	  
            	  $("#calendarDate").val(clickedDate)
            	  $("#calendarModal").modal("show");
            	  
            }, 
            </sec:authorize>
              headerToolbar: {
            	  left : 'prev,next today',
            	  center : 'title'
           		<sec:authorize access="hasRole('ADMIN')">  // 휴일추가 버튼 : 관리지만 접근
           	 	  ,right : 'addEventButton' //s headerToolbar에 버튼을 추가
            	</sec:authorize>
           	 	<sec:authorize access="hasRole('EMPLOYEE')"> // 휴일추가 버튼 : 직원에게 안보이게 변경
           		 ,right : '' 
             	</sec:authorize>
              }
            <sec:authorize access="hasRole('ADMIN')">  
            , customButtons: {
                  addEventButton: { // 추가한 버튼 설정
                      text : "휴일 추가",  // 버튼 내용
                      click : function(){ // 버튼 클릭 시 이벤트 추가
                          $("#calendarModal").modal("show"); // modal 나타내기    
                      }
                  }
              }
            </sec:authorize>
             ,event
          });
          calendar.render();
          
          $("#addCalendar").on("click",function(){  // modal의 일정 등록
              var calendarDate = $("#calendarDate").val();
              var dateType = $("#dateType").val();
              var holidayType = $("#holidayType").val();
              var content = $("#calendarContent").val();
              
              //내용 입력 여부 확인
              if(calendarDate == ""){
                  alert("기준일자를 선택해주세요.");
                  return;
              }
              if(content ==""){
                  alert("휴일명을 입력해주세요.");
                  return;
              }
			
          	var holiday = {
          		baseDate: calendarDate,
          		dateType: dateType,
          		holidayType: holidayType,
          		name: content
          	}
          	
          	addHoliday(holiday);
          	calendarModal.hide();
          });
          
          // 일정 삭제
          $("#deleteCalendar").on("click",function(){
              
              var answer = confirm("삭제하시겠습니까?");
              if (answer) {
            	  deleteHoliday(); 
              }
              calendarInfoModal.hide();
              
          });
          
          function refreshEvents(info, successCallback) {
      		let startDate = moment(info.start).format("YYYY-MM-DD");
      		let endDate = moment(info.end).format("YYYY-MM-DD");
      	
      		let param = {
      			startDate: startDate,
      			endDate: endDate
      		};
      		
      		$.ajax({
      			type: 'get',
      			url: '/holiday/days',
      			data: param,
      			dataType: 'json'
      		})
      		.done(function(events) {
      			successCallback(events);
      		})
      	}
          
         
       // 새 휴일정보를 서버로 보내고, FullCalenader의 달력에 새 일정정보를 추가한다.
      	function addHoliday(holiday) {
      		// ajax로 새 휴일정보를 서버로 보내서 등록시킨다.
      		$.ajax({
      			type: 'post',
      			url: '/holiday/add', 
      			data: holiday,
      			dataType: 'json'
      		})
      		// done(함수)는 ajax 요청이 성공적으로 완료되면 실행되는 함수를 등록한다.
      		.done(function(holidayEvent) {
      			calendar.addEvent(holidayEvent); 
      		})
      		// fail(함수)는 ajax 요청이 실팽하면 실행되는 함수를 등록한다.
      		.fail(function() {
      			 
      		}); 
      	}
       
         // 일정삭제를 서버로 보낸다.
      	function deleteHoliday() {
      		// ajax로 새 휴일정보를 서버로 보내서 등록시킨다.
      		$.ajax({
      			type: 'get',
      			url: '/holiday/delete', 
      			data: {baseDate: $("#calendar-info-modal :input[name=calendarDate]").val()},
      			dataType: 'text'
      		})
      		// done(함수)는 ajax 요청이 성공적으로 완료되면 실행되는 함수를 등록한다.
      		.done(function(holidayEvent) {
					clickedEvent.remove();      			
      		})
      		// fail(함수)는 ajax 요청이 실팽하면 실행되는 함수를 등록한다.
      		.fail(function() {
      			 
      		}); 
      	}  
      
  
	</script>
</body>
</html>