<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.v-line {
  border-left :  solid white; 
  height : 100px;
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
			<div class="main-content app-content">
				<div class="container-fluid" style="margin-right: 77px;">
				<section>			
					<div id="imageContainer"
						style="margin-bottom: 5px; width: 100vw; height: 100vh;">
					<div class="row mb-5">
						<div class="col-xl-4">
							<h2 class="fw-semibold text-center"></h2>
						</div>
						<div class="col-xl-3">
							<h2 class="fw-semibold text-center"></h2>
							<p class="text-muted text-center"></p>
						</div>
						<div class="col-xl-4">
							<h2 class="fw-semibold text-center"></h2>
						</div>
						<div class="col-xl-12">
							<div class="tab-content" id="myTabContent1">
								<div class="tab-pane show active p-0 border-0"
									id="pricing-monthly1-pane" role="tabpanel"
									aria-labelledby="pricing-monthly1">
									
								<div class="container">
								<c:set var="session" value="${sessionScope.user.member }" />
								    <div class="row justify-content-center">
								        <div class="col-xxl-10 col-xl-10 col-lg-10 col-md-10 col-sm-12" style="margin-top: 50px;">
								        <div class="d-flex align-items-top p-4 border-bottom-0 main-profile-cover1"
								        style="background-color: rgb(166, 223, 255, 0.8); border-radius: 100px;">
										    <!-- 첫 번째 열 -->
										    <div class="col-xl-5">
										        <div class="d-flex align-items-top p-4 border-bottom-0 main-profile-cover1" >
										            <div>
										                <span class="avatar avatar-xxl me-3">
										                    <img src="${pageContext.request.contextPath }/resources/assets/img/patient.png" alt=""
										                    style="margin-top: 40px;">
										                </span>
										            </div>
										            <div class="flex-fill main-profile-info">
										                <div class="d-flex align-items-center justify-content-between">
										                    <h6 class="fw-semibold mb-1 text-fixed-black" style="font-size: 25px; margin-top:30px;">${session.memName }</h6>
										                </div>
										                <p class="mb-1 text-muted text-fixed-black op-7" style="font-size: 20px;"><i class="bi bi-person"></i> ${session.memId}</p>
										                <p class="fs-12 text-fixed-black mb-4 op-5">  
										                    <span class="me-3" style="font-size: 20px;"><i class="ri-mail-line me-1 align-middle"></i>${ session.memEmail}</span> 
										                </p>
										                
										            </div>
										        </div>
										    </div>
										    <div class='v-line' style='margin-top: 40px; height:130px;'></div>
										    <!-- 두 번째 열 -->
										    <div class="col-xl-3" style="padding-left: 10px;">
										        <!-- 요소들을 이곳에 배치합니다 -->
										        <div class="mb-0">
										                    <div class="me-4">
										                        <p class="fw-bold fs-20 text-fixed-black text-shadow mb-0" style="margin-top: 30px;">최근진료일</p>
										                    </div>
										                    <div class="me-4">
										                        <p class="fw-bold fs-20 text-fixed-white text-shadow mb-0">${recentReservation.reservDate} </p>
										                    </div>
										                    <div class="me-4">
										                        <p class="fw-bold fs-20 text-fixed-black text-shadow mb-0" style="margin-top: 15px;">방문예정일</p>
										                        <p class="fw-bold fs-20 text-fixed-white text-shadow mb-0">${willVisit.reservDate} </p>
										                    </div>
										                </div>
										    </div>
										    <div class='v-line' style="margin-top: 40px; height:130px;"></div>
										    <!-- 세 번째 열 -->
										    <div class="col-xl-4" style="margin-top: 23px;"> 
										        <!-- 요소들을 이곳에 배치합니다 -->
										        <div class="d-flex justify-content-center" style="margin-top: 10px;">
																	<!-- 첫 번째 버튼 -->
																	<a class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#formmodal" style=" 15px;margin-right: 0px;">회원정보 수정</a>
																	<div class="modal fade" id="formmodal" tabindex="-1"
																		aria-labelledby="exampleModalLabel" aria-hidden="true">
																		<div class="modal-dialog">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h6 class="modal-title" id="exampleModalLabel">회원정보수정</h6>
																					<button type="button" class="btn-close"
																						data-bs-dismiss="modal" aria-label="Close"></button>
																				</div>
																				<div class="modal-body">
																					<form>
																						<div class="mb-3">
																							<label for="recipient-name" class="col-form-label">비밀번호를입력해주세요.</label>
																							<input type="text" class="form-control"id="writePw">
																							<div class="invalid-feedback">*비밀번호가 일치하지 않습니다.</div>
																						</div>
																					</form>
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-primary"
																						id="checkPw" onclick="">확인</button>
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- 두 번째 버튼 -->
																</div>
																<div class="d-flex justify-content-center">
																	<a href="/pAccount/checkPw" class="btn btn-primary me-2" style="margin-top: 15px;">비밀번호변경</a>
																</div>
																<div class="d-flex justify-content-center">
<!-- 																	<div class="modal-footer d-flex justify-content-center"> -->
																	
																	<a class="btn btn-primary me-2"
																		href="/pAccount/deleteAccountCheckPw?memNo=${sessionScope.user.member.memNo }"
																		style="border-top-width: 0px; width: 112px; margin-top: 15px;">
																		회원탈퇴 
																	</a>
																	
<!-- 																	</div> -->
																</div>
										    </div>
										</div>

											<div class="row">
												<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-12" style="margin-top: 50px;">
													<div class="card custom-card overflow-hidden">
														<div class="card-body p-0">
															<div class="px-1 py-2" style="background-color: #aee3f9;"></div>
															<div class="p-4">
																<div
																	class="d-flex justify-content-between align-items-center mb-3">
																	<div class="fs-18 fw-semibold" style="font-size: 25px;">
																		<i class="bi bi-caret-right-fill"></i> 진료예약확인</div>
																</div>
																<div class="fs-25 fw-bold mb-1">
																	<sub class="text-muted fw-semibold fs-11 ms-1"></sub>
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
																						<td colspan="2">진료 예약 기록이 존재하지 않습니다.</td>
																					</tr>
																					<!-- 빈 요소 추가하여 크기 유지 -->
																					<c:forEach begin="1" end="6" varStatus="emptyRow">
																						<tr>
																							<td>&nbsp;</td>
																							<td>&nbsp;</td>
																						</tr>
																					</c:forEach>
																				</c:when>
																				<c:otherwise>
																					<c:forEach var="reservation" items="${reserList}" varStatus="loop">
																					    <tr>
																					        <td>${reservation.reservNo}</td>
																					        <td>${reservation.reservDate}</td>
																					        <!-- 예약취소하기 버튼 생성 -->
																					        <c:if test="${fn:substringBefore(reservation.reservDate, ' ') gt currentDate}">
																					            <td>
																					                <button class="btn btn-secondary" type="button" onclick="cancelReservation(${reservation.reservNo})">예약취소</button>
																					            </td>
																					        </c:if>
																					    </tr>
																					</c:forEach>
																					<!-- 리스트 크기가 6 미만일 때만 빈 요소 추가 -->
																					<c:if test="${reserList.size() lt 6}">
																						<c:forEach begin="1" end="${6 - reserList.size()}"
																							varStatus="emptyRow">
																							<tr>
																								<td>&nbsp;</td>
																								<td>&nbsp;</td>
																								<!-- 빈 칸에는 예약취소하기 버튼을 추가하지 않음 -->
																								<td></td>
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
												<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-12" style="margin-top: 50px;">
													<div class="card custom-card overflow-hidden">
														<div class="card-body p-0">
															<div class="px-1 py-2" style="background-color: #aee3f9;"></div>
															<div class="p-4">
																<div
																	class="d-flex justify-content-between align-items-center mb-3">
																	<div class="fs-18 fw-semibold" style="font-size: 25px;">
																	<i class="bi bi-caret-right-fill"></i> 서류발급</div>
																</div>
																<div class="fs-25 fw-bold mb-1">
																	<sub class="text-muted fw-semibold fs-11 ms-1" style="font-size: 15px;">
																		발급 안내
																	</sub>
																</div>
																<div class="mb-1 text-muted"></div>
																<div class="fs-12 mb-3">
																	<u>의료법 제21조 1항, 의료법 시행규칙 제13조의 3 기록 열람 등의 요건을
																	</u><br><u>충족할 경우만 사본 발급이 가능합니다.</u>
																</div>
																<ul class="list-unstyled mb-0">
																	<li class="d-flex align-items-center mb-3"><span
																		class="me-2"> <i
																			class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
																	</span> <span> <strong class="me-1 d-inline-block" style="font-size: large;">
																	일반 진단서</strong>
																	</span></li>
																	<li class="d-flex align-items-center mb-3"><span
																		class="me-2"> <i
																			class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
																	</span> <span> <strong class="me-1 d-inline-block" style="font-size: large;">상해진단서</strong>
																	</span></li>
																	<li class="d-flex align-items-center mb-3"><span
																		class="me-2"> <i
																			class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
																	</span> <span> <strong class="me-1 d-inline-block" style="font-size: large;">
																				후유장애진단서</strong>
																	</span></li>
																	<li class="d-flex align-items-center mb-3"><span
																		class="me-2"> <i
																			class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
																	</span> <span> <strong class="me-1  d-inline-block" style="font-size: large;">근로능력 평가용진단서</strong>
																	</span></li>
																	<li class="d-flex align-items-center mb-3"><span
																		class="me-2"> <i
																			class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
																	</span> <span> <strong class="me-1  d-inline-block" style="font-size: large;">소견서</strong>
																	</span></li>
																	<li class="d-flex align-items-center mb-3"><span
																		class="me-2"> <i
																			class="ri-checkbox-circle-line fs-15 text-muted op-3"></i>
																	</span> <span> <strong class="me-1  d-inline-block" style="font-size: large;">입·퇴원확인서</strong>
																	</span></li>
																	<li class="d-grid">
																		<button class="btn btn-light btn-wave" style="border-color: #14adeb;font-size:large;">발급하기</button>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-12">
													<div class="card custom-card overflow-hidden">
														<div class="card-body p-0">
															<div class="px-1 py-2" style="background-color: #aee3f9;"></div>
															<div class="p-4">
																<div
																	class="d-flex justify-content-between align-items-center mb-3">
																	<div class="fs-18 fw-semibold" style="font-size: 25px;">
																		<i class="bi bi-caret-right-fill"></i> 상담내역</div>
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
																				<c:forEach var="counsel" items="${CounsList}"
																					varStatus="loop">
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
																					<c:forEach begin="1" end="${6 - CounsList.size()}"
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
																<div class="d-flex justify-content-end">
																    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#counselModal" style="margin-top: 10px;">상담하기</a>
																</div>
																	<div class="modal fade" id="counselModal" tabindex="-1"
																		aria-labelledby="counselModalLabel" aria-hidden="true">
																		<div class="modal-dialog">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h6 class="modal-title" id="counselModalLabel">상담내용을 입력해주세요</h6>
																					<button type="button" class="btn-close"
																						data-bs-dismiss="modal" aria-label="Close"></button>
																				</div>
																				<div class="modal-body">
																					<form>
																						<div class="mb-3">
																							<label for="recipient-name" class="col-form-label">제목 : </label>
																							<input type="text" class="form-control"id="cTitle">
																						</div>
																						<div class="mb-3">
																						    <label for="cContent" class="col-form-label">내용:</label>
																						    <textarea class="form-control" id="cContent" style="height: 200px;"></textarea>
																						</div>
																					</form>
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-primary"
																						id="" onclick="">확인</button>
																				</div>
																			</div>
																		</div>
																	</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-12">
													<div class="card custom-card overflow-hidden">
														<div class="card-body p-0">
															<div class="px-1 py-2" style="background-color: #aee3f9;"></div>
															<div class="p-4">
																<div
																	class="d-flex justify-content-between align-items-center mb-3">
																	<div class="fs-18 fw-semibold" style="font-size: 25px;">
																		<i class="bi bi-caret-right-fill"></i>  서비스평가</div>
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
																				<c:forEach var="EvaluList" items="${EvaluList}"
																					varStatus="loop">
																					<tr>
																						<td>${EvaluList.memName}</td>
																						<td>${EvaluList.receiptDate}</td>
																						<td><c:choose>
																								<c:when
																									test="${empty EvaluList.evlScore or EvaluList.evlScore eq 0}">
																									<%-- <a
		                                                                                                    href="/star/plusStar?memNo=${EvaluList.patntNo}"
		                                                                                                    style="display: inline-block; padding: 5px 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f0f0f0; text-decoration: none; color: #333;">평가하기</a>
		                                                                                                    --%>
																									<a
																										class="modal-effect btn btn-primary d-grid mb-3"
																										data-bs-effect="effect-scale"
																										data-bs-toggle="modal" href="#modaldemo8">평가하기</a>
																									<div class="modal fade" id="modaldemo8">
																										<div
																											class="modal-dialog modal-dialog-centered text-center"
																											role="document">
																											<div class="modal-content modal-content-demo">
																												<div class="modal-header">
																													<h6 class="modal-title">서비스를 평가해주세요.</h6>
																													<button aria-label="Close" class="btn-close"
																														data-bs-dismiss="modal"></button>
																												</div>
																												<div class="modal-body text-start">
																													<form action="/star/plusStar"
																														method="post" id="signupForm"
																														enctype="multipart/form-data">
		<%-- 																												<input type="hidden" value="${sessionScope.user.member.memNo }" name="memNo"> --%>
																															<input type="hidden" value="${EvaluList.receiptNo }" name="receiptNo">
																														<div class="row gy-3">
																															<div class="col-xl-12">
																																<div>별점주기</div>
																																<div id="rater-basic" class="star-rating"></div>
																															</div>
																															<div class="col-xl-12">
																																<label for="comment"
																																	class="form-label text-default"
																																	style="margin-top: 1em;">한 줄평</label>
																																<div class="input-group">
																																	<input type="hidden" id="rate"
																																		name="evlScore" />
																																	<textarea
																																		class="form-control form-control-lg"
																																		style="height: 100px;" id="comment"
																																		name="evlContent"
																																		placeholder="한 줄평을 입력해주세요"></textarea>
																																</div>
																															</div>
																														</div>
																													</form>
																												</div>
																												<div class="modal-footer">
																													<button class="btn btn-primary" type="button"
																														onclick="validateAndSubmit()">확인</button>
																													<button class="btn btn-light"
																														data-bs-dismiss="modal">취소</button>
																												</div>
																											</div>
																										</div>
																									</div>
																								</c:when>
																								<c:otherwise>
		                                                                                                	<div style="font-size:large;">평가완료</div>
		                                                                                            </c:otherwise>
																							</c:choose></td>
																					</tr>
																				</c:forEach>
																				<!-- 만약 리스트 크기가 6보다 작다면 빈 행을 삽입 -->
																				<c:if test="${EvaluList.size() lt 6}">
																					<c:forEach begin="1" end="${6 - EvaluList.size()}"
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
		
	<!-- Rater JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/rater-js/index.js"></script>
    
    <!-- Internal Ratings JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/ratings.js"></script>
	
	

</body>
<script type="text/javascript">
var memNo = ${sessionScope.user.member.memNo};
    $(document).ready(function(){
        $("#checkPw").click(function(){
            var inputValue = $("#writePw").val();
            console.log(inputValue);
            let data = { 
                memPw: inputValue,
                memNo: memNo
            };
            console.table(data);
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
                        location.href="http://localhost/pAccount/update.do?memNo=" + memNo;
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
    
    function cancelReservation(reservNo) {
        // 확인 창을 표시
        console.log(reservNo);
        var confirmCancel = confirm('정말로 예약을 취소하시겠습니까?');
        
        console.log(confirmCancel);
        // 사용자가 확인을 누른 경우에만 예약을 취소
        if (confirmCancel) {
            $.ajax({
                url: '/pMypage/delClinicReserv',
                type: 'POST',
                data: JSON.stringify({ reservNo: reservNo }),
                contentType : "application/json;charset=utf-8",
//                 beforeSend: function(xhr) {
//                     // CSRF 토큰 헤더에 추가
//                    xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
//         	},
                success: function(response) {
                    // 예약 취소에 성공한 경우에 대한 처리를 수행합니다.
                    // 예를 들어, 취소한 예약을 화면에서 제거하거나 갱신합니다.
                    if (response === true) {
                        alert('예약이 취소되었습니다.');
                        window.location.href = '/pMypage/home?memNo='+memNo;
                    } else {
                        alert('예약 취소에 실패했습니다.');
                    }
                },
                error: function(xhr, status, error) {
                    // 예약 취소에 실패한 경우에 대한 처리를 수행합니다.
                    console.error('Failed to cancel reservation:', error);
                }
            });
        }
    }
    
    </script>
</html>