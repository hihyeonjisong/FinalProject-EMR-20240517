<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="horizontal" data-nav-style="menu-click" data-menu-position="fixed" data-theme-mode="light">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            
            .side-menu__label {
             color:white !important	; 
            }
/* 	            .container-xl { */
/* 	  overflow-x: hidden; /* 가로 스크롤을 숨김 */ */
/* 	} */

        </style>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> YNEX - Bootstrap 5 Premium Admin & Dashboard Template </title>
    <meta name="Description" content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
    <meta name="Author" content="Spruko Technologies Private Limited">

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath }/resources/assets/images/brand-logos/favicon.ico" type="image/x-icon">

    <!-- Bootstrap Css -->
    <link id="style" href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

    <!-- Style Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" >

    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.css" rel="stylesheet" >

    <!-- Node Waves Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.css" rel="stylesheet" >

    <!-- SwiperJS Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.css">

    <!-- Color Picker Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/themes/nano.min.css">

    <!-- Choices Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/styles/choices.min.css">

    <script>
        if(localStorage.ynexlandingdarktheme){
            document.querySelector("html").setAttribute("data-theme-mode","dark")
        }
        if(localStorage.ynexlandingrtl){
            document.querySelector("html").setAttribute("dir","rtl")
            document.querySelector("#style").setAttribute("href", "${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.rtl.min.css");
        }
    </script>
	
	<!-- 예약 확인 메시지 -->
	<script>
    var urlParams = new URLSearchParams(window.location.search);
    var successMessage = urlParams.get('successMessage');
    if (successMessage) {
        alert(successMessage);
    }

    var errorMessage = urlParams.get('errorMessage');
    if (errorMessage) {
        alert(errorMessage);
    }
</script>
</head>

