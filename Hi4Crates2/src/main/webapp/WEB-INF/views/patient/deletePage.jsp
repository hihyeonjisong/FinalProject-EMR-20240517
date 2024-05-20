<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>

<html dir="ltr" data-nav-layout="vertical"
	data-vertical-style="overlay" data-theme-mode="light"
	data-header-styles="light" data-menu-styles="light"
	data-toggled="close">

<head>

<!-- Meta Data -->
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>비밀번호 변경</title>
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

<style type="text/css">
.authentication-cover {
    background-image: url(/resources/img/backmain.jpg) !important;
}
.authentication .authentication-cover:before {
    background-color: rgb(255, 255, 255, 0.1) !important;
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
							<a href="index.html"> <img
								src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/desktop-logo.png"
								alt="" class="authentication-brand desktop-logo"> <img
								src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/desktop-dark.png"
								alt="" class="authentication-brand desktop-dark">
							</a>
						</div>
						<p class="h5 fw-semibold mb-2">회원정보탈퇴</p>
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
						<form action="/pAccount/deleteAccount2" method="post" id="signupForm" enctype="multipart/form-data">
							<div class="row gy-3">
								<div class="col-xl-12">
							    <label for="memWithDrawReason" class="form-label text-default">탈퇴사유</label>
							    <select class="form-select form-select-lg" id="memWithDrawReason" name="memWithDrawReason">
							        <option value="탈퇴사유를 선택해주세요." selected disabled>탈퇴사유를 선택해주세요.</option>
							        <option value="광고가 너무 많음">광고가 너무 많음</option>
							        <option value="정보가 부족함">정보가 부족함</option>
							        <option value="몸이 건강해져버림">몸이 건강해져버림</option>
							        <option value="서비스 이용에 대한 불만족">서비스 이용에 대한 불만족</option>
							        <option value="개인 정보 보호 문제">개인 정보 보호 문제</option>
							        <option value="더이상 서비스가 필요하지 않음">더이상 서비스가 필요하지 않음</option>
							        <option value="직접 입력">직접 입력</option>
							    </select>
							    <input type="text" class="form-control form-control-lg" id="direct-input" placeholder="사유를 입력하세요" style="display:none;">
							</div>
								<div class="col-xl-12">
									<label for="signup-password" class="form-label text-default">비밀번호 확인</label>
									<div class="input-group">
										<input type="password" class="form-control form-control-lg"
											id="memPw" name="memPw" placeholder="비밀번호">
										<button class="btn btn-light"
											onclick="createpassword('memPw',this)" type="button"
											id="button-addon1">
											<i class="ri-eye-off-line align-middle"></i>
										</button>
<!-- 										<div class="invalid-feedback" id="invalid-pw">*4~10자리 영어, 숫자, 특수문자를 포함하여 입력하여주세요!</div> -->
									</div>
									<div id="password-mismatch" class="invalid-feedback" style="display: none;">비밀번호가 일치하지 않습니다.</div>
									<div id="password-match" class="invalid-feedback" style="display: none; color: green;">비밀번호가 일치합니다.</div>
								</div>
								<div class="col-xl-12 d-grid mt-2">
									<input type="button" class="btn btn-lg btn-primary" id="deleteAccountBtn"
										value="탈퇴하기">
								</div>
							</div>
<%-- 							<sec:csrfInput /> --%>
						</form>
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
var flag = false;

//비밀번호 검증 함수
function validatePassword() {
 var memPw = $('#memPw').val();
 var memNo = ${sessionScope.user.member.memNo};
 var memWithDrawReason = $('#memWithDrawReason').val();
 
 // 직접 입력한 경우에는 값 변경
 if (memWithDrawReason === "직접 입력") {
     memWithDrawReason = $('#direct-input').val();
 }
 
 // 데이터 준비
 var data = {
     memNo: memNo,
     memPw: memPw,
     memWithDrawReason: memWithDrawReason
 };
 
 // AJAX를 통한 비밀번호 검증
 $.ajax({
     type : 'POST',
     url : "/pAccount/deleteAccountCheckPw",
     contentType : "application/json",
     data : JSON.stringify(data),
     success: function(response) {
         if(response === false) {
             $("#password-mismatch").show();
             $("#password-match").hide();
             flag = false; // 일치하지 않으면 flag를 false로 설정
         } else {
             $("#password-mismatch").hide();
             $("#password-match").show();
             flag = true; // 일치하면 flag를 true로 설정
         }
         
         // 비밀번호 검증 후 알림창 표시 여부 결정
         if ($("#deleteAccountBtn").data("ready")) {
             showAlert(); // 비밀번호 검증 후 deleteAccountBtn이 준비되어 있으면 알림창 표시
         }
     }
 });
}

//직접 입력 칸 제어
$('#memWithDrawReason').on('change', function() {
 var selectBox = document.getElementById('memWithDrawReason');
 var userInputBox = document.getElementById('direct-input');
 userInputBox.style.display = selectBox.value === '직접 입력' ? 'block' : 'none';
});

//삭제 버튼 클릭 시 알림창 표시
$('#deleteAccountBtn').on('click', function() {
 if (flag) {
     showAlert(); // flag가 true이면 바로 알림창 표시
 } else {
     // 비밀번호가 일치하지 않을 때의 처리
 }
});

// 알림창 표시 함수
function showAlert() {
    if (confirm("회원을 탈퇴하시겠습니까?")) {
        var memPw = $('#memPw').val();
        var memNo = ${sessionScope.user.member.memNo};
        var memWithDrawReason = $('#memWithDrawReason').val();
        
        // 직접 입력한 경우에는 값 변경
        if (memWithDrawReason === "직접 입력") {
            memWithDrawReason = $('#direct-input').val();
        }
        
        // 폼 생성
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", "/pAccount/deleteAccount2");
        
        // 숨은 입력 필드 추가
        var hiddenField1 = document.createElement("input");
        hiddenField1.setAttribute("type", "hidden");
        hiddenField1.setAttribute("name", "memNo");
        hiddenField1.setAttribute("value", memNo);
        form.appendChild(hiddenField1);
        
        var hiddenField2 = document.createElement("input");
        hiddenField2.setAttribute("type", "hidden");
        hiddenField2.setAttribute("name", "memPw");
        hiddenField2.setAttribute("value", memPw);
        form.appendChild(hiddenField2);
        
        var hiddenField3 = document.createElement("input");
        hiddenField3.setAttribute("type", "hidden");
        hiddenField3.setAttribute("name", "memWithDrawReason");
        hiddenField3.setAttribute("value", memWithDrawReason);
        form.appendChild(hiddenField3);
        
        // 폼을 문서에 추가하고 전송
        document.body.appendChild(form);
        form.submit();
    }
}

//비밀번호 입력란 블러 이벤트 처리
$('#memPw').on('blur', validatePassword);
			
			
			
// 			// 비밀번호 정규식 검증
// 			$('#memPw').on('blur',function(){
// 				var memPw = $('#memPw').val();
// 			    if(validatePassword(memPw)) {
// 			        $('#memPw').removeClass('is-invalid');
// 			        $('#memPw').addClass("is-valid");
// 			    }
// 			    else if(!validatePassword(memPw)){
// 			        $('#memPw').removeClass('is-valid');
// 			        $('#memPw').addClass("is-invalid");
// 			}
// 			});
			
// 			// 비밀번호 확인 검증
// 			$('#memPw2').on('blur',function(){
// 				var memPw = $('#memPw').val();
// 				var memPw2 = $('#memPw2').val();
// 			    if(correctPassword(memPw,memPw2)) {
// 			        $('#memPw2').removeClass('is-invalid');
// 			        $('#memPw2').addClass("is-valid");
// 			    }
// 			    else if(!correctPassword(memPw,memPw2)){
// 			        $('#memPw2').removeClass('is-valid');
// 			        $('#memPw2').addClass("is-invalid");
// 			}
// 			});
			
			
			
// 			// 임시 파일로 썸네일 이미지 생성
// 			function getThumbnailName(fileName){
// 				var front = fileName.substr(0, 12); // 년 월 일 에 해당하는 폴더 경로
// 				var end = fileName.substr(12);		// 뒤쪽 파일명
				
// 				console.log(front);
// 				console.log(end);
				
// 				return front + "s_" + end;
// 			}
			
// 			function checkImageType(fileName){
// 				//정규식에서 i는 대소문자 구분없음을 나타냄
// 				var pattern = /jpg|gif|png|jpeg/i;
// 				return fileName.match(pattern); //패턴과 일치하면 이미지로 판단
// 			}
			
		
// 		function DaumPostCode() {
// 			new daum.Postcode(
// 					{
// 						oncomplete : function(data) {
// 							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

// 							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
// 							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
// 							var addr = ''; // 주소 변수
// 							var extraAddr = ''; // 참고항목 변수

// 							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
// 							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
// 								addr = data.roadAddress;
// 							} else { // 사용자가 지번 주소를 선택했을 경우(J)
// 								addr = data.jibunAddress;
// 							}

// 							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
// 							if (data.userSelectedType === 'R') {
// 								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
// 								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
// 								if (data.bname !== ''
// 										&& /[동|로|가]$/g.test(data.bname)) {
// 									extraAddr += data.bname;
// 								}
// 								// 건물명이 있고, 공동주택일 경우 추가한다.
// 								if (data.buildingName !== ''
// 										&& data.apartment === 'Y') {
// 									extraAddr += (extraAddr !== '' ? ', '
// 											+ data.buildingName
// 											: data.buildingName);
// 								}
// 							}

// 							// 우편번호와 주소 정보를 해당 필드에 넣는다.
// 							document.getElementById('memPostcode').value = data.zonecode;
// 							document.getElementById("memAddress1").value = addr;
// 							// 커서를 상세주소 필드로 이동한다.
// 							document.getElementById("memAddress2").focus();
// 						}
// 					}).open();
// 		}
		
		
		/* $('#memWithDrawReason').change(function() {
			let value = $(this).val();
			if (value == "직접 입력") {
				 $('#memWithDrawReason').removeAttr("name");
			     $('#direct-input').attr("name", "memWithDrawReason");
			} else {
				 $('#direct-input').removeAttr("name");
			     $('#memWithDrawReason').attr("name", "memWithDrawReason");
			}
		});  */
		
// 		$('#signupBtn').on("click",function(){
// 			event.preventDefault();
// 			let noSignFlag = false;
// 			console.log('버튼 클릭함');
// 			var selectedReason = $('#memWithDrawReason').val();
// 			console.log(selectedReason)
// 			if (selectedReason === "직접 입력") {
// 		        selectedReason = $('#direct-input').val(); // 직접 입력한 값으로 변경
// 		        console.log(selectedReason);
// 		    }
// 			if(!$('#infoAgree').is(':checked')) {
// 				$('#infoAgree').removeClass('is-valid');
// 				$('#infoAgree').addClass('is-invalid');
// 				return;
// 			}
// 			if($('#infoAgree').is(':checked')) {
// 				$('#infoAgree').removeClass('is-invalid');
// 				$('#infoAgree').addClass('is-valid');
// 			}
			
// 			$('#signupForm input').each(function(){
// //					console.log($(this));
// 				if($(this) == $('#memAddtel') && $(this).val() === null || $(this).val() === "") {
// 					console.log($(this));
// 					console.log("선택사항")
// 					return true;
// 				}
// 				if($(this).hasClass('is-invalid') || $(this).val() === null || $(this).val() === ""){
// 						noSignFlag = true;
// 				}
// 			});
			
			
// 			if(noSignFlag) return;
// 			$('#signupForm').submit();
// 		});
		

		/* document.getElementById('submit-button').addEventListener('click', function() {
		    var reasonSelect = document.getElementById('memWithDrawReason2');
		    var reasonInput = document.getElementById('direct-input');

		    var selectedReason = reasonSelect.value; // 기본적으로 셀렉트 박스의 값을 가져옴
		    if (selectedReason === '직접 입력') {
		        selectedReason = reasonInput.value; // 만약 직접 입력 옵션이 선택되었을 때에는 입력 필드의 값을 가져옴
		    }

		    // AJAX 요청을 통해 서버로 데이터 전송
		    var data = {
		        memWithDrawReason: selectedReason
		    };

		    $.ajax({
		        type: 'POST',
		        url: "/pAccount/deleteAccount",
		        contentType: "application/json",
		        data: JSON.stringify(data),
		        success: function(response) {
		            // 처리 결과에 따라 적절한 동작 수행
		        }
		    });
		}); */
	</script>

</body>

</html>