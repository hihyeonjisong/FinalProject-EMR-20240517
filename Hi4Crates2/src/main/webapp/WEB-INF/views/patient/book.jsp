<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal"
	data-nav-style="menu-click" data-menu-position="fixed"
	data-theme-mode="light">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Image Slider</title>
<style>
#imageContainer {
	position: relative;
}

#imageContainer img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	opacity: 1; /* 초기 투명도 설정 */
	/* transition: opacity 0.75s ease-in-out, transform 0.75s ease-in-out; 페이드 및 줌 트랜지션 설정 */
	transition: transform 10s linear !important;
	transform: scale(1.2) rotate(.001deg);
}
.fc .fc-toolbar-title {
    font-size: 1.75em;
    margin-left: 77px;
}

/* 	            .container-xl { */
/* 	  overflow-x: hidden; /* 가로 스크롤을 숨김 */
* /
	/* 	} */ 
/* } */
<style>
        #my-custom-card {
            /* height: 1000px; 원하는 높이 값으로 조정 */
            width:  100%;
            margin: 0 auto;
        }
.custom-select {
  display: inline-block;
  width: 66%;
  height: calc(2.25rem + 2px);
  padding: .375rem .75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  vertical-align: middle;
  background: #fff url("data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' width='4' height='5'><polygon points='2,0 0,4 4,4'/></svg>") no-repeat right .75rem center;
  background-size: 8px 10px;
  border: 1px solid #ced4da;
  border-radius: .25rem;
  appearance: none;
  transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

.custom-select:focus {
  border-color: #80bdff;
  outline: 0;
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}
/* 입력 필드 스타일링 */
.form-control1 {
  display: block;
  width: 50%;
  height: calc(2.25rem + 2px);
  padding: .375rem .75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: .25rem;
  transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

/* 입력 필드가 포커스를 받을 때 스타일링 */
.form-control1:focus {
  border-color: #80bdff;
  outline: 0;
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}
</style>

<!-- Meta Data -->
<meta charset="UTF-8">
<meta name='viewport'
	content='width=device-width, initial-scale=1.0, user-scalable=0'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>YNEX - Bootstrap 5 Premium Admin & Dashboard Template</title>
<meta name="Description"
	content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
<meta name="Author" content="Spruko Technologies Private Limited">

<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/assets/images/brand-logos/favicon.ico"
	type="image/x-icon">

<!-- Bootstrap Css -->
<link id="style"
	href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Style Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/styles.css"
	rel="stylesheet">

<!-- Icons Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/icons.css"
	rel="stylesheet">

<!-- Node Waves Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.css"
	rel="stylesheet">

<!-- SwiperJS Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.css">

<!-- Color Picker Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/flatpickr/flatpickr.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/themes/nano.min.css">

<!-- Choices Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/styles/choices.min.css">

<!-- Full Calendar CSS -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/fullcalendCar/main.min.css"> --%>

<script>
        if(localStorage.ynexlandingdarktheme){
            document.querySelector("html").setAttribute("data-theme-mode","dark")
        }
        if(localStorage.ynexlandingrtl){
            document.querySelector("html").setAttribute("dir","rtl")
            document.querySelector("#style").setAttribute("href", "${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.rtl.min.css");
        }
    </script>


</head>

<body class="landing-body">
	<!-- 모달 -->
	<div class="modal fade" id="exampleModalLg" tabindex="-1"
		aria-labelledby="exampleModalLgLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLgLabel"
						style="text-align: center;">회원가입</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container mt-5">
						<div class="row justify-content-center">
							<div class="col-md-4 text-center mb-4">
								<a href="/signup"> <img
									src="${pageContext.request.contextPath }/resources/assets/img/doctor.png"
									class="img-fluid mb-3" style="max-width: 200px;" alt="의료진">
								</a>
								<p class="mb-0">의료진</p>
							</div>
							<div class="col-2"></div>
							<div class="col-md-4 text-center mb-4">
								<a href="/patient/signup.do"> <img
									src="${pageContext.request.contextPath }/resources/assets/img/patient.png"
									class="img-fluid mb-3" style="max-width: 200px;" alt="환자">
								</a>
								<p class="mb-0">환자</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 페이지 -->
	<div class="landing-page-wrapper">
		<header class="app-header"> </header>
		
		<!-- 헤더 -->
		
		<%@ include file="patientHeader.jsp"%>
		
		
		<!-- 메인 -->
			<!-- Start::app-content -->
        <div class="main-content app-content" style="margin-top:100px;">
            <div class="container-fluid">
                <!-- Page Header -->
                <!-- <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                    <h1 class="page-title fw-semibold fs-18 mb-0">진료예약</h1>
                    <div class="ms-md-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">Apps</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Full Calendar</li>
                            </ol>
                        </nav>
                    </div>
                </div> -->
                <div class="row">
                    <div class="col-xl-1"></div>
                    <div class="col-xl-5">
                        <div class="d-flex justify-content-center align-items-center my-4 page-header-breadcrumb">
                            <div class="page-title fw-semibold fs-30 mb-0"></div>
                            </div>
                            <div class="card-body">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5">
                        <div class="card custom-card">
                            <div class="card-body p-0">
                               
                            </div>
                        </div>
                        <div class="col-xl-1">

                        </div>
                    </div>
                </div>
                <!-- Page Header Close -->

                <!-- Start::row-1 -->
                <div class="row">
                    <div class="col-xl-1">
                    </div>
                    <div class="col-xl-6">
                        <div class="card custom-card">
                            <div class="card-header">
                                <div class="card-title" style="font-size: 25px;">날짜선택</div>
                            </div>
                            <div class="card-body">
                                <div id='calendar'></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4" style=" padding-top: 50px;">
                        <div class="card custom-card">
                            <div class="card-body p-0">
                                <div id="external-events" class="border-bottom p-3">
                                <form action="/book/do" method="post">
                                <input type="hidden" value="${sessionScope.user.member.memNo }" name="memNo">
								<ul>
									<li>
										<h3>선택일</h3> <input type="text" id="selectedDate"
										name="reservDate" class="form-control1"
										placeholder="날짜를 클릭하세요" readonly>
									</li>
									<hr style="border-top: 3px solid #87CEEB;">
									<!-- 여기에 수정된 수평선 추가 -->
									<li>
										<h3>전문의</h3> <select name="empNo" id="doctorOptions"
										class="custom-select">
											<option value="">원하는 전문의를 선택하세요.</option>
									</select>
									</li>
									<hr style="border-top: 3px solid #87CEEB;">
									<!-- 여기에 수정된 수평선 추가 -->
									<li>
									<h3>예약시간</h3>
									<select name="reservTime" id="reservation_time"
										class="custom-select">
										<option value="">원하는 진료시간을 선택하세요.</option>
										<!-- 9:00부터 12:00까지 -->
										<optgroup label="오전">
											<option value="09:00">9:00</option>
											<option value="09:30">9:30</option>
											<option value="10:00">10:00</option>
											<option value="10:30">10:30</option>
											<option value="11:00">11:00</option>
											<option value="11:30">11:30</option>
											<option value="12:00">12:00</option>
										</optgroup>
										<!-- 13:00부터 18:00까지 -->
										<optgroup label="오후">
											<option value="13:00">13:00</option>
											<option value="13:30">13:30</option>
											<option value="14:00">14:00</option>
											<option value="14:30">14:30</option>
											<option value="15:00">15:00</option>
											<option value="15:30">15:30</option>
											<option value="16:00">16:00</option>
											<option value="16:30">16:30</option>
											<option value="17:00">17:00</option>
											<option value="17:30">17:30</option>
										</optgroup>
									</select>
									</li>
									<button type="submit" id="reservBtn" class="btn btn-outline-info btn-wave"
									style="padding: 10px; margin-top: 15px; display: none;">예약하기</button>
								</ul>
								</form>
							</div>
                            </div>
                        </div>
                    </div>
                        <div class="col-xl-1">
						</div>
               		</div>
                </div>
                <!--End::row-1 -->
			</div>
		
        <!-- End::app-content -->
	

    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModal" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-body">
                  <div class="input-group">
                    <a href="javascript:void(0);" class="input-group-text" id="Search-Grid"><i class="fe fe-search header-link-icon fs-18"></i></a>
                    <input type="search" class="form-control border-0 px-2" placeholder="Search" aria-label="Username">
                    <a href="javascript:void(0);" class="input-group-text" id="voice-search"><i class="fe fe-mic header-link-icon"></i></a>
                    <a href="javascript:void(0);" class="btn btn-light btn-icon" data-bs-toggle="dropdown" aria-expanded="false">
                      <i class="fe fe-more-vertical"></i>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
                      <li><a class="dropdown-item" href="javascript:void(0);">Another action</a></li>
                      <li><a class="dropdown-item" href="javascript:void(0);">Something else here</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="javascript:void(0);">Separated link</a></li>
                    </ul>
                  </div>
                  <div class="mt-4">
                    <p class="font-weight-semibold text-muted mb-2">Are You Looking For...</p>
                    <span class="search-tags alert"><i class="fe fe-user me-2"></i>People<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                    <span class="search-tags alert"><i class="fe fe-file-text me-2"></i>Pages<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                    <span class="search-tags alert"><i class="fe fe-align-left me-2"></i>Articles<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                    <span class="search-tags alert"><i class="fe fe-server me-2"></i>Tags<a href="javascript:void(0)" class="tag-addon" data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
                  </div>
                  <div class="my-4">
                    <p class="font-weight-semibold text-muted mb-2">Recent Search :</p>
                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
                      <a href="notifications.html"><span>Notifications</span></a>
                      <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                    </div>
                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
                      <a href="alerts.html"><span>Alerts</span></a>
                      <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                    </div>
                    <div class="p-2 border br-5 d-flex align-items-center text-muted mb-0 alert">
                      <a href="mail.html"><span>Mail</span></a>
                      <a class="ms-auto lh-1" href="javascript:void(0);" data-bs-dismiss="alert" aria-label="Close"><i class="fe fe-x text-muted"></i></a>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <div class="btn-group ms-auto">
                    <button type="button" class="btn btn-sm btn-primary-light">Search</button>
                    <button type="button" class="btn btn-sm btn-primary">Clear Recents</button>
                  </div>
                </div>
              </div>
            </div>
        </div>
	
	<!-- Popper JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>

	<!-- Bootstrap JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Color Picker JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>

	<!-- Choices JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

	<!-- Swiper JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.js"></script>

	<!-- Defaultmenu JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/defaultmenu.min.js"></script>

	<!-- Internal Landing JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/landing.js"></script>

	<!-- Node Waves JS-->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>

	<!-- Sticky JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/sticky.js"></script>
		
	<!-- FullCalendar CSS -->
<!-- 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css"> -->

	<!-- FullCalenar Javascript -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script> -->

	<!-- FullCalendar Moment.js -->
	<script src="${pageContext.request.contextPath }/resources/fullcalendar/index.global.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

	<!-- FullCalendar Locale -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script> -->

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</body>
<script>
var memNo = ${sessionScope.user.member.memNo};
	let calendarEl = document.getElementById('calendar');  // FullCalendar를 띄울 div element가져오기
	let am = $("#am");
	let pm = $("#pm");
	let formattedDate = "";
	
	function loadCalendar() {
		var today = new Date(); // 오늘 날짜 가져오기
		
		   calendar = new FullCalendar.Calendar(calendarEl, {
		    initialView: "dayGridMonth", // FullCalendar가 처음 로드되었을때 뷰 설정
		    headerToolbar: {
		      // 헤드툴바 설정
		      left: "",
		      center: "title",
		      right: "prev,next"
		    },
		    expandRows: true,
		    selectable: false, // 달력 일자 드래그 설정가능 false로 바꿈
		    droppable: false, // 드롭 가능 여부 설정
		    editable: false, // 수정 가능 여부 설정 false로 바꿈
		    nowIndicator: true, // 현재 시간 마크
		    // navLinks: true, // 링크 활성화 여부 설정
		    eventResize: function (info) {
		      // 리사이즈 이벤트(리사이즈 시 이벤트 내용 수정)

		      // 리사이즈 후의 이벤트 정보
		      let event = info.event._def;
		      let instance = info.event._instance;
		      let id = event.publicId;
		      let title = event.title;
		      let allDay = event.allDay;
		      let start = instance.range.start.toISOString().split(".")[0];
		      let end = instance.range.end.toISOString().split(".")[0];

		      let data = {
		        id: id,
		        title: title,
		        start: start,
		        end: end,
		        allDay: allDay,
		      };

		        },
		        // 이벤트가 드롭되었을 떄 이벤트
		        eventDrop: function (info) {
		          // 이벤트가 드롭되었을 때의 정보
		          let event = info.event._def;
		          let instance = info.event._instance;
		          let id = event.publicId;
		          let title = event.title;
		          let allDay = event.allDay;
		          let start = instance.range.start;
		          let end = instance.range.end;

		          let data = {
		            id: id,
		            title: title,
		            start: start.toISOString().split(".")[0],
		            end: end.toISOString().split(".")[0],
		            allDay: allDay,
		          };
		        },
		        // 달력 칸을 선택했을 경우(이벤트 선택 x)
		        select: function (info) {
		          inputs.val(""); // input 초기화
		          let endDateVal = info.endStr; // 해당 날짜의 정보를 input에 입력
		          startDate.val(info.startStr);
		          endDate.val(endDateVal);
		        },
		        
		     // 달력의 날짜를 클릭할 때마다 호출되는 콜백
		        dateClick: function(info) {
		        	// 클릭한 날짜 가져오기
		            let clickedDate = info.date;

		            // 클릭한 날짜가 오늘 이후인지 확인
		            if (clickedDate > today || clickedDate.toDateString() === today.toDateString()) {
		                // 연도, 월, 일 추출
		                let year = clickedDate.getFullYear();
		                // 월은 0부터 시작하므로 +1 해줘야 함
		                let month = clickedDate.getMonth() + 1;
		                let day = clickedDate.getDate();

		                // 포맷팅된 날짜 문자열 생성
		                formattedDate = year + "-" + month.toString().padStart(2, "0") + "-" + day.toString().padStart(2, "0");

		                console.log("Clicked Date:", formattedDate);

		                // 클릭한 날짜를 입력 필드에 출력
		                $('#selectedDate').val(formattedDate);
		            } else {
		                // 클릭한 날짜가 오늘 이전인 경우
		                // 여기에 추가 작업을 수행할 수 있습니다.
		                // 예를 들어, 메시지를 출력하거나 특정 동작을 수행할 수 있습니다.
		                console.log("오늘 이전의 날짜는 선택할 수 없습니다.");
		                alert("오늘 이전의 날짜는 선택할 수 없습니다.");
		            }
					
		            $.ajax({
		                url: '/book/click',
		                type: 'POST',
		                contentType: 'application/json',
		                data: JSON.stringify({ calendarStartDate: formattedDate }),
// 		                beforeSend: function(xhr) {
// 	                        // CSRF 토큰 헤더에 추가
// 	                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
// 	            		},
		                success: function(response) {
		                    // 요청이 성공적으로 처리될 경우 호출되는 콜백
		                    console.log(response);
		                    console.log("POST request successful");
		                    
		                    // 받은 데이터를 기반으로 옵션 추가
		                    var doctorOptions = response; // 받은 전문의 목록
		                    
		                    // 옵션을 추가할 select 요소를 선택
		                    var selectElement = $('#doctorOptions');
		                    
		                    // 기존의 옵션 제거
		                    selectElement.empty();
		                    // 새로운 옵션 추가
		                    selectElement.append('<option value="">원하는 전문의를 선택하세요.</option>');
		                    doctorOptions.forEach(function(doctorName) {
// 		                        selectElement.append('<option value="' + doctorName.empNo + '">' + doctorName.memName + '('+doctorName.codeName+')</option>');
		                        selectElement.append('<option value="'+doctorName.empNo+'">'+doctorName.memName+'('+doctorName.empDepartment+" "+doctorName.codeName+')</option>');
		                    });
		                    
		                },
		                error: function(xhr, status, error) {
		                    // 오류 처리
		                    console.error("POST request failed");
		                }
		            });
		        },
		        locale: "ko", // 한국어 설정
		      });
		      // calendar 띄우기
		      calendar.render();
		}
	
		// 환자 번호도 넘겨줘야함(수정해야함)
		$(document).on('change', '#doctorOptions', function() {
			let empNo = $(this).val();
		    console.log('Selected option:', empNo);
		    
		    let data = {
		    	empNo : empNo,
		    	reservDate : formattedDate
		    }
		    console.log(data);
		    
		    $.ajax({
		    	url: '/book/time',
		    	type: 'POST',
		    	contentType: 'application/json',
		    	data: JSON.stringify(data),
// 		    	beforeSend: function(xhr) {
//                     // CSRF 토큰 헤더에 추가
//                    xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
//         		},
		    	success: function(response){
		    		// 이미 있는 시간
		            $.each(response, function(index, item) {
		                var reservTime = item.reservTime;
		                // 각 옵션 값과 reservedTimes 배열에 있는 값 비교하여 중복되는 값은 비활성화하고 배경색을 회색으로 처리
		                $("#reservation_time option").each(function() {
		                    if ($(this).val() === reservTime) {
		                        $(this).prop("disabled", true).css("background-color", "#cccccc");
		                    }
		                });
		            });
		        }
		    })
		});

		$(document).ready(function() {
		    // 예약하기 버튼
		    var reservBtn = $('#reservBtn');

		    // 예약하기 버튼을 기본으로 숨깁니다.
// 		    reservBtn.hide();

		    // 모든 필드에 값이 입력되었는지 확인하는 함수
		    function checkInputs() {
		        var selectedDate = $('#selectedDate').val();
		        var doctorOptions = $('#doctorOptions').val();
		        var reservationTime = $('#reservation_time').val();

		        // 모든 필드에 값이 있으면 버튼을 보여줍니다.
		        if (selectedDate && doctorOptions && reservationTime) {
		            reservBtn.show();
		        } else {
		            reservBtn.hide();
		        }
		    }

		    // 입력 폼의 변경 이벤트를 감지하여 값이 변경될 때마다 확인
		    $('#selectedDate, #doctorOptions, #reservation_time').change(function() {
		        checkInputs();
		    });

		    // 페이지 로드시 한 번 확인
		    checkInputs();
		});		
		$(document).ready(function() {
		    // 예약하기 버튼 클릭 시
		    $('#reservBtn').click(function() {
		        // 예약 확인 알럿 창 표시
		        var confirmReservation = confirm('예약하시겠습니까?');

		        // 확인 버튼을 눌렀을 때
		        if (confirmReservation) {
		            // 폼 제출
		            $('#reservationForm').submit();
		        }
		    });
		});
			
	loadCalendar();
	
</script>
</html>