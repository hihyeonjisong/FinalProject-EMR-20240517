<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal"
	data-nav-style="menu-click" data-menu-position="fixed"
	data-theme-mode="light">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
#my-custom-card {
	/* height: 1000px; 원하는 높이 값으로 조정 */
	width:  100%;
	margin: 0 auto;
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

			<div class="card custom-card">

				<div class="card-header">
					<!-- 페이지 헤더 -->
					<!-- Page Header -->
					<div
						class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
						<h1 class="page-title fw-semibold fs-18 mb-0">공지사항</h1>
						<div style="margin-right:10px;">&nbsp;</div>
						<div class="ms-md-1 ms-0">
							<nav>
								<ol class="breadcrumb mb-0">
									<li class="breadcrumb-item"><a href="/home">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Notice</li>
								</ol>
							</nav>
						</div>
					</div>
					<!-- Page Header Close -->
					<!-- 페이지 헤더 끝 -->
				</div>
				<!-- card-header 끝 -->

				<!-- 본문의 본문 -->
				<!-- Start::row-1 -->
				<div class="card-body">
					<div class="row">
						<div class="table-responsive">
							<table class="table text-nowrap table-sm"
								style="text-align: center;">
								<thead>
									<tr>
										<th scope="col" class="col-sm-1">No.</th>
										<th scope="col">Title</th>
<!-- 										<th scope="col" class="col-sm-2">Name</th> -->
										<th scope="col" class="col-sm-2">Date</th>
										<th scope="col" class="col-sm-1">Views</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="${pagingVO.dataList }" var="patntNoticeList" />
									<c:choose>
										<c:when test="${empty patntNoticeList }">
											<tr>
												<td colspan="5">공지사항이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${patntNoticeList }" var="notice" varStatus="status">
												<tr>
													<th scope="row">${notice.patntNoticeNo }</th>
													<td>
														<!-- 상세보기 링크 -->
														<a href="/patient/notice/detail?patntNoticeNo=${notice.patntNoticeNo }">
<!-- 														<a href="#"> -->
															${notice.patntNoticeTitle}
														</a>
													</td>
<!-- 													<td> -->
<%-- 														<span class="badge bg-light text-dark">${notice.empNoticeWriter }</span> --%>
<!-- 													</td> -->
													<td>
														<fmt:parseDate value="${notice.patntNoticeDate }" var="dateValue" pattern="yyyy-MM-dd"/>
														<fmt:formatDate value="${dateValue }" pattern="yyyy-MM-dd"/>
													</td>
													<td>${notice.patntNoticeHit }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div> <!-- table-responsive 끝 -->


					</div>


				</div> <!-- card-body 끝 -->
				<!--End::row-1 -->
				<!-- 본문의 본문 끝 -->

				<!-- footer 시작 -->
				<div class="card-footer">
				
					<!-- 기능 버튼 -->
					<div align="left" style="float:left;">
						<c:set var="admin" value="원무과"/>
						<c:if test="${admin eq sessionScope.user.member.empJob}">
							<button class='btn btn-info' id='postBtn'
								onclick='/patient/notice/form'>등록</button>
						</c:if>
						<button id="listBtn" class="btn btn-light"
							onclick="location.href='/patient/notice/list'">목록</button>
					</div>
					<!-- 기능 버튼 끝 -->

					<!-- 검색 공간 -->
					<div style="float:left;margin-left:10px;">
						<form class="row row-cols-lg-auto g-3 align-items-center"
							id="searchForm" method="post">
							<input type="hidden" name="page" id="page"/>
							<div class="input-group">
								<div class="col-3" style="margin-right:1px;">
									<label class="visually-hidden" for="searchType">검색 종류</label>
									<select class="form-select" id="searchType" name="searchType">
										<option value="title"
											<c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
										<option value="content"
											<c:if test="${searchType eq 'content' }">selected</c:if>>제목+내용</option>
										<option value="writer"
											<c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
									</select>
								</div>
								<div class="col-5" style="margin-right:1px;">
									<label class="visually-hidden"
										for="searchWord">검색</label>
									<input type="text" class="form-control"
										id="searchWord" name="searchWord" value="${searchWord }"
										placeholder="검색할 단어를 입력하세요">
								</div>

								<div class="col-4">
									<button type="submit" class="btn btn-info">
									<i class="fas fa-search"></i>검색</button>
								</div>
							</div>
							<sec:csrfInput />
						</form>
					</div>
					<!-- 검색 공간 끝 -->

					<!-- 페이징 -->
					<div align="right" style="float:right;">
						<div align="right" id="pagingArea">
							${pagingVO.pagingHTML }
						</div>
					</div>
					<!-- 페이징 끝 -->
				</div>
				<!-- footer 끝 -->

			</div> <!-- custom-card 끝 -->
		</div> <!-- container-fluid 끝 -->
	</div> <!-- main-content app-content 끝 -->
	<!-- End::app-content -->
	<!--본문 끝-->

</div>
<!-- page 끝 -->


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

</body>



<script src="${pageContext.request.contextPath }/resources/js/empNoticePaging.js"></script>
