<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
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
    <link rel="icon" href="${pageContext.request.contextPath }/resources/assets/images/brand-logos/favicon.ico" type="image/x-icon">

    <!-- Main Theme Js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/authentication-main.js"></script>

    <!-- Bootstrap Css -->
    <link id="style" href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

    <!-- Style Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/styles.min.css" rel="stylesheet" >

    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" >

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.css">
<link href="${pageContext.request.contextPath }/resources/assets/css/login.css" rel="stylesheet" >
<style type="text/css">
body {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
}
.main-img{
    position: relative;
    height: 7rem !important;
    width: 20rem !important;
    top: 0% !important;
    left: -7% !important;
}
</style>
</head>

<body class="bg-white">


    <div class="row authentication mx-0">

        <div class="col-xxl-7 col-xl-7 col-lg-12">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-xxl-6 col-xl-7 col-lg-7 col-md-7 col-sm-8 col-12">
                    <div class="p-5">
                        <div class="mb-3">
                            <a href="index.html">
                               <img src="${pageContext.request.contextPath }/resources/assets/logo/좌우조합형_black.png" alt="" class="authentication-brand desktop-logo main-img">
                                <img src="${pageContext.request.contextPath }/resources/assets/logo/좌우조합형_black.png" alt="" class="authentication-brand desktop-dark main-img">
                            </a>
                        </div>
                        <p class="h5 fw-semibold mb-2">일반회원가입</p>
                        <p class="mb-3 text-muted op-7 fw-normal">대덕 병원에 오신걸 환영합니다!</p>
                        <div class="btn-list" style="text-align: center; height: 40px; display: flex; justify-content: center; align-items: center;">
	    					<a href="/patient/signup.do" class="btn btn-icon btn-light" style="line-height: 20px; white-space: nowrap; width: 200px; display: inline-block; text-align: center;">
							        회원가입
							</a>
						</div>
                        <div class="text-center my-5 authentication-barrier">
                            <span>OR</span>
                        </div>
                        <div class="row gy-3">
                        <form action="/public/" method="post">
                            <div class="col-xl-12 d-grid mt-2">
    							<button type="submit" class="" style="padding: 0; border: none; background: none;">
        							<img src="/resources/assets/images/kakaoLogo/kakao_login_medium_narrow.png" alt="로그인">
    							</button>
							</div>
<%--                             <sec:csrfInput/> --%>
                        </form>
                        </div>
                        <div class="text-center">
                            <p class="fs-12 text-muted mt-4">계정이 없으신가요? <a href="sign-up-cover.html" class="text-primary">회원가입</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xxl-5 col-xl-5 col-lg-5 d-xl-block d-none px-0">
            <div class="authentication-cover">
                <div class="aunthentication-cover-content rounded">
                    <div class="swiper keyboard-control">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="text-fixed-white text-center p-5 d-flex align-items-center justify-content-center">
                                    <div>
                                        <div class="mb-5">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/authentication/2.png" class="authentication-image" alt="">
                                        </div>
                                        <h6 class="fw-semibold text-fixed-white">Sign In</h6>
                                        <p class="fw-normal fs-14 op-7"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa eligendi expedita aliquam quaerat nulla voluptas facilis. Porro rem voluptates possimus, ad, autem quae culpa architecto, quam labore blanditiis at ratione.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="text-fixed-white text-center p-5 d-flex align-items-center justify-content-center">
                                    <div>
                                        <div class="mb-5">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/authentication/3.png" class="authentication-image" alt="">
                                        </div>
                                        <h6 class="fw-semibold text-fixed-white">Sign In</h6>
                                        <p class="fw-normal fs-14 op-7"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa eligendi expedita aliquam quaerat nulla voluptas facilis. Porro rem voluptates possimus, ad, autem quae culpa architecto, quam labore blanditiis at ratione.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="text-fixed-white text-center p-5 d-flex align-items-center justify-content-center">
                                    <div>
                                        <div class="mb-5">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/authentication/2.png" class="authentication-image" alt="">
                                        </div>
                                        <h6 class="fw-semibold text-fixed-white">Sign In</h6>
                                        <p class="fw-normal fs-14 op-7"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa eligendi expedita aliquam quaerat nulla voluptas facilis. Porro rem voluptates possimus, ad, autem quae culpa architecto, quam labore blanditiis at ratione.</p>
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