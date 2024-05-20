<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token }">
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- css 파일 -->
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/assets/images/brand-logos/favicon.ico"
	type="image/x-icon">
<!-- Choices JS -->
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>
<!-- Main Theme Js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>
<!-- Bootstrap Css -->
<link id="style"
	href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Style Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/styles.min.css"
	rel="stylesheet">
<!-- Icons Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/icons.css"
	rel="stylesheet">
<!-- Node Waves Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.css"
	rel="stylesheet">
<!-- Simplebar Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.css"
	rel="stylesheet">
<!-- Color Picker Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/flatpickr/flatpickr.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/themes/nano.min.css">
<!-- Choices Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/styles/choices.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/css/jsvectormap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/custom/searchCustom.css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css">
	
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css"> -->
	
	
<script src="${pageContext.request.contextPath }/resources/fullcalendar/index.global.js"></script>




<!-- Main Theme Js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

<style type="text/css">
/* .card{ */
/* margin-top: 10px; */
/* } */
body {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
}

.app-content{
	margin-left: 11% !important;
    margin-top: 5% !important;
}
.main-profile-cover:before {
	background-color: rgba(166, 205, 255) !important;
}
.btn-primary {
	background-color: rgba(166, 205, 255) !important;
	border-color : rgba(166, 205, 255) !important;
}
.page-item.active .page-link {
    color: #fff;
    background-color: rgb(166, 205, 255);
    border-color: rgb(166, 205, 255);
}

.dropdown-item.active {
    font-weight: 700 ;
    border-radius: 19px;
}

.dropdown-item {
  color: $default-text-color;
  white-space: unset;
  padding: 0.5rem 0.9375rem;
  font-size: 0.8125rem;
  font-weight: 500;

  &:not(.active) {
    &:hover,
    &:focus,
    &:active {
      color: rgb(35 183 229);
      background-color: rgb(35 183 229 / 12%);
      border-radius: 19px;
      
    }
  }
  &.active {
    background-color: rgb(71 211 255 / 12%) !important;
  }
}

 .form-check-input:checked {
    background-color: rgb(35 183 229);
    border-color: rgb(35 183 229);
}

.fc .fc-button-primary {
    background-color: rgba(166, 205, 255) !important;
    border-color: rgba(166, 205, 255) !important;
}

.fc .fc-daygrid-day.fc-day-today {
     background-color: rgba(166, 205, 255, 0.3) !important; 
 } 


</style>
</head>
<body>
	<!-- 헤더 -->
	<tiles:insertAttribute name="header" />
	<!-- 헤더 끝 -->

	<!-- 사이드 바 -->
	<tiles:insertAttribute name="sidebar" />
	<!-- 사이드 바 끝 -->

	<!-- 메인 page 영역 -->
	<tiles:insertAttribute name="content" />
	<!-- 메인 page 영역 끝 -->




	<!-- 스크립트 파일 -->

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
	<!-- JSVector Maps JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/js/jsvectormap.min.js"></script>
	<!-- JSVector Maps MapsJS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/jsvectormap/maps/world-merc.js"></script>
	<!-- Apex Charts JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/apexcharts/apexcharts.min.js"></script>
	<!-- Chartjs Chart JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/chart.js/chart.min.js"></script>
	<!-- CRM-Dashboard -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/crm-dashboard.js"></script>
	<!-- Color Picker JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>
	<!-- Custom-Switcher JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/custom-switcher.min.js"></script>
	<!-- Chat JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/chat.js"></script>
	<!-- Custom JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>
	<!-- 제이쿼리 -->

	<!-- 데이트피커 -->
		<script
		src="${pageContext.request.contextPath }/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/date&time_pickers.js"></script>


	<script
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.6/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>

	<!-- Internal Datatables JS -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/datatables.js"></script>



	<script type="text/javascript">
// 	var websocket = null;
// 	connect();
	
// 	function connect() {
// 	    // 웹소켓 주소
// 	    var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/chat.do";
// 	    // 소켓 객체 생성
// 	    websocket = new WebSocket(wsUri);
// 	    //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록 (오버라이딩)
// 	    websocket.onopen = function(){
// 	    	console.log('소켓 접속');
// 	    }
// 	}
	</script>







	<!-- Custom JS -->
	<%--     <script src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script> --%>





</body>
</html>