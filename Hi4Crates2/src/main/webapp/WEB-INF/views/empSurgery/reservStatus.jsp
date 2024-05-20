<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


    <div class="page">
        
        <!-- 본문 시작 -->
        <!-- Start::app-content -->
        <div class="main-content app-content">
            <div class="container-fluid">

<!--                 페이지 헤더 -->
<!--                 Page Header -->
<!--                 <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb"> -->
<!--                     <h1 class="page-title fw-semibold fs-18 mb-0">수술실 예약 현황</h1> -->
<!--                     <div class="ms-md-1 ms-0"> -->
<!--                         <nav> -->
<!--                             <ol class="breadcrumb mb-0"> -->
<!--                                 <li class="breadcrumb-item"><a href="javascript:void(0);">Pages</a></li> -->
<!--                                 <li class="breadcrumb-item active" aria-current="page">OperatingRoomReservations</li> -->
<!--                             </ol> -->
<!--                         </nav> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 Page Header Close -->
<!--                 페이지 헤더 끝 -->

                <!-- 본문의 본문 -->
                <!-- Start::row-1 -->
                <div class="row">
                    
                    
                    <!-- 서브메뉴 -->
                    <div class="col-xl-3">
                            <div class="card custom-card">
                                <div class="card-body p-0">
                                    
                                    
                                    

                                    
                                    <div class="p-3 task-navigation border-bottom border-block-end-dashed">
                                        <ul class="list-unstyled task-main-nav mb-0">
                                            <li class="px-0 pt-0">
                                                <span class="fs-11 text-muted op-7 fw-semibold">TASKS</span>
                                            </li>
                                            <li>
                                                <a href="/emp/surgery/reservList">
                                                    <div class="d-flex align-items-center">
                                                        <span class="me-2 lh-1">
                                                            <i class="ri-task-line align-middle fs-14"></i>
                                                        </span>
                                                        <span class="flex-fill text-nowrap">
															수술 예정 환자
                                                        </span>
                                                        <span class="badge bg-success-transparent rounded-pill">뱃지</span>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="/emp/surgery/reservForm">
                                                    <div class="d-flex align-items-center">
                                                        <span class="me-2 lh-1">
                                                            <i class="ri-star-line align-middle fs-14"></i>
                                                        </span>
                                                        <span class="flex-fill text-nowrap">
															수술 일정 등록
                                                        </span>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="/emp/surgery/surgeryRoom">
                                                    <div class="d-flex align-items-center">
                                                        <span class="me-2 lh-1">
                                                            <i class="ri-delete-bin-5-line align-middle fs-14"></i>
                                                        </span>
                                                        <span class="flex-fill text-nowrap">
                                                            수술실 예약 현황
                                                        </span>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="/emp/surgery/surgeryRecord">
                                                    <div class="d-flex align-items-center">
                                                        <span class="me-2 lh-1">
                                                            <i class="ri-delete-bin-5-line align-middle fs-14"></i>
                                                        </span>
                                                        <span class="flex-fill text-nowrap">
                                                            수술 기록 조회
                                                        </span>
                                                    </div>
                                                </a>
                                            </li>
                                           
                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                    <!-- 서브메뉴 끝 -->
                    
<div class="col-xl-9">
            <div class="row">
                <div class="col-xl-12">
					<!-- 카드 -->
					<div class="card custom-card">
					    <div class="card-header">
					        <div class="card-title">
					            Surgery Reservation Status
					        </div>
					    </div>
					    
					    <div class="card-body">
                    
                    <div id="calendar"></div>
                    (fullcalendar구역)
                    
                    	</div>
                    	</div>
                    	</div>
                    	</div>
                    	</div>
                    
                    
                </div>
                <!--End::row-1 -->
                <!-- 본문의 본문 끝 -->

            </div>
        </div>
        <!-- End::app-content -->
        <!--본문 끝-->
    
    </div>

    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

</body>
<script>
                    
   let calendarEl = document.getElementById('calendar');  // FullCalendar를 띄울 div element가져오기 

   function loadCalendar() {
   	  $.ajax({
   	    url: "/loadData",
   	    type: "post",
   	    success: function (res) {
   	      calendar = new FullCalendar.Calendar(calendarEl, {
   	        events: res, // event(Controller에서 JSONArray로 전달한 값을 대입)
   	        initialView: "dayGridMonth", // FullCalendar가 처음 로드되었을때 뷰 설정
   	        headerToolbar: {
   	          // 헤드툴바 설정
   	          center: "title",
   	          left: "dayGridMonth,timeGridWeek,timeGridDay",
   	        },
   	        expandRows: true,
   	        selectable: true, // 달력 일자 드래그 설정가능
   	        droppable: true, // 드롭 가능 여부 설정
   	        editable: true, // 수정 가능 여부 설정
   	        nowIndicator: true, // 현재 시간 마크
   	        navLinks: true, // 링크 활성화 여부 설정
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

   	          // 이벤트 수정 함수
   	          update(data);
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
   	          update(data); // 이벤트 수정 함수
   	        },
   	        // 달력 칸을 선택했을 경우(이벤트 선택 x)
   	        select: function (info) {
   	          inputs.val(""); // input 초기화
   	          let endDateVal = info.endStr; // 해당 날짜의 정보를 input에 입력
   	          startDate.val(info.startStr);
   	          endDate.val(endDateVal);
   	        },
   	        // 이벤트를 클릭했을 때의 이벤트
   	        eventClick: function (info) {
   	          inputs.val(""); // input 초기화

   	          // 클릭한 이벤트의 정보
   	          let event = info.event._def;
   	          let instance = info.event._instance;
   	          let idVal = event.publicId;
   	          let titleVal = event.title;
   	          let allDay = event.allDay;
   	          let startVal = instance.range.start;
   	          let endVal = instance.range.end;

   	          let startDateVal = startVal.toISOString().split(".")[0].split("T")[0];
   	          let endDateVal = endVal.toISOString().split(".")[0].split("T")[0];
   	          let startTimeVal = startVal.toISOString().split(".")[0].split("T")[1];
   	          let endTimeVal = endVal.toISOString().split(".")[0].split("T")[1];

   	          // 이벤트의 정보들을 가공하여 input에 입력
   	          id.val(idVal);
   	          title.val(titleVal);
   	          startDate.val(startDateVal);
   	          endDate.val(endDateVal);

   	          if (allDay) {
   	            // 종일 여부가 true이면
   	            allDayCheckBox.attr("checked", true);
   	            startTime.attr("disabled", true);
   	            endTime.attr("disabled", true);
   	            startTime.val("00:00:00");
   	            endTime.val("00:00:00");
   	          } else {
   	            allDayCheckBox.attr("checked", false);
   	            startTime.val();
   	            endTime.val();
   	            startTime.val(startTimeVal);
   	            endTime.val(endTimeVal);
   	          }
   	        },
   	        locale: "ko", // 한국어 설정
   	      });
   	      // calendar 띄우기
   	      calendar.render();
   	    },
   	  });
   	}
                    
</script>

</html>