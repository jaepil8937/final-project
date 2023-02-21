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
	<c:set var="menu" value="post" />
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-2 bg-dark mr35">
				<%@ include file="../common/sidebar.jsp"%>
			</div>
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<h1 class="fs-10 p-4">휴일달력</h1>
					</div>
				</div>
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
		let calendar = new FullCalendar.Calendar(document
				.getElementById("calendar"), {
			// 달력의 월, 요일정보가 한글로 표시되도록 한다.
			locale : 'ko',
			// 달력의 초기화면을 월별로 일정이 표시되게 한다.
			initialView : 'dayGridMonth',
			// events 프로퍼티에는 달력이 변경될 때마다 실행되는 함수를 등록한다.
			// info는 화면에 표시되는 달력의 시작일, 종료일을 제공한다.
			// 일정정보를 조회하고, successCallback(이벤트배열)함수의 매개변수로 일정정보를 제공하고 실행하면 화면에 반영된다.
			events : function(info, successCallback, failureCallback) {

			},
			headerToolbar : { // 헤더에 표시할 툴 바
				left : 'prev,next today',
				center : 'title',
				right : ''
			},

			// dateClick 프로퍼티에는 달력의 날짜를 클릭했을 때 실행되는 함수를 등록한다.
			// info는 클릭한 날짜의 날짜정보를 제공한다.
			dateClick : function(info) {

			}
		});
		// Calendar를 렌더링한다.
		calendar.render();
	</script>
</body>
</html>
