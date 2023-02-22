<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>애플리케이션</title>
</head>
<style>
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
				<div class="row" style="margin-top: 24px;">
					<div class="shadow-none p-3 mb-5 bg-light rounded">
						<div class="container text-center">
							<form id="" method="post" action="" enctype="">
								<div class="row">
									<div class="col-3">
										<label for="start" style="padding-top: 12px;">근무년월: <input
											type="date" id="" name="" value="" min="2023-01-01"
											max="2023-12-31">
										</label>
									</div>
									<div class="col">
										<p style="padding-top: 7px;">
											<button class="btn btn-danger" style="float: right;">조회</button>
										</p>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 60px;">
					<div class="col-12">
						<div id="calendar"></div>
					</div>
				</div>
				<div class="row"></div>
			</div>
		</div>
	</div>
	<!-- 일정 등록/수정 모달 -->
    <div id="calendarBox">
        <div id="calendar"></div>
    </div>
	<!-- modal 추가 -->
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
                       		<input type="date" class="form-control" id="calendar_date" name="calendar_date">
                        <label for="taskId" class="col-form-label">일자구분</label>
	                        <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="">
								<option selected>무급휴일</option>
								<option value="1">유급휴일</option>
							</select>
						<label for="taskId" class="col-form-label">휴일구분</label>
	                        <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="">
								<option selected>법정공휴일</option>
								<option value="1">대체공휴일</option>
								<option value="2">회사공휴일</option>
							</select>
                        <label for="taskId" class="col-form-label">휴일명</label>
                       	 	<input type="text" class="form-control" id="calendar_content" name="calendar_content">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
            </div>
        </div>
    </div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script
		src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
	<script src="https://momentjs.com/downloads/moment.js"
		type="text/javascript"></script>
	<script type="text/javascript">
	  document.addEventListener('DOMContentLoaded', function () {
          var calendarEl = document.getElementById('calendar');
          var calendar = new FullCalendar.Calendar(calendarEl, {
              locale: 'ko',
              initialView: 'dayGridMonth',
              dateClick: function(info) {
            	  $("#calendarModal").modal("show");
            	  }, 
              headerToolbar: {
            	  left : 'prev,next today',
            	  center : 'title',
            	  right : 'addEventButton' //s headerToolbar에 버튼을 추가
              }, customButtons: {
                  addEventButton: { // 추가한 버튼 설정
                      text : "휴일 추가",  // 버튼 내용
                      click : function(){ // 버튼 클릭 시 이벤트 추가
                          $("#calendarModal").modal("show"); // modal 나타내기

                          $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                              var calendar_date = $("#calendar_date").val();
                              var content = $("#calendar_content").val();
                              
                              //내용 입력 여부 확인
                              if(calendar_date == null || calendar_date == ""){
                                  alert("기준일자를 선택해주세요.");
                              }else if(content == "" || content ==""){
                                  alert("휴일명을 입력해주세요.");
                              }else{ // 정상적인 입력 시
                                  var obj = {
                                   
                                  }//전송할 객체 생성

                                  console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                              }
                          });
                      }
                  }
              },
              editable: true, // false로 변경 시 draggable 작동 x 
              displayEventTime: false // 시간 표시 x
          });
          calendar.render();
      });
	</script>
</body>
</html>
