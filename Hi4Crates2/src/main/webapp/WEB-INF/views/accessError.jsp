<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="vertical" data-vertical-style="overlay" data-theme-mode="light" data-header-styles="light" data-menu-styles="light" data-toggled="close">
<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> 접근 거부 </title>
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

<style type="text/css">
body {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
}
</style>
</head>
<body>
    <div class="page error-bg" id="particles-js">
        <!-- Start::error-page -->
        <div class="error-page">
            <div class="container">
                <div class="text-center p-5 my-auto">
                    <div class="row align-items-center justify-content-center h-100">
                        <div class="col-xl-7">
                            <p class="error-text mb-sm-0 mb-2">권한 부족</p>
                            <p class="fs-18 fw-semibold mb-3">저런 &#128557;,접근 권한이 부족합니다.</p>
                            <div class="row justify-content-center mb-5">
                                <div class="col-xl-6">
                                    <p class="mb-0 op-7">접근 권한이 부족해서 접근할 수 없습니다.</p>
                                </div>
                            </div>
                            <a href="/home" class="btn btn-primary"><i class="ri-arrow-left-line align-middle me-1 d-inline-block"></i>홈으로 돌아가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Particles JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/particles.js/particles.js"></script>

    <!-- Error JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/error.js"></script>

</body>

</html>