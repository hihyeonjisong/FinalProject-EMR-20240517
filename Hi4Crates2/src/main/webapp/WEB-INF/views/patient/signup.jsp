<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" --%>
<%-- 	prefix="sec"%> --%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="vertical"
	data-vertical-style="overlay" data-theme-mode="light"
	data-header-styles="light" data-menu-styles="light"
	data-toggled="close">

<head>

<!-- Meta Data -->
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>환자 회원가입</title>
<meta name="Description"
	content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
<meta name="Author" content="Spruko Technologies Private Limited">
<meta name="keywords"
	content="admin,admin dashboard,admin panel,admin template,bootstrap,clean,dashboard,flat,jquery,modern,responsive,premium admin templates,responsive admin,ui,ui kit.">
<meta name="_csrf" content="_csrf">
<meta name="_csrf_header" content="X-CSRF-TOKEN">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/assets/images/brand-logos/favicon.ico"
	type="image/x-icon">

<!-- Main Theme Js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/authentication-main.js"></script>

<!-- Bootstrap Css -->
<link id="style"
	href="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Style Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/styles.min.css"
	rel="stylesheet">

<!-- Icons Css -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css"
	rel="stylesheet">


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">
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
							<a href="/home">
							<img src="${pageContext.request.contextPath }/resources/assets/logo/좌우조합형_black.png" alt="" class="authentication-brand desktop-logo main-img">
                                <img src="${pageContext.request.contextPath }/resources/assets/logo/좌우조합형_black.png" alt="" class="authentication-brand desktop-dark main-img">
							</a>
						</div>
						<p class="h5 fw-semibold mb-2">환자 회원가입</p>
						<p class="text-center my-5 authentication-barrier"></p>
						<br>
						<!-- <p class="mb-3 text-muted op-7 fw-normal">버튼을 클릭하여 소셜 아이디로 가입할 수 있습니다.</p> -->
						<!-- <div class="btn-list"> -->
						<!-- <button class="btn btn-light"><svg class="google-svg" xmlns="http://www.w3.org/2000/svg" width="2443" height="2500" preserveAspectRatio="xMidYMid" viewBox="0 0 256 262"><path fill="#4285F4" d="M255.878 133.451c0-10.734-.871-18.567-2.756-26.69H130.55v48.448h71.947c-1.45 12.04-9.283 30.172-26.69 42.356l-.244 1.622 38.755 30.023 2.685.268c24.659-22.774 38.875-56.282 38.875-96.027"/><path fill="#34A853" d="M130.55 261.1c35.248 0 64.839-11.605 86.453-31.622l-41.196-31.913c-11.024 7.688-25.82 13.055-45.257 13.055-34.523 0-63.824-22.773-74.269-54.25l-1.531.13-40.298 31.187-.527 1.465C35.393 231.798 79.49 261.1 130.55 261.1"/><path fill="#FBBC05" d="M56.281 156.37c-2.756-8.123-4.351-16.827-4.351-25.82 0-8.994 1.595-17.697 4.206-25.82l-.073-1.73L15.26 71.312l-1.335.635C5.077 89.644 0 109.517 0 130.55s5.077 40.905 13.925 58.602l42.356-32.782"/><path fill="#EB4335" d="M130.55 50.479c24.514 0 41.05 10.589 50.479 19.438l36.844-35.974C195.245 12.91 165.798 0 130.55 0 79.49 0 35.393 29.301 13.925 71.947l42.211 32.783c10.59-31.477 39.891-54.251 74.414-54.251"/></svg>Google 계정으로 로그인</button> -->
						<!-- <button class="btn btn-icon btn-light"><i class="ri-facebook-fill"></i></button> -->
						<!-- <button class="btn btn-icon btn-light"><i class="ri-twitter-fill"></i></button> -->
						<!-- </div> -->
						<!-- <div class="text-center my-5 authentication-barrier">
                            <span>OR</span>
                        </div> -->
						<form action="/patient/signup.do" method="post" id="signupForm">
							<div class="row gy-3">
								<div class="col-xl-12 mt-0">
									<label for="signup-firstname" class="form-label text-default">이름</label>
									<input type="text" class="form-control form-control-lg" name="memName" id="memName" placeholder="이름">
									<div class="invalid-feedback" id="invalid-name">*한글로 이루어진 이름을 입력해주세요!</div>
									
								</div>
								<div class="col-xl-12">
									<label for="signup-lastname" class="form-label text-default">아이디</label>
								<div class="input-group">
									<input type="text" class="form-control form-control-lg"
										id="memId" name="memId" placeholder="아이디">
									<input type="button" class="btn btn-light" id="checkId" value="중복체크">
									<div class="invalid-feedback" id="invalid-id">*영어와 숫자를 사용한 4~16자리의 아이디를 입력해주세요!</div>
									<div class="valid-feedback" id="valid-id"></div>
								</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-password" class="form-label text-default">비밀번호</label>
									<div class="input-group">
										<input type="password" class="form-control form-control-lg"
											id="memPw" name="memPw" placeholder="비밀번호">
										<button class="btn btn-light"
											onclick="createpassword('memPw',this)" type="button"
											id="button-addon1">
											<i class="ri-eye-off-line align-middle"></i>
										</button>
										<div class="invalid-feedback" id="invalid-pw">*4~10자리 영어, 숫자, 특수문자를 포함하여 입력하여주세요!</div>
									</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-confirmpassword"
										class="form-label text-default">비밀번호 확인</label>
									<div class="input-group">
										<input type="password" class="form-control form-control-lg"
											id="memPw2" name="memPw2" placeholder="비밀번호">
										<button class="btn btn-light"
											type="button"
											id="button-addon2">
											<i class="ri-eye-off-line align-middle"></i>
										</button>
										<div class="invalid-feedback" id="invalid-pw2">*비밀번호가 동일하지 않습니다!</div>
									</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-email" class="form-label text-default">이메일</label>
									<div class="input-group">
										<input type="text" class="form-control form-control-lg"
											id="memEmail" name="memEmail" placeholder="ex@example.com">
										<input type="button" class="btn btn-light" id="checkEmail" value="인증번호 전송">
										<div class="invalid-feedback" id="invalid-email">*이메일 형식이 올바르지 않습니다!</div>
									</div>
								</div>
								<div class="col-xl-12" style="display: none;" id="emailAuth">
									<label for="signup-email" class="form-label text-default">인증번호 입력</label>
									<div class="input-group">
										<input type="text" class="form-control form-control-lg"
											id="authNo"  placeholder="인증번호">
										<input type="button" class="btn btn-light" id="emailAuthBtn" value="입력">
										<div class="invalid-feedback" id="invalid-emailAuth">*인증번호가 일치하지 않습니다!</div>
									</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-regno" class="form-label text-default">주민등록번호</label>
									<input type="text" class="form-control form-control-lg"
										id="memRegno" name="memRegno" placeholder="13자리를 '-' 포함하여 입력">
										<div class="invalid-feedback" id="invalid-regNo">*주민번호 형식에 맞게 입력해주세요!</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-tel" class="form-label text-default">휴대폰
										번호</label> <input type="text" class="form-control form-control-lg"
										id="memTel" name="memTel" placeholder="010-1234-5678">
										<div class="invalid-feedback" id="invalid-tel">*휴대폰 번호 형식에 맞게 입력해주세요!</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-tel2" class="form-label text-default">추가
										연락처</label> <input type="text" class="form-control form-control-lg"
										id="memAddtel" name="memAddtel" placeholder="선택사항">
								</div>


								<div class="col-xl-12">
									<label for="signup-add" class="form-label text-default">우편
										번호</label>
									<div class="input-group">
										<input type="text" class="form-control form-control-lg"
											id="memPostcode" name="memPostcode" placeholder="우편번호">
										<button type="button" class="btn btn-secondary btn-flat"
											onclick="DaumPostCode()">우편번호 찾기</button>
											<div class="invalid-feedback" id="invalid-postcode">*주소를 선택해주세요!</div>
									</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-add" class="form-label text-default">주소
										선택</label> <input type="text" class="form-control form-control-lg"
										id="memAddress1" name="memAddress1" placeholder="주소를 입력해주세요">
										<div class="invalid-feedback" id="invalid-address1">*주소를 선택해주세요!</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-add2" class="form-label text-default">상세
										주소</label> <input type="text" class="form-control form-control-lg"
										id="memAddress2" name="memAddress2"
										placeholder="상세 주소를 입력해주세요">
										<div class="invalid-feedback" id="invalid-address2">*상세주소를 입력해주세요!</div>
								</div>
								<div class="col-xl-12 mb-3">
									<div class="form-check mt-3">
										<input class="form-check-input" type="checkbox" value="y"
											id="infoAgree"> <label
											class="form-check-label text-muted fw-normal"
											for="defaultCheck1"> 개인정보 이용 동의 <a
											href="terms_conditions.html" class="text-success"></a>
										</label>
									</div>
									<div class="invalid-feedback" id="invalid-infoAgree">*개인정보 이용에 동의해주세요!</div>
								</div>
								<div class="col-xl-12 d-grid mt-2">
									<input type="button" class="btn btn-lg btn-primary" id="signupBtn"
										value="회원 가입">
								</div>
							</div>
