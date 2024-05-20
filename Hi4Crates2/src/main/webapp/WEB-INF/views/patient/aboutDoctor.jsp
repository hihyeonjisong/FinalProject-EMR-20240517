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

#eventid1 {
    background-color: rgba(116, 189, 203, 0.5); /* 80% 투명도를 가진 연한 파란색 */
    color: white; /* 부모 요소의 글자색을 흰색으로 설정 */
}
// 카드 바디 부분 고정
/* Custom CSS */
    .custom-card .card-body {
        /* 고정된 높이 설정 */
        height: 300px; /* 원하는 높이로 설정 */
        /* overflow: hidden; */ /* 만약 내용이 넘칠 경우 가릴지 여부 설정 */
    }

.card-title {
    border-radius: 10px; /* 테두리의 꼭지점을 둥글게 만듭니다. */
    border: 1px solid #ccc; /* 필요한 경우 테두리 스타일을 추가합니다. */
    padding: 10px; /* 테두리 내부의 여백을 지정합니다. */
    width: 150px;
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

<!-- 새손 -->
<!-- bb.css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/bb.css" rel="stylesheet">
   <!-- basic.css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/basic.css" rel="stylesheet">

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
	height: 600%;
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
																	<a href="">
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
				<div class="real-cont">
        <!--// content -->			
        <div class="intro-list">
<div class="items">
    <div class="item" style="margin-left: 20px;">
        <div class="img">
            <div class="thumb">
                <img src="${pageContext.request.contextPath }/resources/assets/images/faces/2.png" alt="">
            </div>
        </div>
        <div class="cnt">
            <div class="name" style="background-color: #4a9fff;">
                <p style="font-size: 20px;">병원장</p>
                <h3>장 승 수 <span>Jang Suengsu</span></h3>
            </div>
            <div class="txt">
                <dl>
					<dd>충남대학교 의과대학</dd>
					<dd>서울성애병원 성형외과 전공의</dd>
					<dd>성형외과 전문의</dd>
					<dd>수부외과 세부 전문의</dd>
					<dd>의학박사</dd>
					<dd>대전 선병원 성형외과 과장</dd>
					<dd>대한성형외과학회 대전·충청지회 회장</dd>
					<dd>대한수부외과학회 이사</dd>
					<dd>을지의과대학 성형외과 외래부교수</dd>
					<dd>충남대학교병원 성형외과 외래부교수</dd>
					<dd>대한 성형외과 학회 정회원</dd>
					<dd>대한 미용성형외과 학회 정회원</dd>
					<dd>대한 수부외과 학회 정회원</dd>
					<dd>대한 미세수술학회 정회원</dd>
				</dl>
                <p class="mgt15"><strong>주요 진료분야 : </strong></p>
            </div>
        </div>
    </div>
    <div class="item">
        <div class="img">
            <div class="thumb">
                <img src="${pageContext.request.contextPath }/resources/assets/images/faces/6.png" alt="">
            </div>
        </div>
        <div class="cnt">
            <div class="name" style="background-color: #4a9fff;">
                <p style="font-size: 20px;">정형외과장</p>
                <h3>조 현 준 <span>Jo Hyunjoon</span></h3>
            </div>
            <div class="txt">
                <dl>
					<dd>충남대학교 의과대학</dd>
					<dd>경찰병원 수련의</dd>
					<dd>상계 백병원 정형외과 전공의</dd>
					<dd>정형외과 전문의</dd>
					<dd>수부외과 세부 전문의</dd>
					<dd>상계 백병원 척추센터</dd>
					<dd>국군 강릉병원 정형외과장</dd>
					<dd>성심병원 정형외과장</dd>
					<dd>신탄진 한일병원 정형외과장</dd>
					<dd>대한 정형외과 학회 정회원</dd>
					<dd>대한 수부외과 학회 정회원</dd>
					<dd>대한 미세수술학회 정회원</dd>
					<dd>대한 족부 족관절학회 정회원</dd>
				</dl>
                <p class="mgt15"><strong>주요 진료분야 : </strong></p>
            </div>
        </div>
    </div>
    <div class="item">
        <div class="img">
            <div class="thumb">
                <img src="${pageContext.request.contextPath }/resources/assets/images/faces/7.png" alt="">
            </div>
        </div>
        <div class="cnt">
            <div class="name" style="background-color: #4a9fff;">
                <p style="font-size: 20px;">정형외과 전문의</p>
                <h3>선 민 수 <span>Seon Minsu</span></h3>
            </div>
            <div class="txt">
                <dl>
					<dd>가톨릭 의과대학</dd>
					<dd>가톨릭의과대학부속 성모병원 성형외과 전공의</dd>
					<dd>성형외과 전문의</dd>
					<dd>대전 선사 성형외과 대표 원장</dd>
					<dd>대전 선병원 성형외과 과장</dd>
					<dd>대전 가톨릭 성형외과 원장</dd>
					<dd>대한 성형외과 학회 정회원</dd>
					<dd>대한 미용성형외과 학회 정회원</dd>
					<dd>대한 성형외과 개원의 협의회 정회원</dd>
					<dd>가톨릭대학교 의과대학 성형외과 외래부교수</dd>
					<dd>대한 수부외과 학회 정회원</dd>
				</dl>
                <p class="mgt15"><strong>주요 진료분야 : 미세접합, 귀 켈로이드 성형, 미용성형 및 흉터성형</strong></p>
            </div>
        </div>
    </div>
    <div class="item">
        <div class="img">
            <div class="thumb">
                <img src="${pageContext.request.contextPath }/resources/assets/images/faces/4.png" alt="">
            </div>
        </div>
        <div class="cnt">
            <div class="name" style="background-color: #4a9fff;">
                <p style="font-size: 20px;">정형외과 전문의</p>
                <h3>김 다 애 <span>Kim Daae</span></h3>
            </div>
            <div class="txt">
                <dl>
					<dd>건양대학교 의과대학</dd>
					<dd>건양대학교 성형외과 전공의</dd>
					<dd>성형외과 전문의</dd>
					<dd>리앤장 성형외과 강남점 과장</dd>
					<dd>보령아산병원 성형외과 과장</dd>
					<dd>대한 성형외과 학회 정회원</dd>
					<dd>대한 미용성형외과 학회 정회원</dd>
					<dd>대한 수부외과 학회 정회원</dd>
				</dl>
                <p class="mgt15"><strong>주요 진료분야 : 수부 외상, 안면부 외상, 미용성형 및 쁘띠성형 시술</strong></p>
            </div>
        </div>
    </div>
    <div class="item">
        <div class="img">
            <div class="thumb">
                <img src="${pageContext.request.contextPath }/resources/assets/images/faces/3.png" alt="">
            </div>
        </div>
        <div class="cnt">
            <div class="name" style="background-color: #4a9fff;">
                <p style="font-size: 20px;">정형외과 전문의</p>
                <h3>백 지 은 <span>Baek Jieun</span></h3>
            </div>
            <div class="txt">
                <dl>
					<dd>고신대학교 의과대학</dd>
					<dd>계명대학교 성형외과 전공의</dd>
					<dd>동산의료원 전임의</dd>
					<dd>성형외과 전문의</dd>
					<dd>수부외과 세부 전문의</dd>
					<dd>대한 성형외과 학회 지도전문의</dd>
					<dd>대구 W병원 수부미세재건센터 과장</dd>
					<dd>대한 성형외과 학회 정회원</dd>
					<dd>대한 수부외과 학회 정회원</dd>
					<dd>대한 미세수술 학회 정회원</dd>
					<dd>대한 창상 학회 정회원</dd>
					<dd>대한 두개안면성형외과 학회 정회원</dd>
					<dd>대한 미용성형외과 학회 정회원</dd>
					<dd>대한 당뇨발 학회 정회원</dd>
				</dl>
                <p class="mgt15"><strong>주요 진료분야 : 손과 손목의 통증, 손 저림 및 변형, 관절염, 미세수술 및 외상 후 재건</strong></p>
            </div>
        </div>
    </div>
    
    <div class="item">
        <div class="img">
            <div class="thumb">
                <img src="${pageContext.request.contextPath }/resources/assets/images/faces/1.png" alt="">
            </div>
        </div>
            <div class="cnt">
            <div class="name" style="background-color: #4a9fff;">
                <p style="font-size: 20px;">신경외과장</p>
                <h3>송 현 지 <span>Song Hyunji</span></h3>
            </div>
            <div class="txt">
                <dl>
					<dd>가톨릭관동대학교 의과대학</dd>
					<dd>분당차병원 정형외과 전공의</dd>
					<dd>정형외과 전문의</dd>
					<dd>서울 두발로정형외과 서울족부센터 과장 및 전임의</dd>
					<dd>대한 정형외과학회 정회원</dd>
					<dd>대한 족부외과학회 정회원</dd>
					<dd>2018 Boston 미국족부족관절학회 AOFAS Poster 발표</dd>
				</dl>
                <p class="mgt15"><strong>주요 진료분야 : 안면부 외상 / 소아 안면열상 및 성형외과적 치료</strong></p>
            </div>
        </div>
    </div>
    <div class="item">
        <div class="img">
            <div class="thumb">
                <img src="${pageContext.request.contextPath }/resources/assets/images/faces/8.png" alt="">
            </div>
        </div>
            <div class="cnt">
            <div class="name" style="background-color: #4a9fff;">
                <p style="font-size: 20px;">신경외과 전문의</p>
                <h3>최 현 흠 <span>Choi Hyeonheum</span></h3>
            </div>
            <div class="txt">
                <dl>
					<dd>동국대학교 의과대학</dd>
					<dd>동국대학교 성형외과 전공의</dd>
					<dd>성형외과 전문의</dd>
					<dd>대한 성형외과 학회 정회원</dd>
					<dd>대한 수부외과 학회 정회원</dd>
					<dd>대한 미세수술학회 정회원</dd>
					<dd>대한 두개안면성형외과 학회 정회원</dd>
					<dd>대한 미용성형외과 학회 정회원</dd>
					<dd>대한 창상 학회 정회원</dd>
				</dl>
                <p class="mgt15"><strong>주요 진료분야 : 정형외과적 질환 / 발목 및 발의 외상과 질환 / 하지 외상</strong></p>
            </div>
        </div>
    </div>
    <div class="item">
        <div class="img">
            <div class="thumb">
                <img src="${pageContext.request.contextPath }/resources/assets/images/faces/5.png" alt="">
            </div>
        </div>
            <div class="cnt">
            <div class="name" style="background-color: #4a9fff;">
                <p style="font-size: 20px;">신경외과 전문의</p>
                <h3>김 태 원 <span>Kim Taewon</span></h3>
            </div>
            <div class="txt">
                <dl>
					<dd>건양대학교 의과대학</dd>
					<dd>건양대학교 성형외과 전공의</dd>
					<dd>성형외과 전문의</dd>
					<dd>리앤장 성형외과 강남점 과장</dd>
					<dd>보령아산병원 성형외과 과장</dd>
					<dd>대한 성형외과 학회 정회원</dd>
					<dd>대한 미용성형외과 학회 정회원</dd>
					<dd>대한 수부외과 학회 정회원</dd>
				</dl>
                <p class="mgt15"><strong>주요 진료분야 : 정형외과적 질환 / 발목 및 발의 외상과 질환 / 하지 외상</strong></p>
            </div>
        </div>
    </div>
</div>
</div>			<!-- content //-->
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
</html>