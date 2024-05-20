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

#eventid3 {
        background: linear-gradient(to right, transparent 2%, #74bdcb7a 50%); /* 왼쪽은 효과 없음, 오른쪽은 배경 효과 */
        color: white; /* 부모 요소의 글자색을 흰색으로 설정 */
    }


/* 	            .container-xl { */
/* 	  overflow-x: hidden; /* 가로 스크롤을 숨김 */
* /
	/* 	} */ 
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
        <div class="main-content app-content" style="margin-top: 100px;">
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
                        background-image: url("${pageContext.request.contextPath }/resources/assets/img/doctor2.jpg");
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
                                                <div class="col-xxl-5 col-xl-8 col-lg-10 col-md-8 col-sm-10 col-10">
                                                    <div class="card custom-card text-default shadow border">
                                                        <div class="card-body p-0">
                                                            <style>
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
															<div class="row">
																<div
																	class="col-xl-4 col-xxl-4 col-lg-4 col-md-4 col-sm-4 about-company-stats-border d-flex justify-content-center align-items-center"
																	id="eventid3">
																	<a href="">
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
																		<div class="eventid1" style="font-size: x-large; cursor: pointer;">
																			<div>의료진</div>
																		</div>
																	</a>
																</div>
																<div
																	class="col-xl-4 col-xxl-4 col-lg-4 col-md-4 col-sm-4 d-flex justify-content-center align-items-center"
																	id="eventid2">
																	<a href="/aboutUs/equipment">
																		<div class="eventid2" style="font-size: x-large; cursor: pointer;">
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
                            <div class="row pb-5 px-3 about-motto">
                                <div class="col-xxl-5 col-xl-8 col-lg-10 col-md-10 col-sm-12">
                                    <div class="text-justify">
                                        <div>
                                            <div class="d-flex mb-4">
                                                <div> <svg class="motto-icon" xmlns="http://www.w3.org/2000/svg"
                                                        enable-background="new 0 0 24 24" viewBox="0 0 24 24">
                                                        <path fill="#28d193"
                                                            d="M20,4H4.30273c-0.55228,0-1-0.44772-1-1s0.44772-1,1-1H20c0.55228,0,1,0.44772,1,1S20.55228,4,20,4z M15,19v3H9v-3c0-1.65685,1.34315-3,3-3l0,0C13.65685,16,15,17.34315,15,19z M4,12L4,12c-1.10457,0-2-0.89543-2-2V7c0-0.55228,0.44772-1,1-1h3v4C6,11.10457,5.10457,12,4,12z">
                                                        </path>
                                                        <path fill="#94ebcb"
                                                            d="M8,12L8,12c-1.10457,0-2-0.89543-2-2V6h4v4C10,11.10457,9.10457,12,8,12z">
                                                        </path>
                                                        <path fill="#28d193"
                                                            d="M12,12L12,12c-1.10457,0-2-0.89543-2-2V6h4v4C14,11.10457,13.10457,12,12,12z">
                                                        </path>
                                                        <path fill="#94ebcb"
                                                            d="M16,12L16,12c-1.10457,0-2-0.89543-2-2V6h4v4C18,11.10457,17.10457,12,16,12z">
                                                        </path>
                                                        <path fill="#28d193"
                                                            d="M20,12L20,12c-1.10457,0-2-0.89543-2-2V6h3c0.55228,0,1,0.44772,1,1v3C22,11.10457,21.10457,12,20,12z">
                                                        </path>
                                                        <path fill="#bff3e0"
                                                            d="M18,10c0,1.10455-0.89545,2-2,2s-2-0.89545-2-2c0,1.10455-0.89545,2-2,2s-2-0.89545-2-2c0,1.10455-0.89545,2-2,2s-2-0.89545-2-2c0,1.10455-0.89545,2-2,2v9c0,0.55231,0.44769,1,1,1h4v-3c0-1.65686,1.34314-3,3-3s3,1.34314,3,3v3h4c0.55231,0,1-0.44769,1-1v-9C18.89545,12,18,11.10455,18,10z">
                                                        </path>
                                                    </svg> </div>
                                                <div class="ms-4">
                                                    <h5 class="text-muted">대덕정형외과 !</h5>
                                                    <p class="text-muted" style="font-size: medium;">저희 병원은 성형외과 전문의와 정형외과 전문의가 모여 만든 외상병원입니다.
								                                                        안면부와 팔, 다리의 질환과 외상을 치료하고 있으며 특히 미세 현미경을 이용한 손가락 절단 환자의 재접합 수술을 하고 있습니다.
							                         </p>
                                                </div>
                                            </div>
                                            <div class="d-flex mb-4">
                                                <div> <svg class="motto-icon" xmlns="http://www.w3.org/2000/svg"
                                                        enable-background="new 0 0 24 24" viewBox="0 0 24 24">
                                                        <path fill="#94ebcb"
                                                            d="M18,20V3c-0.00005-0.55215-0.44769-0.99971-0.99984-0.99966c-0.17446,0.00002-0.34588,0.04569-0.49723,0.13247L13.5,3.85352l-3.00293-1.72071c-0.3079-0.17643-0.68624-0.17643-0.99414,0L6.5,3.85352L3.49707,2.13281c-0.47899-0.27466-1.08994-0.10903-1.3646,0.36996C2.04569,2.65411,2.00002,2.82554,2,3v17c0,1.10457,0.89543,2,2,2h16C18.89543,22,18,21.10457,18,20z">
                                                        </path>
                                                        <path fill="#28d193"
                                                            d="M21.999,14v6c0,1.10457-0.89543,2-2,2l0,0c-1.10457,0-2-0.89543-2-2v-8h2C21.10357,12,21.999,12.89543,21.999,14z M12,10H8c-0.55228,0-1-0.44771-1-1s0.44772-1,1-1h4c0.55229,0,1,0.44771,1,1S12.55229,10,12,10z M9,14H7c-0.55228,0-1-0.44771-1-1s0.44772-1,1-1h2c0.55229,0,1,0.44771,1,1S9.55229,14,9,14z M9,18H7c-0.55228,0-1-0.44772-1-1s0.44772-1,1-1h2c0.55229,0,1,0.44772,1,1S9.55229,18,9,18z M13,14c-0.54662,0.00567-0.99433-0.43286-1-0.97947c-0.00143-0.13758,0.02585-0.27396,0.08008-0.40041c0.19341-0.50537,0.75987-0.75826,1.26524-0.56486c0.13406,0.0513,0.25521,0.13144,0.35488,0.23474c0.09659,0.09256,0.17161,0.20525,0.21972,0.33008C13.97119,12.74027,13.9984,12.86934,14,13C13.99622,13.55071,13.55071,13.99622,13,14z M13,18c-0.13064-0.00161-0.25971-0.02881-0.37988-0.08008c-0.12124-0.05058-0.23289-0.12162-0.33008-0.21c-0.09109-0.09725-0.16564-0.20875-0.2207-0.33008C12.02149,17.25901,11.99793,17.12994,12,17c0.00346-0.26481,0.10708-0.51849,0.29-0.71c0.23601-0.23439,0.57326-0.33583,0.89941-0.27051c0.06633,0.00976,0.13064,0.03021,0.19043,0.06055c0.06372,0.02159,0.12418,0.05182,0.17969,0.08984c0.0525,0.03702,0.10274,0.07713,0.15047,0.12012c0.18254,0.19176,0.28609,0.44528,0.29,0.71c0.00226,0.26594-0.1022,0.52169-0.29,0.71c-0.09735,0.08817-0.20896,0.15918-0.33008,0.21C13.25973,17.97124,13.13065,17.99842,13,18z">
                                                        </path>
                                                    </svg> </div>
                                                <div class="ms-4" style="font-size: medium;">
                                                    <h5>우리의 비전 !</h5>
                                                    <p class="text-muted">우리 정형외과는 환자 중심의 의료 서비스를 제공하여 모든 환자들이 건강하고 삶의
                                                        	질이 향상되도록 돕고 있습니다. 우리는 환자들의 건강과 행복을 최우선으로 생각하며 항상 환자들과 함께 하겠습니다.
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <div> <svg class="motto-icon" xmlns="http://www.w3.org/2000/svg"
                                                        data-name="Layer 1" viewBox="0 0 24 24">
                                                        <path fill="#94ebcb"
                                                            d="M12,18a3.5,3.5,0,1,1,3.5-3.5A3.50424,3.50424,0,0,1,12,18Z">
                                                        </path>
                                                        <path fill="#28d193"
                                                            d="M14.64026,16.77179a3.452,3.452,0,0,1-5.28052,0A4.98821,4.98821,0,0,0,7,21a.99974.99974,0,0,0,1,1h8a.99974.99974,0,0,0,1-1A4.98821,4.98821,0,0,0,14.64026,16.77179Z">
                                                        </path>
                                                        <path fill="#94ebcb"
                                                            d="M21,12a.99554.99554,0,0,1-.66406-.25244L12,4.33789,3.66406,11.74756a.99991.99991,0,0,1-1.32812-1.49512l9-8a.99893.99893,0,0,1,1.32812,0l9,8A1,1,0,0,1,21,12Z">
                                                        </path>
                                                        <path fill="#bff3e0"
                                                            d="M12,4.33789,4,11.449V21a.99974.99974,0,0,0,1,1H8a.99974.99974,0,0,1-1-1,4.98821,4.98821,0,0,1,2.35974-4.22821l.00006.00006A3.46882,3.46882,0,0,1,8.5,14.5a3.5,3.5,0,0,1,7,0,3.46882,3.46882,0,0,1-.8598,2.27185l.00006-.00006A4.98821,4.98821,0,0,1,17,21a.99974.99974,0,0,1-1,1h3a.99974.99974,0,0,0,1-1V11.449Z">
                                                        </path>
                                                    </svg> </div>
                                                <div class="ms-4" style="font-size: medium;">
                                                    <h5>전문가의 조언</h5>
                                                    <p class="text-muted">우리 정형외과는 정형외과 전문의들로 구성되어 있으며, 환자들에게 최고 수준의 의료서비스와 전문가의 조언을 제공합니다.</p>
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
</html>