<!-- 							<sec:csrfInput /> -->
						</form>
						<div class="text-center">
							<p class="fs-12 text-muted mt-4">
								이미 계정이 있으신가요? <a href="/login" class="text-primary">로그인</a>
							</p>
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
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Swiper JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/swiper/swiper-bundle.min.js"></script>

	<!-- Internal Sing-Up JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/authentication.js"></script>

	<!-- Show Password JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/show-password.js"></script>

	<!-- Popper JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>


	<!-- Defaultmenu JS -->

	<!-- Node Waves JS-->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>

	<!-- Sticky JS -->

	<!-- Simplebar JS -->
	<!-- Color Picker JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>



	<!-- Custom-Switcher JS -->

	<!-- Prism JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/prismjs/prism.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/prism-custom.js"></script>


	<!-- File pon JS -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond/filepond.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-encode/filepond-plugin-file-encode.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-edit/filepond-plugin-image-edit.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/libs/filepond-plugin-image-transform/filepond-plugin-image-transform.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/js/customValid.js"></script>
	<!-- Dropzone JS -->

	<!-- Custom JS -->
<script>
		$(function() {
			var signupForm = $('#signupForm');
			var memAddress2 = $("#memAddress2");
			//카카오맵 api 사용 자원들
			var mapContainer = null;
			var map = null;
			var geocoder = null;
			
			
			var infoAgree = $('#infoAgree');
			// 인증번호 확인
			var authCode;
			
			// 이름 검증
			$('#memName').on('blur',function(){
				memName = $('#memName').val();
			    if(validateName(memName)) {
			        $('#memName').removeClass('is-invalid');
			        $('#memName').addClass("is-valid");
			    }
			    else if(!validateName(memName)){
			        $('#memName').removeClass('is-valid');
			        $('#memName').addClass("is-invalid");
			}
			});
			
			// 아이디 검증
			$('#memId').on('blur',function(){
				memId = $('#memId').val();
			    if(validateUsername(memId)) {
			        $('#memId').removeClass('is-invalid');
			        $('#memId').addClass("is-valid");
			    }
			    else if(!validateUsername(memId)){
			        $('#memId').removeClass('is-valid');
			        $('#memId').addClass("is-invalid");
			}
			});
			
			$('#checkId').on("click",function(){
				let checkId = $('#memId').val();
				let data = {
						"checkId" : checkId
				};
				$.ajax({
					url : "/public/idChk.do",
					type : "post",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success : function(result){
						console.log(result);
						if(result === "OK") {
					        $('#memId').removeClass('is-invalid');
					        $('#memId').addClass("is-valid");
					       	$('#valid-id').html("*사용 가능한 아이디입니다 !");
						}
						
						if(result === "FAILED") {
					        $('#memId').removeClass('is-valid');
					        $('#memId').addClass("is-invalid");
							$('#invalid-id').html("*중복된 아이디가 존재합니다 !");
						}
					}
				});
			});
			
			// 비밀번호 정규식 검증
			$('#memPw').on('blur',function(){
				var memPw = $('#memPw').val();
			    if(validatePassword(memPw)) {
			        $('#memPw').removeClass('is-invalid');
			        $('#memPw').addClass("is-valid");
			    }
			    else if(!validatePassword(memPw)){
			        $('#memPw').removeClass('is-valid');
			        $('#memPw').addClass("is-invalid");
			}
			});
			
			// 비밀번호 확인 검증
			$('#memPw2').on('blur',function(){
				var memPw = $('#memPw').val();
				var memPw2 = $('#memPw2').val();
			    if(correctPassword(memPw,memPw2)) {
			        $('#memPw2').removeClass('is-invalid');
			        $('#memPw2').addClass("is-valid");
			    }
			    else if(!correctPassword(memPw,memPw2)){
			        $('#memPw2').removeClass('is-valid');
			        $('#memPw2').addClass("is-invalid");
			}
			});
			
			// 이메일 검증
			$('#checkEmail').on("click",function(){
				var memEmail = $('#memEmail').val();
			    if(validateEmail(memEmail)) {
			        $('#memEmail').removeClass('is-invalid');
			        $('#memEmail').addClass("is-valid");

			    }
			    else if(!validateEmail(memEmail)){
			        $('#memEmail').removeClass('is-valid');
			        $('#memEmail').addClass("is-invalid");
			        return;
			    }
				let obj = { "email" : memEmail};
				$.ajax({
					url : "/public/emailAuth",
					data : JSON.stringify(obj),
					type : "POST",
					contentType : "application/json;charset=utf-8",
					success:function(res){
						console.log("result : "+res);
						authCode = res;
					}
				});
				$('#emailAuth').css('display', 'block');
			});
		
			// 이메일 인증번호 확인
			$('#emailAuthBtn').on('click',function(){
				let authNo = $('#authNo').val();	
				console.log(authNo);
				console.log(authCode);
				if(authNo === authCode.toString() ) {
					$('#authNo').prop("disabled",true);
					$('#emailAuthBtn').prop("disabled",true);
					alert('인증번호가 일치합니다!');
					$('#authNo').removeClass("is-invalid");
				}else{
					$('#authNo').addClass("is-invalid");
					alert('인증번호가 일치하지 않습니다');
				}
			});
			
			// 주민등록번호 검증
			$('#memRegno').on('blur',function(){
				var memRegno = $('#memRegno').val();
				if(validateResidentNumber(memRegno)) {
		        	$('#memRegno').removeClass('is-invalid');
			        $('#memRegno').addClass("is-valid");
			    }
			    else if(!validateResidentNumber(memRegno)){
			        $('#memRegno').removeClass('is-valid');
			        $('#memRegno').addClass("is-invalid");
				}
			});
			
			// 전화번호 검증
			$('#memTel').on('blur',function(){
				var memTel = $('#memTel').val();
				if(validatePhoneNumber(memTel)) {
		        	$('#memTel').removeClass('is-invalid');
			        $('#memTel').addClass("is-valid");
			    }
			    else if(!validatePhoneNumber(memTel)){
			        $('#memTel').removeClass('is-valid');
			        $('#memTel').addClass("is-invalid");
				}
			});
			
			$('#memAddress1').on('blur',function(){
				var memAddress1 = $('#memAddress1').val();
				var memAddress2 = $('#memAddress2').val();
				if(memAddress1 == null) {
					$('#memAddress1').removeClass('is-valid');
					$('#memAddress1').addClass('is-invalid');
				}
				if(memAddress1 != null) {
					$('#memAddress1').removeClass('is-invalid');
					$('#memAddress1').addClass('is-valid');
				}
			});
			$('#memAddress2').on('blur',function(){
				var memAddress2 = $('#memAddress2').val();
				if(memAddress2 != null) {
					$('memAddress2').removeClass('is-invalid');
					$('#memAddress2').addClass('is-valid');
				}
				if(memAddress2 == null) {
					$('#memAddress2').removeClass('is-valid');
					$('#memAddress2').addClass('is-invalid');
				}
			});
			
			
			$('#signupBtn').on("click",function(){
				let noSignFlag = false;
				console.log('버튼 클릭함')
				if(!$('#infoAgree').is(':checked')) {
					$('#infoAgree').removeClass('is-valid');
					$('#infoAgree').addClass('is-invalid');
					return;
				}
				if($('#infoAgree').is(':checked')) {
					$('#infoAgree').removeClass('is-invalid');
					$('#infoAgree').addClass('is-valid');
				}
				
				$('#signupForm input').each(function(){
// 					console.log($(this));
					if($(this) == $('#memAddtel') && $(this).val() === null || $(this).val() === "") {
						console.log($(this));
						console.log("선택사항")
						return true;
					}
					if($(this).hasClass('is-invalid') || $(this).val() === null || $(this).val() === ""){
							noSignFlag = true;
					}
				});
				if(noSignFlag) return;
				$('#signupForm').submit();
			});
			
			
		});
		
		function DaumPostCode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('memPostcode').value = data.zonecode;
							document.getElementById("memAddress1").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("memAddress2").focus();
						}
					}).open();
		}
	</script>

</body>

</html>