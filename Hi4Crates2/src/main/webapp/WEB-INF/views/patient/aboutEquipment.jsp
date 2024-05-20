<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal"
	data-nav-style="menu-click" data-menu-position="fixed"
	data-theme-mode="light">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<head>
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

#eventid2 {
    background: linear-gradient(to left, transparent 2%, #74bdcb7a 50%); /* 왼쪽은 배경 효과, 오른쪽은 효과 없음 */
    color: white; /* 부모 요소의 글자색을 흰색으로 설정 */
}

.about-company-stats-border {
	height: 100px; /* 원하는 높이로 조정하세요 */
}

.eventid3, .eventid1, .eventid2 {
	font-size: x-large;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
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

		<%@ include file="patientHeader.jsp"%>


		<!-- 메인 -->
		<!-- Start::app-content -->
		<!-- Start::app-content -->
		<div class="main-content app-content" style="margin-top:100px;">
			<div class="container-fluid">

				<!-- Page Header -->
				<!-- Page Header Close -->

				<!-- Start::row-1 -->
				<style>
.aboutus-banner:before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 500%;
	background-image:
		url("${pageContext.request.contextPath }/resources/assets/img/doctor2.jpg");
	/* 이미지 경로를 설정합니다. */
	background-size: cover;
	/* 이미지를 영역에 맞게 확대 또는 축소합니다. */
	background-position: center;
	/* 이미지를 중앙으로 정렬합니다. */
	opacity: 0.5;
	/* 이미지의 투명도를 조절합니다. */
	z-index: -1;
	/* 이미지가 내용 뒤에 나타나도록 설정합니다. */
}
</style>

				<div class="row">
					<div class="col-xl-12">
						<div class="about-container mb-4">
							<div class="aboutus-banner" style="width: 100%;">
								<div class="aboutus-banner-content">
									<div class="row">
										<div class="col-xl-12 about-company-stats">
											<div class="row justify-content-center">
												<div
													class="col-xxl-5 col-xl-8 col-lg-10 col-md-8 col-sm-10 col-10">
													<div class="card custom-card text-default shadow border">
														<div class="card-body p-0">
															
															<div class="row">
																<div
																	class="col-xl-4 col-xxl-4 col-lg-4 col-md-4 col-sm-4 about-company-stats-border d-flex justify-content-center align-items-center"
																	id="eventid3">
																	<a href="/aboutUs/hospital">
																		<div class="eventid3"
																			style="font-size: x-large; cursor: pointer;">
																			<div>병원소개</div>
																		</div>
																	</a>
																</div>
																<div
																	class="col-xl-4 col-xxl-4 col-lg-4 col-md-4 col-sm-4 about-company-stats-border d-flex justify-content-center align-items-center"
																	id="eventid1">
																	<a href="/aboutUs/doctor">
																		<div class="eventid1"
																			style="font-size: x-large; cursor: pointer;">
																			<div>의료진</div>
																		</div>
																	</a>
																</div>
																<div
																	class="col-xl-4 col-xxl-4 col-lg-4 col-md-4 col-sm-4 d-flex justify-content-center align-items-center"
																	id="eventid2">
																	<a href="/aboutUs/equipment">
																		<div class="eventid2"
																			style="font-size: x-large; cursor: pointer;">
																			<div>장비소개</div>
																		</div>
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End::row-1 -->
				<div class="d-flex justify-content-center mb-4">
                            <ul class="nav nav-tabs mb-3 tab-style-6 bg-primary-transparent" id="myTab1" role="tablist">
						        <li class="nav-item" role="presentation">
						            <button class="nav-link active" id="tab-ct" data-bs-target="#img-ct">CT</button>
						        </li>
						        <li class="nav-item" role="presentation">
						            <button class="nav-link" id="tab-mri" data-bs-target="#img-mri">MRI</button>
						        </li>
						        <li class="nav-item" role="presentation">
						            <button class="nav-link" id="tab-mul" data-bs-target="#img-mul">물리치료기기</button>
						        </li>
						        <li class="nav-item" role="presentation">
						            <button class="nav-link" id="tab-Carm" data-bs-target="#img-Carm">C-arm</button>
						        </li>
						        <li class="nav-item" role="presentation">
						            <button class="nav-link" id="tab-mise" data-bs-target="#img-mise">미세현미경</button>
						        </li>
						        <li class="nav-item" role="presentation">
						            <button class="nav-link" id="tab-jagi" data-bs-target="#img-jagi">자기장치료</button>
						        </li>
						        <li class="nav-item" role="presentation">
						            <button class="nav-link" id="tab-out" data-bs-target="#img-out">체외충격파</button>
						        </li>
						        <li class="nav-item" role="presentation">
						            <button class="nav-link" id="tab-cho" data-bs-target="#img-cho">초음파</button>
						        </li>
						    </ul>      
                        </div>
			</div>
		<div class="equipment1">
            <div class="head">
                <div class="only-desk-top-tablet">
                    <img id="img-ct" src="${pageContext.request.contextPath }/resources/assets/images/equipment/ct.jpg" alt="" style="display: block; margin: 0 auto;">
		            <img id="img-mri" src="${pageContext.request.contextPath }/resources/assets/images/equipment/mri.png" alt="" style="display: none; margin: 0 auto;">
		            <img id="img-mul" src="${pageContext.request.contextPath }/resources/assets/images/equipment/mulli.png" alt="" style="display: none; margin: 0 auto;">
		            <img id="img-Carm" src="${pageContext.request.contextPath }/resources/assets/images/equipment/C-arm.jpg" alt="" style="display: none; margin: 0 auto;">
		            <img id="img-mise" src="${pageContext.request.contextPath }/resources/assets/images/equipment/미세현미경.jpg" alt="" style="display: none; margin: 0 auto;">
		            <img id="img-jagi" src="${pageContext.request.contextPath }/resources/assets/images/equipment/자기장치료.jpg" alt="" style="display: none; margin: 0 auto;">
		            <img id="img-out" src="${pageContext.request.contextPath }/resources/assets/images/equipment/체외충격파.jpg" alt="" style="display: none; margin: 0 auto;">
		            <img id="img-cho" src="${pageContext.request.contextPath }/resources/assets/images/equipment/초음파.jpg" alt="" style="display: none; margin: 0 auto;">
                </div>
            </div>
        </div>
		</div>
	</div>
	

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
<!-- JavaScript -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const buttons = document.querySelectorAll('.nav-link');
        const images = document.querySelectorAll('.equipment1 img');

        buttons.forEach((button, index) => {
            button.addEventListener('click', () => {
                // 모든 버튼에 있는 active 클래스 제거
                buttons.forEach(btn => btn.classList.remove('active'));
                // 클릭된 버튼에 active 클래스 추가
                button.classList.add('active');

                // 모든 이미지를 숨김
                images.forEach(image => image.style.display = 'none');
                // 클릭된 버튼에 해당하는 이미지만 표시
                const targetImageId = button.getAttribute('data-bs-target').substring(1); // # 제거
                const targetImage = document.getElementById(targetImageId);
                if (targetImage) {
                    targetImage.style.display = 'block';
                }
            });
        });
    });
</script>

</html>