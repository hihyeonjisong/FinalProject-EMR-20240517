<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal"
	data-nav-style="menu-click" data-menu-position="fixed"
	data-theme-mode="light">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Image Slider</title>
<style>
.image-preview{
	max-height: 200px; /* 이미지의 최대 높이를 100px로 지정 */
	width: auto; /* 가로 너비는 자동으로 조정됨 */
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


<!-- <div class="page"> -->
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
<%@ include file="/WEB-INF/views/patient/patientHeader.jsp"%>
		<!-- 본문 시작 -->
		<!-- Start::app-content -->
 	<div class="main-content app-content">
		<div class="container-fluid">

			<div class="card-header">
				<!-- 페이지 헤더 -->
				<!-- Page Header -->
				<div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
					<h1 class="page-title fw-semibold fs-18 mb-0">공지사항</h1>
					<div class="ms-md-1 ms-0">
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="/patient/notice/list">list</a></li>
								<li class="breadcrumb-item active" aria-current="page">detail</li>
							</ol>
						</nav>
					</div>
				</div>
				<!-- Page Header Close -->
				<!-- 페이지 헤더 끝 -->
			</div>

			<!-- 본문의 본문 -->
			<!-- Start::row-1 -->
			<div class="card-body">
				<div class="row">
					<div class="table-responsive">
						<table border="1" class="table">
							<c:set value="${patntNoticeVO }" var="detail" />
							<tr>
								<th colspan="8" style="text-align:center;">
									<h6>${detail.patntNoticeTitle }</h6>
								</th>
							</tr>
							<tr>
								<th>
									작성자
								</th>
								<td>
									<span>${detail.patntNoticeWriter }</span>
								</td>
								<th>
									작성일
								</th>
								<td>
									<span>${detail.patntNoticeDate}</span>
								</td>
								<th>
									글번호
								</th>
								<td>
									<span>${detail.patntNoticeNo }</span>
								</td>
								<th>
									조회수
								</th>
								<td>
									<span>${detail.patntNoticeHit }</span>
								</td>
							</tr>
							<tr>
								<td colspan="8">
									<div style="padding:10px;">
										<span>${detail.patntNoticeContent }</span>
									</div>
								</td>
							</tr>
							<!-- 첨부파일 표시 구역 --><!-- 첨부파일 표시 구역 --><!-- 첨부파일 표시 구역 -->
							<tr>
								<th width="150px;">
									첨부파일
								</th>
								<td colspan="7">
									<span>
										<c:if test="${not empty detail.attachFileList}">
											<c:forEach items="${detail.attachFileList}" var="file" varStatus="status">
												<div style="padding:10px;">
													<p>파일 ${status.count}: <c:out value="${file.attachName}"></c:out> <a 
														href="/patient/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}" 
														target="_blank">(다운로드)</a></p>
														<a href="#" onclick="openImage('/patient/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}');
															return false;" class="image-preview">
															<img src="/patient/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}" 
																class="image-preview">
														</a>
												</div>
											</c:forEach>
										</c:if>
									</span>
								</td>
							</tr>
							<!-- 첨부파일 표시 구역 끝 --><!-- 첨부파일 표시 구역 끝 --><!-- 첨부파일 표시 구역 끝 -->
						</table>
				   	</div>
				  </div>
			</div>
			<!--End::row-1 -->
			<!-- 본문의 본문 끝 -->

			<div class="card-footer" align="left">
				<c:set var="admin" value="원무과"/>
				<c:if test="${admin eq sessionScope.user.member.empJob}">
					<button class="btn btn-light" id="editBtn"
						onclick="location.href='/patient/notice/update?patntNoticeNo=${detail.patntNoticeNo}'">수정</button>
					<button id="delBtn" class="btn btn-light" type="button">삭제</button>
				</c:if>
					<button id="listBtn" class="btn btn-light"
						onclick="location.href='/patient/notice/list'">목록</button>
					<form action="/patient/notice/delete" method="post" id="delForm">
						<input type="hidden" name="patntNoticeNo" value="${detail.patntNoticeNo }"/>
						<input type="hidden" name="attachmentGroupNo" value="${detail.attachmentGroupNo }"/>
						<sec:csrfInput />
					</form>
					
			</div>
			<div class="card-footer" align="right">
			</div>
				
		</div>
	</div>
	<!-- End::app-content -->
	<!--본문 끝-->

</div>
	

</body>
<script type="text/javascript">
$(function(){
	var delBtn = $("#delBtn");
	
	delBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			delForm.submit();
		}
	});
});
</script>
</html>