<body class="landing-body">
	<!-- 예약확인 알러트창 -->
	<!-- 예약 성공 메시지 -->
	<!-- 모달 -->
	<div class="modal fade" id="exampleModalLg" tabindex="-1" aria-labelledby="exampleModalLgLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLgLabel" style="text-align: center;">회원가입
                    </h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
    
                    <div class="container mt-5">
                        <div class="row justify-content-center">
                            <div class="col-md-4 text-center mb-4">
                            <a href="/signup">
                                <img src="${pageContext.request.contextPath }/resources/assets/img/doctor.png" class="img-fluid mb-3" style="max-width: 200px;" alt="의료진">
                            </a>
                                <p class="mb-0">의료진</p>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-md-4 text-center mb-4">
                            <a href="/patient/signup.do">
                                <img src="${pageContext.request.contextPath }/resources/assets/img/patient.png" class="img-fluid mb-3" style="max-width: 200px;" alt="환자">
                            </a>
                                <p class="mb-0">환자</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Start Switcher -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="switcher-canvas" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title" id="offcanvasRightLabel">Switcher</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="">
                <p class="switcher-style-head">Theme Color Mode:</p>
                <div class="row switcher-style">
                    <div class="col-4">
                        <div class="form-check switch-select">
                            <label class="form-check-label" for="switcher-light-theme">
                                Light
                            </label>
                            <input class="form-check-input" type="radio" name="theme-style" id="switcher-light-theme"
                                checked>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-check switch-select">
                            <label class="form-check-label" for="switcher-dark-theme">
                                Dark
                            </label>
                            <input class="form-check-input" type="radio" name="theme-style" id="switcher-dark-theme">
                        </div>
                    </div>
                </div>
            </div>
            <div class="">
                <p class="switcher-style-head">Directions:</p>
                <div class="row switcher-style">
                    <div class="col-4">
                        <div class="form-check switch-select">
                            <label class="form-check-label" for="switcher-ltr">
                                LTR
                            </label>
                            <input class="form-check-input" type="radio" name="direction" id="switcher-ltr" checked>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-check switch-select">
                            <label class="form-check-label" for="switcher-rtl">
                                RTL
                            </label>
                            <input class="form-check-input" type="radio" name="direction" id="switcher-rtl">
                        </div>
                    </div>
                </div>
            </div>
            <div class="theme-colors">
                <p class="switcher-style-head">Theme Primary:</p>
                <div class="d-flex align-items-center switcher-style">
                    <div class="form-check switch-select me-3">
                        <input class="form-check-input color-input color-primary-1" type="radio"
                            name="theme-primary" id="switcher-primary">
                    </div>
                    <div class="form-check switch-select me-3">
                        <input class="form-check-input color-input color-primary-2" type="radio"
                            name="theme-primary" id="switcher-primary1">
                    </div>
                    <div class="form-check switch-select me-3">
                        <input class="form-check-input color-input color-primary-3" type="radio" name="theme-primary"
                            id="switcher-primary2">
                    </div>
                    <div class="form-check switch-select me-3">
                        <input class="form-check-input color-input color-primary-4" type="radio" name="theme-primary"
                            id="switcher-primary3">
                    </div>
                    <div class="form-check switch-select me-3">
                        <input class="form-check-input color-input color-primary-5" type="radio" name="theme-primary"
                            id="switcher-primary4">
                    </div>
                    <div class="form-check switch-select me-3 ps-0 mt-1 color-primary-light">
                        <div class="theme-container-primary"></div>
                        <div class="pickr-container-primary"></div>
                    </div>
                </div>
            </div>
            <div>
                <p class="switcher-style-head">reset:</p>
                <div class="text-center">
                    <button id="reset-all" class="btn btn-danger mt-3">Reset</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Switcher -->

    <div class="landing-page-wrapper">

         <!-- app-header -->
        <header class="app-header">
		

        </header>
        <!-- /app-header -->

        <!-- 헤더 -->
        <%@ include file="patientHeader.jsp" %>
        
        <!-- End::app-sidebar -->

        <!-- Start::app-content -->
    <div id="imageContainer" style=" width: 100vw; height: 100vh; overflow: hidden;">
        <img id="currentImage" src="" alt="" style="width: 100%; height: 100%; object-fit: cover;">
    </div>

            <!-- Start:: Section-1 -->
            
            <!-- Start:: Section-11 -->
            <section class="section landing-footer text-fixed-white">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-12 mb-md-0 mb-3">
                            <div class="px-4">
                                <p class="fw-semibold mb-3"><a href="index.html"><img src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/desktop-dark.png" alt=""></a></p>
                                <p class="mb-2 op-6 fw-normal">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Reprehenderit et magnam, fuga est mollitia eius, quo illum illo inventore optio aut quas omnis rem. Dolores accusantium aspernatur minus ea incidunt.
                                </p>
                                <p class="mb-0 op-6 fw-normal">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem ea esse ad</p>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12">
                            <div class="px-4">
                                <h6 class="fw-semibold mb-3 text-fixed-white">PAGES</h6>
                                <ul class="list-unstyled op-6 fw-normal landing-footer-list">
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Email</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Profile</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Timeline</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Projects</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Contacts</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Portfolio</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-6 col-12">
                            <div class="px-4">
                                <h6 class="fw-semibold text-fixed-white">INFO</h6>
                                <ul class="list-unstyled op-6 fw-normal landing-footer-list">
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Our Team</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Contact US</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">About</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Services</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Blog</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white">Terms & Conditions</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-12">
                            <div class="px-4">
                                <h6 class="fw-semibold text-fixed-white">CONTACT</h6>
                                <ul class="list-unstyled fw-normal landing-footer-list">
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white op-6"><i class="ri-home-4-line me-1 align-middle"></i> New York, NY 10012, US</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white op-6"><i class="ri-mail-line me-1 align-middle"></i> info@fmail.com</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white op-6"><i class="ri-phone-line me-1 align-middle"></i> +(555)-1920 1831</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="text-fixed-white op-6"><i class="ri-printer-line me-1 align-middle"></i> +(123) 1293 123</a>
                                    </li>
                                    <li class="mt-3">
                                        <p class="mb-2 fw-semibold op-8">FOLLOW US ON :</p>
                                        <div class="mb-0">
                                            <div class="btn-list">
                                                <button class="btn btn-sm btn-icon btn-primary-light btn-wave waves-effect waves-light">
                                                    <i class="ri-facebook-line fw-bold"></i>
                                                </button>
                                                <button class="btn btn-sm btn-icon btn-secondary-light btn-wave waves-effect waves-light">
                                                    <i class="ri-twitter-x-line fw-bold"></i>
                                                </button>
                                                <button class="btn btn-sm btn-icon btn-warning-light btn-wave waves-effect waves-light">
                                                    <i class="ri-instagram-line fw-bold"></i>
                                                </button>
                                                <button class="btn btn-sm btn-icon btn-success-light btn-wave waves-effect waves-light">
                                                    <i class="ri-github-line fw-bold"></i>
                                                </button>
                                                <button class="btn btn-sm btn-icon btn-danger-light btn-wave waves-effect waves-light">
                                                    <i class="ri-youtube-line fw-bold"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End:: Section-11 -->
			
            <div class="text-center landing-main-footer py-3">
                <span class="text-muted fs-15"> Copyright © <span id="year"></span> <a
                    href="javascript:void(0);" class="text-primary fw-semibold"><u>ynex</u></a>.
                Designed with <span class="fa fa-heart text-danger"></span> by <a href="javascript:void(0);" class="text-primary fw-semibold"><u>
                Spruko</u>
                </a> All
                rights
                reserved
                </span>
            </div>

        <!-- End::app-content -->

    </div>

    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>

    <!-- Popper JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Color Picker JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>

    <!-- Choices JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

    <!-- Swiper JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.js"></script>

    <!-- Defaultmenu JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/defaultmenu.min.js"></script>

    <!-- Internal Landing JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/landing.js"></script>

    <!-- Node Waves JS-->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>

    <!-- Sticky JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/sticky.js"></script>

