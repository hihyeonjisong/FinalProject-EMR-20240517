<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="vertical" data-theme-mode="light" data-header-styles="light" data-menu-styles="dark" data-toggled="close">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>

    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> YNEX - Bootstrap 5 Premium Admin &amp; Dashboard Template </title>
    <meta name="Description" content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
    <meta name="Author" content="Spruko Technologies Private Limited">
	<meta name="keywords" content="admin,admin dashboard,admin panel,admin template,bootstrap,clean,dashboard,flat,jquery,modern,responsive,premium admin templates,responsive admin,ui,ui kit.">

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath }/resources/assets/images/brand-logos/favicon.ico" type="image/x-icon">

    <!-- Choices JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

    <!-- Main Theme Js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

    <!-- Bootstrap Css -->
    <link id="style" href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

    <!-- Style Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/styles.min.css" rel="stylesheet" >

    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.css" rel="stylesheet" >

    <!-- Node Waves Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.css" rel="stylesheet" >

    <!-- Simplebar Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.css" rel="stylesheet" >

    <!-- Color Picker Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/themes/nano.min.css">

    <!-- Choices Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/choices.js/public/assets/styles/choices.min.css">

    <style>

    </style>
</head>

<body class="landing-body">
    <div class="landing-page-wrapper">
        <!-- 헤더 -->
        <aside class="app-sidebar sticky" id="sidebar" style="background-color: balck;">
            <div class="container-xl">
                <div class="main-sidebar">
                    <nav class="main-menu-container nav nav-pills sub-open">
                        <div class="landing-logo-container">
                            <div class="horizontal-logo">
                                <a href="index.html" class="header-logo">
                                    <img src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/asd.png" alt="logo" class="desktop-logo" style="width: 150px; height: auto;">
                                    <img src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/asd.png" alt="logo" class="desktop-white" style="width: 150px; height: auto;">
                                </a>
                            </div>
                        </div>
                        <div class="slide-left" id="slide-left"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"> <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"></path> </svg></div>
                        <ul class="main-menu">
                            <li class="slide">
                                <a href="#team" class="side-menu__item">
                                    <span class="side-menu__label" style="font-size: 30px; font-weight: 700; opacity: 0.8;">병원정보</span>
                                </a>
                            </li>
                            <li class="slide">
                                <a href="#team" class="side-menu__item">
                                    <span class="side-menu__label" style="font-size: 30px; font-weight: 700; opacity: 0.8;">진료예약</span>
                                </a>
                            </li>
                            <li class="slide">
                                <a href="#testimonials" class="side-menu__item">
                                    <span class="side-menu__label" style="font-size: 30px; font-weight: 700; opacity: 0.8;">오시는길</span>
                                </a>
                            </li>
                            <li class="slide">
                                <a href="#team" class="side-menu__item">
                                    <span class="side-menu__label" style="font-size: 30px; font-weight: 700; opacity: 0.8;">공지사항</span>
                                </a>
                            </li>
                        </ul>
                        <div style="display: flex; justify-content: space-between;">
						    <div style="cursor: pointer; padding: 10px; border-radius: 5px;">
						        <a href="/login">
						            <span class="side-menu__label" style="font-size: 15px; font-weight: 700; opacity: 0.8;">로그인</span>
						        </a>
						    </div>
						    <div style="cursor: pointer; padding: 10px; border-radius: 5px;">
						        <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModalLg">
						            <span class="side-menu__label" style="font-size: 15px; font-weight: 700; opacity: 0.8;">회원가입</span>
						        </a>
						    </div>
						    <div style="cursor: pointer; padding: 10px; border-radius: 5px;">
						        <a href="/public/admin/main">
						            <span class="side-menu__label" style="font-size: 15px; font-weight: 700; opacity: 0.8;">직원전용</span>
						        </a>
						    </div>
						</div>
                    </nav>
                </div>
            </div>
        </aside>
        <!-- 헤더 끝 -->

        <!-- 메인 시작 -->
        <div class="main-content app-content">
            <div class="" id="home">
                <section class="section">
                    <div class="container-fluid">
                        <div class="row mb-5">
                            <div class="col-xl-4">
                                <h2 class="fw-semibold text-center"></h2>
                            </div>
                            <div class="col-xl-3">
                                <h2 class="fw-semibold text-center"> 마이페이지 </h2>
                                <p class="text-muted text-center"></p>
                            </div>
                            <div class="col-xl-4">
                                <h2 class="fw-semibold text-center"></h2>
                            </div>
                            <div class="col-xl-12">
                                <div class="tab-content" id="myTabContent1">
                                    <div class="tab-pane show active p-0 border-0" id="pricing-monthly1-pane"
                                        role="tabpanel" aria-labelledby="pricing-monthly1" tabindex="0">
                                        <div class="row">
                                            <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                                <div class="card custom-card overflow-hidden">
                                                    <div class="card-body p-0">
                                                        <div class="px-1 py-2 bg-success op-3"></div>
                                                        <div class="p-4">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="fs-18 fw-semibold" style="font-size: 25px;">
                                                                    진료예약확인</div>
                                                            </div>
                                                            <div class="fs-25 fw-bold mb-1"><sub
                                                                    class="text-muted fw-semibold fs-11 ms-1"></sub>
                                                            </div>
                                                            <div class="mb-1 text-muted"></div>
                                                            <div class="fs-12 mb-3"></div>
                                                            <table class="table table-hover text-nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">진료번호</th>
                                                                        <th scope="col">날짜</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:choose>
                                                                        <c:when test="${empty reserList}">
                                                                            <tr>
                                                                                <td colspan="2">진료 예약 기록이 존재하지 않습니다.
                                                                                </td>
                                                                            </tr>
                                                                            <!-- 빈 요소 추가하여 크기 유지 -->
                                                                            <c:forEach begin="1" end="6"
                                                                                varStatus="emptyRow">
                                                                                <tr>
                                                                                    <td>&nbsp;</td>
                                                                                    <td>&nbsp;</td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach var="reservation"
                                                                                items="${reserList}" varStatus="loop">
                                                                                <tr>
                                                                                    <td>${reservation.reservNo}</td>
                                                                                    <td>${reservation.reservDate}</td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            <!-- 리스트 크기가 6 미만일 때만 빈 요소 추가 -->
                                                                            <c:if test="${reserList.size() lt 6}">
                                                                                <c:forEach begin="1"
                                                                                    end="${6 - reserList.size()}"
                                                                                    varStatus="emptyRow">
                                                                                    <tr>
                                                                                        <td>&nbsp;</td>
                                                                                        <td>&nbsp;</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                                <div class="card custom-card overflow-hidden">
                                                    <div class="card-body p-0">
                                                        <div class="px-1 py-2 bg-success op-3"></div>
                                                        <div class="p-4">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="fs-18 fw-semibold">서류발급</div>
                                                                <div>
                                                                    <span class="badge bg-success-transparent">For
                                                                        Indivudials</span>
                                                                </div>
                                                            </div>
                                                            <div class="fs-25 fw-bold mb-1">$0<sub
                                                                    class="text-muted fw-semibold fs-11 ms-1">/ Per
                                                                    Month</sub></div>
                                                            <div class="mb-1 text-muted">Lorem ipsum dolor sit amet
                                                                consectetur adipisicing elit. Iure quos debitis aliquam
                                                                .</div>
                                                            <div class="fs-12 mb-3"><u>Billed Monthly</u></div>
                                                            <ul class="list-unstyled mb-0">
                                                                <li class="d-flex align-items-center mb-3">
                                                                    <span class="me-2">
                                                                        <i
                                                                            class="ri-checkbox-circle-line fs-15 text-success"></i>
                                                                    </span>
                                                                    <span>
                                                                        <strong class="me-1 d-inline-block">2
                                                                            Free</strong>Websites
                                                                    </span>
                                                                </li>
                                                                <li class="d-flex align-items-center mb-3">
                                                                    <span class="me-2">
                                                                        <i
                                                                            class="ri-checkbox-circle-line fs-15 text-success"></i>
                                                                    </span>
                                                                    <span>
                                                                        <strong class="me-1 d-inline-block">1
                                                                            GB</strong>Hard disk storage
                                                                    </span>
                                                                </li>
                                                                <li class="d-flex align-items-center mb-3">
                                                                    <span class="me-2">
                                                                        <i
                                                                            class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
                                                                    </span>
                                                                    <span>
                                                                        <strong class="me-1 d-inline-block">1
                                                                            Year</strong>Email support
                                                                    </span>
                                                                </li>
                                                                <li class="d-flex align-items-center mb-3">
                                                                    <span class="me-2">
                                                                        <i
                                                                            class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
                                                                    </span>
                                                                    <span>
                                                                        <strong
                                                                            class="me-1  d-inline-block">2</strong>Licenses
                                                                    </span>
                                                                </li>
                                                                <li class="d-flex align-items-center mb-3">
                                                                    <span class="me-2">
                                                                        <i
                                                                            class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
                                                                    </span>
                                                                    <span>
                                                                        Custom SEO optimizataion
                                                                    </span>
                                                                </li>
                                                                <li class="d-flex align-items-center mb-3">
                                                                    <span class="me-2">
                                                                        <i
                                                                            class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
                                                                    </span>
                                                                    <span>
                                                                        Chat Support
                                                                    </span>
                                                                </li>
                                                                <li class="d-grid">
                                                                    <button class="btn btn-light btn-wave">Choose
                                                                        Plan</button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                                <div class="card custom-card overflow-hidden">
                                                    <div class="card-body p-0">
                                                        <div class="px-1 py-2 bg-success op-3"></div>
                                                        <div class="p-4">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="fs-18 fw-semibold" style="font-size: 25px;">
                                                                    회원정보수정</div>
                                                            </div>
                                                            <div class="fs-25 fw-bold mb-1"><sub
                                                                    class="text-muted fw-semibold fs-11 ms-1"></sub>
                                                            </div>
                                                            <div class="mb-1 text-muted"></div>
                                                            <div class="fs-12 mb-3">
                                                                <p>회원정보 수정을 원하시거나 비밀번호 변경을 원하실 경우 아래의 버튼을 클릭해주세요.</p>
                                                            </div>

                                                            <!-- 버튼들을 가운데 정렬하기 위해 추가된 코드 -->
                                                            <div class="d-flex justify-content-center">
                                                                <!-- 첫 번째 버튼 -->
                                                                <a class="btn btn-primary me-2" data-bs-toggle="modal"
                                                                    data-bs-target="#formmodal">회원정보 수정</a>
                                                                <div class="modal fade" id="formmodal" tabindex="-1"
                                                                    aria-labelledby="exampleModalLabel"
                                                                    aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h6 class="modal-title"
                                                                                    id="exampleModalLabel">회원정보 수정</h6>
                                                                                <button type="button" class="btn-close"
                                                                                    data-bs-dismiss="modal"
                                                                                    aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <form>
                                                                                    <div class="mb-3">
                                                                                        <label for="recipient-name"
                                                                                            class="col-form-label">비밀번호를
                                                                                            입력해주세요.</label>
                                                                                        <input type="text"
                                                                                            class="form-control"
                                                                                            id="writePw">
                                                                                        <div class="invalid-feedback">
                                                                                            *비밀번호가 일치하지않습니다.</div>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                    class="btn btn-primary" id="checkPw"
                                                                                    onclick="">
                                                                                    확인
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- 두 번째 버튼 -->
                                                                <a href="/pAccount/checkPw"
                                                                    class="btn btn-secondary">비밀번호 변경</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                                <div class="card custom-card overflow-hidden">
                                                    <div class="card-body p-0">
                                                        <div class="px-1 py-2 bg-success op-3"></div>
                                                        <div class="p-4">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="fs-18 fw-semibold" style="font-size: 25px;">
                                                                    상담내역</div>
                                                            </div>
                                                            <div class="fs-25 fw-bold mb-1">
                                                                <sub class="text-muted fw-semibold fs-11 ms-1"></sub>
                                                            </div>
                                                            <div class="mb-1 text-muted"></div>
                                                            <div class="fs-12 mb-3"></div>
                                                            <table class="table table-hover text-nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">상담번호</th>
                                                                        <th scope="col">상담제목</th>
                                                                        <th scope="col">작성일자</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:choose>
                                                                        <c:when test="${empty CounsList}">
                                                                            <tr>
                                                                                <td colspan="3">상담내역이 없습니다.</td>
                                                                            </tr>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach var="counsel"
                                                                                items="${CounsList}" varStatus="loop">
                                                                                <tr>
                                                                                    <td>${counsel.counselNo}</td>
                                                                                    <td><a
                                                                                            href="/counsel/detail?counselNo=${counsel.counselNo}">${counsel.counselTitle}</a>
                                                                                    </td>
                                                                                    <td>${counsel.counselDate}</td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            <!-- 만약 리스트 크기가 6보다 작다면 빈 행을 삽입 -->
                                                                            <c:if test="${CounsList.size() lt 6}">
                                                                                <c:forEach begin="1"
                                                                                    end="${6 - CounsList.size()}"
                                                                                    varStatus="emptyRow">
                                                                                    <tr>
                                                                                        <td colspan="3">&nbsp;</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                                <div class="card custom-card overflow-hidden">
                                                    <div class="card-body p-0">
                                                        <div class="px-1 py-2 bg-success op-3"></div>
                                                        <div class="p-4">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="fs-18 fw-semibold" style="font-size: 25px;">
                                                                    서비스평가</div>
                                                            </div>
                                                            <div class="fs-25 fw-bold mb-1">
                                                                <sub class="text-muted fw-semibold fs-11 ms-1"></sub>
                                                            </div>
                                                            <div class="mb-1 text-muted"></div>
                                                            <div class="fs-12 mb-3"></div>
                                                            <table class="table table-hover text-nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">담당의사</th>
                                                                        <th scope="col">진료일</th>
                                                                        <th scope="col">평가여부</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:choose>
                                                                        <c:when test="${empty EvaluList}">
                                                                            <tr>
                                                                                <td colspan="3">진료기록이 없습니다.</td>
                                                                            </tr>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach var="EvaluList"
                                                                                items="${EvaluList}" varStatus="loop">
                                                                                <tr>
                                                                                    <td>${EvaluList.memName}</td>
                                                                                    <td>${EvaluList.receiptDate}</td>
                                                                                    <td>
                                                                                        <c:choose>
                                                                                            <c:when
                                                                                                test="${empty EvaluList.evlScore or EvaluList.evlScore eq 0}">
                                                                                                <%-- <a
                                                                                                    href="/star/plusStar?memNo=${EvaluList.patntNo}"
                                                                                                    style="display: inline-block; padding: 5px 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f0f0f0; text-decoration: none; color: #333;">평가하기</a>
                                                                                                    --%>
                                                                                                    <a class="modal-effect btn btn-primary d-grid mb-3"
                                                                                                        data-bs-effect="effect-scale"
                                                                                                        data-bs-toggle="modal"
                                                                                                        href="#modaldemo8">평가하기</a>
                                                                                                    <div class="modal fade"
                                                                                                        id="modaldemo8">
                                                                                                        <div class="modal-dialog modal-dialog-centered text-center"
                                                                                                            role="document">
                                                                                                            <div
                                                                                                                class="modal-content modal-content-demo">
                                                                                                                <div
                                                                                                                    class="modal-header">
                                                                                                                    <h6
                                                                                                                        class="modal-title">
                                                                                                                        서비스를
                                                                                                                        평가해주세요.
                                                                                                                    </h6>
                                                                                                                    <button
                                                                                                                        aria-label="Close"
                                                                                                                        class="btn-close"
                                                                                                                        data-bs-dismiss="modal"></button>
                                                                                                                </div>
                                                                                                                <div
                                                                                                                    class="modal-body text-start">
                                                                                                                    <form
                                                                                                                        action="/star/plusStar?receiptNo=8"
                                                                                                                        method="post"
                                                                                                                        id="signupForm"
                                                                                                                        enctype="multipart/form-data">
                                                                                                                        <div
                                                                                                                            class="row gy-3">
                                                                                                                            <div
                                                                                                                                class="col-xl-12">
                                                                                                                                <div>
                                                                                                                                    별점주기
                                                                                                                                </div>
                                                                                                                                <div
                                                                                                                                    id="rater-basic">
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                            <div
                                                                                                                                class="col-xl-12">
                                                                                                                                <label
                                                                                                                                    for="comment"
                                                                                                                                    class="form-label text-default"
                                                                                                                                    style="margin-top: 1em;">한
                                                                                                                                    줄평</label>
                                                                                                                                <div
                                                                                                                                    class="input-group">
                                                                                                                                    <input
                                                                                                                                        type="hidden"
                                                                                                                                        id="rate"
                                                                                                                                        name="evlScore" />
                                                                                                                                    <textarea
                                                                                                                                        class="form-control form-control-lg"
                                                                                                                                        style="height: 100px;"
                                                                                                                                        id="comment"
                                                                                                                                        name="evlContent"
                                                                                                                                        placeholder="한 줄평을 입력해주세요"></textarea>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </form>
                                                                                                                </div>
                                                                                                                <div
                                                                                                                    class="modal-footer">
                                                                                                                    <button
                                                                                                                        class="btn btn-primary"
                                                                                                                        type="button"
                                                                                                                        onclick="validateAndSubmit()">확인</button>
                                                                                                                    <button
                                                                                                                        class="btn btn-light"
                                                                                                                        data-bs-dismiss="modal">취소</button>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                평가완료
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            <!-- 만약 리스트 크기가 6보다 작다면 빈 행을 삽입 -->
                                                                            <c:if test="${EvaluList.size() lt 6}">
                                                                                <c:forEach begin="1"
                                                                                    end="${6 - EvaluList.size()}"
                                                                                    varStatus="emptyRow">
                                                                                    <tr>
                                                                                        <td colspan="3">&nbsp;</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                                <div class="card custom-card overflow-hidden">
                                                    <div class="card-body p-0">
                                                        <div class="px-1 py-2 bg-success op-3"></div>
                                                        <div class="p-4">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mb-3">
                                                                <div class="fs-18 fw-semibold" style="font-size: 25px;">
                                                                    회원탈퇴</div>
                                                            </div>
                                                            <div class="fs-25 fw-bold mb-1"><sub
                                                                    class="text-muted fw-semibold fs-11 ms-1"></sub>
                                                            </div>
                                                            <div class="mb-1 text-muted"></div>
                                                            <div class="fs-12 mb-3">
                                                                <p>회원 서비스를 이용하지 않으실 경우 아래의 버튼을 클릭해 주세요.</p>
                                                            </div>
                                                            <ul class="list-unstyled mb-0">
                                                            </ul>
                                                            <div class="modal-footer d-flex justify-content-center">
                                                                <a class="btn btn-primary"
                                                                    href="/pAccount/deleteAccountCheckPw?memNo=113">
                                                                    회원탈퇴
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
                </section>
            </div>
        </div>
    </div>
    
    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

    <!-- Popper JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Defaultmenu JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/defaultmenu.min.js"></script>

    <!-- Node Waves JS-->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>

    <!-- Sticky JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/sticky.js"></script>

    <!-- Simplebar JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/simplebar.js"></script>

    <!-- Color Picker JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>


    
    <!-- Custom-Switcher JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/custom-switcher.min.js"></script>

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/custom.js"></script>

	<script src="/resources/assets/libs/rater-js/index.js"></script>

	<!-- Internal Ratings JS -->
	<script src="/resources/assets/js/ratings.js"></script>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $("#checkPw").click(function(){
        var inputValue = $("#writePw").val();
        console.log(inputValue);
        let data = { 
            memPw: inputValue,
            memNo: 4
        };
        $.ajax({
            url: "/pAccount/check.do",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(response) {
                console.log("요청이 성공했습니다.");
                console.log(response);
                let notCorrectPw = $('#notCorrectPw'); // 선택자 수정
                if(response) {
                    location.href="http://localhost/pAccount/update.do?memNo=" + 4;
                } else {
                    $('#writePw').addClass("is-invalid");
                }
            },
            error: function(xhr, status, error) {
                console.error("요청이 실패했습니다: " + error);
            }
        });
    });
});


let raterBasic = $('#rater-basic');
let rating = "";
raterBasic.click(function(){
	rating = $(this).data('rating');
	let rate = $('#rate');
	console.log(rating);
	rate.val(rating);
});

//확인 버튼을 클릭할 때 실행되는 함수를 정의합니다.
function validateAndSubmit() {
    // 모달 내의 입력 필드에서 값을 가져옵니다.
    var commentValue = document.getElementById('comment').value.trim();
    var raterValue = document.getElementById('rater-basic').innerText.trim();
    
    // 입력 필드가 모두 비어 있는지 확인합니다.
    if (commentValue === '') {
        // 만약 입력 필드 중 하나라도 비어 있다면, 경고 메시지를 표시합니다.
        alert('평가하지 않은 항목이 있습니다.');
    } else {
        // 입력 필드가 모두 채워져 있다면, 폼을 제출합니다.
        document.getElementById('signupForm').submit();
    }
}
</script>
</html>