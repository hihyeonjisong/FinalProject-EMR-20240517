<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="vertical" data-vertical-style="overlay" data-theme-mode="light" data-header-styles="light" data-menu-styles="light" data-toggled="close">

<head>

    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> 로그인 페이지 </title>
    <meta name="Description" content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
    <meta name="Author" content="Spruko Technologies Private Limited">
	<meta name="keywords" content="admin,admin dashboard,admin panel,admin template,bootstrap,clean,dashboard,flat,jquery,modern,responsive,premium admin templates,responsive admin,ui,ui kit.">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/login.css" rel="stylesheet" >
    <link rel="icon" href="${pageContext.request.contextPath }/resources/assets/images/brand-logos/favicon.ico" type="image/x-icon">

    <!-- Main Theme Js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/authentication-main.js"></script>

    <!-- Bootstrap Css -->
    <link id="style" href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

    <!-- Style Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/styles.min.css" rel="stylesheet" >

    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" >


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">

<style type="text/css">
body {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
}
/* .main-img { */
/*     position: absolute; */
/*     height: 7rem !important; */
/*     width: 20rem; */
/*     top: 10%; */
/*     left: 15%; */
/* } */
</style>
</head>

<body class="bg-white">


    <div class="row authentication mx-0">

        <div class="col-xxl-7 col-xl-7 col-lg-12">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-xxl-6 col-xl-7 col-lg-7 col-md-7 col-sm-8 col-12">
                    <div class="p-5">
                        <div class="mb-3">
                            <a href="/home">
                                <img src="${pageContext.request.contextPath }/resources/assets/logo/좌우조합형_black.png" alt="" class="authentication-brand desktop-logo main-img">
                                <img src="${pageContext.request.contextPath }/resources/assets/logo/좌우조합형_black.png" alt="" class="authentication-brand desktop-dark main-img">
                            </a>
                        </div>
                        <p class="h5 fw-semibold mb-2">로그인</p>
                        <p class="h5 fw-semibold mb-2">${error}</p>
                        <p class="mb-3 text-muted op-7 fw-normal">대덕 병원에 오신걸 환영합니다!</p>
                        
                        <div class="text-center my-5 authentication-barrier">
                            <span></span>
                        </div>
                        <div class="row gy-3">
	                        <form action="/login" method="post">
	                            <div class="col-xl-12 mt-0">
	                                <label for="signin-username" class="form-label text-default">아이디</label>
	                                <input type="text" class="form-control form-control-lg" id="memId" name="memId" placeholder="아이디">
	                            </div>
	                            <div class="col-xl-12 mb-3">
	                                <label for="signin-password" class="form-label text-default d-block">비밀번호</label>
	                                <div class="input-group">
	                                    <input type="password" class="form-control form-control-lg" id="memPw" name="memPw" placeholder="비밀번호">
	                                    <button class="btn btn-light" type="button" onclick="createpassword('memPw',this)" id="button-addon2"><i class="ri-eye-off-line align-middle"></i></button>
	                                </div>
	                                <div class="mt-2">
	                                    <div class="form-check">
	                                        <input class="form-check-input" type="checkbox" value="" name="remember-me" id="defaultCheck1">
	                                        <label class="form-check-label text-muted fw-normal" for="defaultCheck1">
	                                           		 로그인 정보 기억하기
	                                        </label>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="d-grid gap-2 mt-2">
								    <div class="d-flex">
								        <input type="submit" value="로그인" class="login_button" style="width: 50%; height: 40px; background-color: black; color: white; margin-right: 5px;">
									        <a href="${location }" style="display: flex; align-items: center; justify-content: center; width: 50%; height: 40px; border: 1px solid black;">
									            <img src="${pageContext.request.contextPath}/resources/assets/images/kakaoLogo/kakao_icon.png" alt="카카오" style="height: 20px; width: 20px; margin-right: 5px;">
									            	카카오로그인
									        </a>
								    </div>
								    <div class="btn-list">
									    <a href="/patient/findForm" class="btn btn-light">아이디 / 비밀번호 찾기</a>
									</div>
								</div>
                            <sec:csrfInput/>
							</form>
						</div>
                        </div>
                        <div class="text-center">
                            <p class="fs-12 text-muted mt-4">계정이 없으신가요? <a href="/patient/signup.do" class="text-primary">회원가입</a></p>
                        </div>
                    </div>
                </div>
            </div>
<!--         </div> -->
        <div class="col-xxl-5 col-xl-5 col-lg-5 d-xl-block d-none px-0">
            <div class="authentication-cover">
                <div class="aunthentication-cover-content rounded">
                    <div class="swiper keyboard-control">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="text-fixed-white text-center p-5 d-flex align-items-center justify-content-center">
                                    <div>
                                        <div class="mb-5">
                                        <img src="${pageContext.request.contextPath}/resources/img/main1.jpg"alt="">
                                        </div>
                                        <h6 class="fw-semibold text-fixed-white">대덕정형외과</h6>
                                        <p class="fw-normal fs-14 op-7"> 저희 병원은 성형외과 전문의와 정형외과 전문의가 모여 만든 외상병원입니다.
								                                                        안면부와 팔, 다리의 질환과 외상을 치료하고 있으며 특히 미세 현미경을 이용한 손가락 절단 환자의 재접합 수술을 하고 있습니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="text-fixed-white text-center p-5 d-flex align-items-center justify-content-center">
                                    <div>
                                        <div class="mb-5">
                                        <img src="https://img.freepik.com/free-photo/closeup-physiotherapist-s-hand-positioning-electrodes-patient-s-knee-hospital_662251-1760.jpg?t=st=1714790828~exp=1714794428~hmac=f8e90af0118e3137957ddfd7e060dcb059abbc87a760bb9f60b279c66d0c5929&amp;w=1380" class="authentication-image" alt="">
                                        </div>
                                        <h6 class="fw-semibold text-fixed-white">우리의 비전</h6>
                                        <p class="fw-normal fs-14 op-7"> 우리 정형외과는 환자 중심의 의료 서비스를 제공하여 모든 환자들이 건강하고 삶의
                                                        	질이 향상되도록 돕고 있습니다. 우리는 환자들의 건강과 행복을 최우선으로 생각하며 항상 환자들과 함께 하겠습니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="text-fixed-white text-center p-5 d-flex align-items-center justify-content-center">
                                    <div>
                                        <div class="mb-5">
                                        <img src="https://img.freepik.com/free-photo/close-up-medical-assistant-touching-tablet-display_482257-26977.jpg?t=st=1714790741~exp=1714794341~hmac=0af5d6079eec306df4bc3e49d6e7ff77799203f9bb115e8f82644056e33abe7d&amp;w=740" class="authentication-image" alt="">
                                        </div>
                                        <h6 class="fw-semibold text-fixed-white">전문가의 조언</h6>
                                        <p class="fw-normal fs-14 op-7"> 우리 정형외과는 정형외과 전문의들로 구성되어 있으며, 환자들에게 최고 수준의 의료서비스와 전문가의 조언을 제공합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Swiper JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.js"></script>

    <!-- Internal Sing-Up JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/authentication.js"></script>

    <!-- Show Password JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/show-password.js"></script>

</body>

</html>