</body>
<script>
// 	var memNo = ${sessionScope.user.member.memNo};
    var images = [
    	"${pageContext.request.contextPath }/resources/assets/images/media/landing/next_image1.jpg",
    	"${pageContext.request.contextPath }/resources/assets/images/media/landing/hospital3.jpg",
//     	"${pageContext.request.contextPath }/resources/assets/images/media/landing/next_image2.jpg",
    	"${pageContext.request.contextPath }/resources/assets/images/media/landing/next_image3.jpg",
    ];
    var currentIndex = 0; // 현재 이미지 인덱스

    // 이미지 변경 함수
    function changeImage() {
        var currentImage = document.getElementById("currentImage");
        var nextIndex = (currentIndex + 1) % images.length; // 다음 이미지 인덱스 계산

        // 새 이미지 객체 생성
        var nextImage = new Image();
        nextImage.src = images[nextIndex];
        nextImage.alt = "";

        // 새 이미지가 로드되면 페이드 아웃 및 줌 아웃 효과 적용
        nextImage.onload = function() {
            // 페이드 아웃 및 줌 아웃 효과 적용
            currentImage.style.opacity = 0; // 페이드 아웃
            currentImage.style.transform = "scale(1.2)"; // 줌 아웃 효과

            // 이미지 교체
            setTimeout(function() {
                currentImage.src = nextImage.src;
                // 페이드 인 및 줌 인 효과 적용
                setTimeout(function() {
                    currentImage.style.opacity = 1; // 페이드 인
                    currentImage.style.transform = "scale(1)"; // 줌 인 효과
                }, 0); // 페이드 인 및 줌 인 효과 즉시 적용
                currentIndex = nextIndex; // 현재 이미지 인덱스 업데이트
            }, 0); // 이미지 변경 즉시 교체
        };
    }

    // 초기 이미지에 대해서도 동일한 효과 적용을 위해 초기에 함수 호출
    changeImage();

    // 이미지 변경 주기 설정
    setInterval(changeImage, 3000); // 3초마다 이미지 변경
    
    
</script>
</html>