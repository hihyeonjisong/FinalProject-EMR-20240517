<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!-- FullCalendar CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<style type="text/css">
.ui-autocomplete {
  max-height: 200px;
  overflow-y: auto;
  /* prevent horizontal scrollbar */
  overflow-x: hidden;
  height: auto;
}

.ui-menu-item div.ui-state-hover,
.ui-menu-item div.ui-state-active {
  color: #ffffff;
  text-decoration: none;
  background-color: #f6B664;
  border-radius: 0px;
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  background-image: none;
  border:none;
}

</style>

	<!-- Loader -->
	<div id="loader">
		<img
			src="${pageContext.request.contextPath }/resources/assets/images/media/loader.svg"
			alt="">
	</div>
	<!-- Loader -->

	<div class="page">

		<div class="main-content app-content">
			<div class="container-fluid">

				<!-- Start::page-header -->


				<!-- End::page-header -->

				<!-- Start::row-1 -->
				<div class="row">
					<div class="col-xxl-12 col-xl-12">
						<div class="col-xxl-12 col-xl-6">
							<div class="card custom-card">
								<div class="card-header justify-content-between">
									<div class="card-title"> 간호사 근무 일정표</div>
								</div>
								<div class="card-body" id="waitingList" style="height: 900px;" >
									<!-- <form action="" method="post" id="uploadForm" enctype="multipart/form-data">
										<p>데이터 업로드 엑셀(xls, xlsx)</p>
										<input type="file" name="upFile" id="upFile" accept=".xls, .xlsx">
										<div id="excelTable">
											<div id="tableTitle"></div>
											<table id="scheduleTable" class="table">
												<thead id="theadArea"></thead>
												<tbody id="tbodyArea"></tbody>
											</table>
										</div>
									</form> -->
									<div id="calendar"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="col-xxl-2 col-xl-12"> -->

			</div>
			<!-- End::row-1 -->

		</div>
	</div>
	<!-- End::app-content -->

	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="searchModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="input-group">
						<a href="javascript:void(0);" class="input-group-text"
							id="Search-Grid"><i
							class="fe fe-search header-link-icon fs-18"></i></a> <input
							type="search" class="form-control border-0 px-2"
							placeholder="Search" aria-label="Username"> <a
							href="javascript:void(0);" class="input-group-text"
							id="voice-search"><i class="fe fe-mic header-link-icon"></i></a>
						<a href="javascript:void(0);" class="btn btn-light btn-icon"
							data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fe fe-more-vertical"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
							<li><a class="dropdown-item" href="javascript:void(0);">Another
									action</a></li>
							<li><a class="dropdown-item" href="javascript:void(0);">Something
									else here</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="javascript:void(0);">Separated
									link</a></li>
						</ul>
					</div>
					<div class="mt-4">
						<p class="font-weight-semibold text-muted mb-2">Are You
							Looking For...</p>
						<span class="search-tags alert"><i class="fe fe-user me-2"></i>People<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-file-text me-2"></i>Pages<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-align-left me-2"></i>Articles<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span> <span
							class="search-tags alert"><i class="fe fe-server me-2"></i>Tags<a
							href="javascript:void(0)" class="tag-addon"
							data-bs-dismiss="alert"><i class="fe fe-x"></i></a></span>
					</div>
					<div class="my-4">
						<p class="font-weight-semibold text-muted mb-2">Recent Search
							:</p>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
							<a href="notifications.html"><span>Notifications</span></a> <a
								class="ms-auto lh-1" href="javascript:void(0);"
								data-bs-dismiss="alert" aria-label="Close"><i
								class="fe fe-x text-muted"></i></a>
						</div>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-2 alert">
							<a href="alerts.html"><span>Alerts</span></a> <a
								class="ms-auto lh-1" href="javascript:void(0);"
								data-bs-dismiss="alert" aria-label="Close"><i
								class="fe fe-x text-muted"></i></a>
						</div>
						<div
							class="p-2 border br-5 d-flex align-items-center text-muted mb-0 alert">
							<a href="mail.html"><span>Mail</span></a> <a class="ms-auto lh-1"
								href="javascript:void(0);" data-bs-dismiss="alert"
								aria-label="Close"><i class="fe fe-x text-muted"></i></a>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="btn-group ms-auto">
						<button type="button" class="btn btn-sm btn-primary-light">Search</button>
						<button type="button" class="btn btn-sm btn-primary">Clear
							Recents</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- Footer Start -->

	<!-- Footer End -->

	


	<!-- Scroll To Top -->

	<!-- Scroll To Top -->

	<!-- Popper JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>

	<!-- Bootstrap JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Defaultmenu JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/defaultmenu.min.js"></script>

	<!-- Node Waves JS-->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>

	<!-- Sticky JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/sticky.js"></script>

	<!-- Simplebar JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/simplebar.js"></script>

	<!-- Color Picker JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>



	<!-- Custom-Switcher JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/custom-switcher.min.js"></script>

	<!-- Prism JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/prismjs/prism.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/prism-custom.js"></script>

	<!-- Filepond JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond/filepond.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-encode/filepond-plugin-file-encode.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-edit/filepond-plugin-image-edit.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-transform/filepond-plugin-image-transform.min.js"></script>


	<!-- Dropzone JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/dropzone/dropzone-min.js"></script>

	<!-- Fileupload JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/fileupload.js"></script>

	<!-- Custom JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>


	<!-- JSVector Maps JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/js/jsvectormap.min.js"></script>

	<!-- JSVector Maps MapsJS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/maps/world-merc.js"></script>



	<!-- CRM-Dashboard -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/crm-dashboard.js"></script>


	<!-- Custom-Switcher JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/custom-switcher.min.js"></script>

    <!-- Jquery Cdn -->
<!--     <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> -->
    
    <!-- Select2 Cdn -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- Internal Select-2.js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/select2.js"></script>
    
    <!-- FullCalendar -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>


</body>
<script type="text/javascript">
$(function(){
	/* let upFile = $("#upFile")[0];
	
	upFile.addEventListener("change", function(){
		let form = $("#uploadForm")[0];
		let formData = new FormData(form);
		
		// 파일 업로드 시 FormData에 파일 추가
		formData.append("upFile", upFile.files[0]);
		
		$.ajax({
	// 		enctype: 'multipart/form-data',
			type : "post",
			url : "/nurse/getSchedule",
			processData : false,
			contentType : false,
			cache : false,
			data : formData,
			success : function(response){
				console.log(response);
				console.log(response.dataList);
				let scheduleList = response.dataList;
				if (response.status === "success") {
	            	console.log("SUCCESS!!!");
	            	
	            	let titleArea = $('#tableTitle');
	            	let title = scheduleList[0].month + "월 근무표";
	            	titleArea.text(title);
	            	
	            	let list = scheduleList[0].scheduleList;
	            	console.log(list);
	            	let th = "<tr>";
	            	th += "<th>사번</th>";
	            	th += "<th>이름</th>";
	            	for (let day in list) {
	            	    if (list.hasOwnProperty(day)) {
	            	        console.log("Day " + day);
	            	        // 여기서 각 일별 업무(duty)에 대한 처리를 수행할 수 있음
	            	        th += "<th>" + day + "</th>";
	            	    }
	            	}
	            	th += "</tr>";
	            	let theadArea = $('#theadArea');
	            	theadArea.html(th);
	            	
	            	let td = "";
	            	$.each(scheduleList, function (index, item) {
						let empNo = item.empNo;
						let memName = item.memName;
						let scheduleList = item.scheduleList;
						td += "<tr>"
						td += "<td>" + item.empNo + "</td>"
						td += "<td>" + item.memName + "</td>"
						for (let day in scheduleList) {
							if (list.hasOwnProperty(day)) {
								let duty = scheduleList[day];
		            	        console.log("Day " + day + ", Duty : " + duty);
		            	        // 여기서 각 일별 업무(duty)에 대한 처리를 수행할 수 있음
		            	        td += "<td>" + duty + "</td>"
		            	    }
						}
						console.log("empNo", empNo);
						console.log("memName", memName);
						td += "</tr>"
					});
	            	
	            	let tbodyArea = $('#tbodyArea');
	            	tbodyArea.html(td);
	            	
	        } else {
	            alert("파일 업로드 실패");
	        }		
			
			},
			error: function (xhr, status, error) {
		        console.error(xhr.responseText);
		        alert("파일 업로드 실패");
		    }
		});
	}); */
	
	let events = [
		 {
	         title: 'Off',
	         start: '2024-05-01T00:00:00', // 시작 시간
	         end: '2024-05-02T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	         title: 'Day',
	         start: '2024-05-02T07:00:00', // 시작 시간
	         end: '2024-05-02T15:00:00', // 종료 시간
	         backgroundColor: 'limegreen'
	     },
		 {
	         title: 'Day',
	         start: '2024-05-03T07:00:00', // 시작 시간
	         end: '2024-05-03T15:00:00', // 종료 시간
	         backgroundColor: 'limegreen'
	     },
		 {
	         title: 'Off',
	         start: '2024-05-04T00:00:00', // 시작 시간
	         end: '2024-05-05T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	         title: 'Evening',
	         start: '2024-05-05T15:00:00', // 시작 시간
	         end: '2024-05-05T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-06T15:00:00', // 시작 시간
	         end: '2024-05-06T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-07T15:00:00', // 시작 시간
	         end: '2024-05-07T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-08T00:00:00', // 시작 시간
	         end: '2024-05-09T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-09T15:00:00', // 시작 시간
	         end: '2024-05-09T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-10T15:00:00', // 시작 시간
	         end: '2024-05-10T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-11T00:00:00', // 시작 시간
	         end: '2024-05-12T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-12T00:00:00', // 시작 시간
	         end: '2024-05-13T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-13T00:00:00', // 시작 시간
	         end: '2024-05-14T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	         title: 'Night',
	         start: '2024-05-14T23:00:00', // 시작 시간
	         end: '2024-05-15T07:00:00', // 종료 시간
	         backgroundColor: 'navy'
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-15T00:00:00', // 시작 시간
	         end: '2024-05-16T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
	     
		 {
	    	 title: 'Off',
	         start: '2024-05-17T00:00:00', // 시작 시간
	         end: '2024-05-18T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	    	 title: 'Night',
	         start: '2024-05-18T23:00:00', // 시작 시간
	         end: '2024-05-19T07:00:00', // 종료 시간
	         backgroundColor: 'navy'
	     },
		 {
	    	 title: 'Night',
	         start: '2024-05-19T23:00:00', // 시작 시간
	         end: '2024-05-20T07:00:00', // 종료 시간
	         backgroundColor: 'navy'
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-20T00:00:00', // 시작 시간
	         end: '2024-05-21T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-21T00:00:00', // 시작 시간
	         end: '2024-05-22T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-22T15:00:00', // 시작 시간
	         end: '2024-05-22T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-23T15:00:00', // 시작 시간
	         end: '2024-05-23T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-24T15:00:00', // 시작 시간
	         end: '2024-05-24T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-25T00:00:00', // 시작 시간
	         end: '2024-05-26T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-27T15:00:00', // 시작 시간
	         end: '2024-05-27T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-28T15:00:00', // 시작 시간
	         end: '2024-05-28T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Evening',
	         start: '2024-05-29T15:00:00', // 시작 시간
	         end: '2024-05-29T23:00:00', // 종료 시간
	         backgroundColor: 'yellow'
	     },
		 {
	    	 title: 'Off',
	         start: '2024-05-30T00:00:00', // 시작 시간
	         end: '2024-05-31T00:00:00', // 종료 시간
	         backgroundColor: 'gray',
	         allDay : true
	     },
		 {
	         title: 'Day',
	         start: '2024-05-31T07:00:00', // 시작 시간
	         end: '2024-05-31T15:00:00', // 종료 시간
	         backgroundColor: 'limegreen'
	     }
	];
	
	let calendarEl = document.getElementById('calendar');
	let calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',	// FullCalendar가 처음 로드되었을때 뷰 설정
	    headerToolbar : {				// 헤드툴바 설정
	    	center : "title",			
	       	left : ""
	    },
		events : events,
	    expandRows : true,
	    selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,	// 드롭 가능 여부 설정
		editable : true,	// 수정 가능 여부 설정
		nowIndicator: true, // 현재 시간 마크
		navLinks : true,	// 링크 활성화 여부 설정
		eventResize : function(info) {	// 리사이즈 이벤트(리사이즈 시 이벤트 내용 수정)
			console.log(info);
		},
		// 이벤트가 드롭되었을 떄 이벤트
		eventDrop : function(info) {
			console.log(info);
		},
		// 달력 칸을 선택했을 경우(이벤트 선택 x)
		select : function(info) {
			console.log(info);
		},
		// 이벤트를 클릭했을 때의 이벤트
		eventClick : function(info) {
			console.log(info);
		},
		locale: 'ko' // 한국어 설정
	});
	calendar.render();
});
</script>


</html>