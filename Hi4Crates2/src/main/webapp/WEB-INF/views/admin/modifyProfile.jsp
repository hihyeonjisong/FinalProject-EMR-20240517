<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-content app-content">
	<div class="container-fluid">
		<div class="row">
			<div class="card custom-card" style="margin-top:25px;">
				<div class="card-body">
					<div class="card-text">
						<form action="" enctype="multipart/form-data">
							<div class="row gy-4">
								<div class="col-xl-12">
									<span class="avatar avatar-xxl avatar-rounded me-3"
										style="margin-left: 40%; height: 10rem; width: 10rem;">
										<c:set value="${member.fileVO.attachLoc}${member.fileVO.attachPath}${member.fileVO.attachName }" var="target"/>
										<img id="imgBox" src="/file/displayFile?fileName=${target}"
										
										alt="">
									</span><br>
								</div>
								<div class="col-12">
									<label for="input-label" class="form-label">프로필사진</label> <input
										type="file" class="form-control" style="width: 50%;" id="file"
										name="file" value="${member.file }">
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
									<label for="input-label" class="form-label">아이디</label>
									<div class="input-group">
										<input type="text" class="form-control" id="memId"
											name="memId" value="${member.memId }"> <input
											type="button" class="btn btn-light" id="checkId" value="중복체크">
									</div>
									<div class="invalid-feedback" id="invalid-id">*영어와 숫자를
										사용한 4~16자리의 아이디를 입력해주세요!</div>
									<div class="valid-feedback" id="valid-id"></div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 ">
									<label for="input-label" class="form-label">비밀번호</label>
									<div class="input-group">
										<input type="password" class="form-control" id="memPw"
											name="memPw" value="">
										<button class="btn btn-light"
											onclick="createpassword('memPw',this)" type="button"
											id="button-addon1">
											<i class="ri-eye-off-line align-middle"></i>
										</button>
										<div class="invalid-feedback" id="invalid-pw">*4~10자리
											영어, 숫자, 특수문자를 포함하여 입력하여주세요!</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
									<label for="input-label" class="form-label">이름</label> <input
										type="text" class="form-control" id="memName" name="memName"
										value="${member.memName }">
									<div class="invalid-feedback" id="invalid-name">*한글로 이루어진
										이름을 입력해주세요!</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
									<label for="input-label" class="form-label">전화번호</label> <input
										type="text" class="form-control" id="memTel" name="memTel"
										value="${member.memTel }">
									<div class="invalid-feedback" id="invalid-tel">*010-1234-5678
										형식으로 입력해주세요</div>
								</div>
								<div class="col-xl-8 col-lg-6 col-md-6 col-sm-12">
									<label for="input-email" class="form-label">이메일</label>
									<div class="input-group">
										<input type="email" class="form-control" id="memEmail"
											name="memEmail" value="${member.memEmail }"> <input
											type="button" class="btn btn-light" id="checkEmail"
											value="인증번호 전송">
									</div>
									<div class="invalid-feedback" id="invalid-email">*이메일 형식이
										올바르지 않습니다!</div>
								</div>

								<div class="col-xl-4" style="display: none;" id="emailAuth">
									<label for="signup-email" class="form-label text-default">인증번호
										입력</label>
									<div class="input-group">
										<input type="text" class="form-control form-control-lg"
											id="authNo" placeholder="인증번호"> <input type="button"
											class="btn btn-light" id="emailAuthBtn" value="입력">
										<div class="invalid-feedback" id="invalid-emailAuth">*인증번호가
											일치하지 않습니다!</div>
									</div>
								</div>
								<div class="input-group">
									<input type="text" class="form-control form-control-lg"
										id="memPostcode" name="memPostcode" placeholder="우편번호"
										value="${member.memPostcode }">
									<button type="button" class="btn btn-secondary btn-flat"
										onclick="DaumPostCode()">우편번호 찾기</button>
									<div class="invalid-feedback" id="invalid-postcode">*주소를
										선택해주세요!</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-add" class="form-label text-default">주소
										선택</label> <input type="text" class="form-control form-control-lg"
										id="memAddress1" name="memAddress1"
										value="${member.memAddress1 }">
									<div class="invalid-feedback" id="invalid-address1">*주소를
										선택해주세요!</div>
								</div>
								<div class="col-xl-12">
									<label for="signup-add2" class="form-label text-default">상세
										주소</label> <input type="text" class="form-control form-control-lg"
										id="memAddress2" name="memAddress2"
										value="${member.memAddress2 }">
									<div class="invalid-feedback" id="invalid-address2">*상세주소를
										입력해주세요!</div>
								</div>
							</div>
							<div class="col-xl-2 d-grid mt-2" style="float: right;">
								<input type="button" class="btn btn-lg btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									value="정보 수정">
							</div>
							<sec:csrfInput/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>



<script>
	$(function() {
		var memAddress2 = $("#memAddress2");
		//카카오맵 api 사용 자원들
		var mapContainer = null;
		var map = null;
		var geocoder = null;

		var authCode;

		// 이름 검증
		$('#memName').on('blur', function() {
			memName = $('#memName').val();
			if (validateName(memName)) {
				$('#memName').removeClass('is-invalid');
				$('#memName').addClass("is-valid");
			} else if (!validateName(memName)) {
				$('#memName').removeClass('is-valid');
				$('#memName').addClass("is-invalid");
			}
		});

		// 아이디 검증
		$('#memId').on('blur', function() {
			memId = $('#memId').val();
			if (validateUsername(memId)) {
				$('#memId').removeClass('is-invalid');
				$('#memId').addClass("is-valid");
			} else if (!validateUsername(memId)) {
				$('#memId').removeClass('is-valid');
				$('#memId').addClass("is-invalid");
			}
		});

		$('#checkId').on("click", function() {
			let checkId = $('#memId').val();
			let data = {
				"checkId" : checkId
			};
			$.ajax({
				url : "/public/idChk.do",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        	},
				success : function(result) {
					console.log(result);
					if (result === "OK") {
						$('#memId').removeClass('is-invalid');
						$('#memId').addClass("is-valid");
						$('#valid-id').html("*사용 가능한 아이디입니다 !");
					}

					if (result === "FAILED") {
						$('#memId').removeClass('is-valid');
						$('#memId').addClass("is-invalid");
						$('#invalid-id').html("*중복된 아이디가 존재합니다 !");
					}
				}
			});
		});

		// 비밀번호 정규식 검증
		$('#memPw').on('blur', function() {
			var memPw = $('#memPw').val();
			if (validatePassword(memPw)) {
				$('#memPw').removeClass('is-invalid');
				$('#memPw').addClass("is-valid");
			} else if (!validatePassword(memPw)) {
				$('#memPw').removeClass('is-valid');
				$('#memPw').addClass("is-invalid");
			}
		});

		// 이메일 검증
		$('#checkEmail').on("click", function() {
			var memEmail = $('#memEmail').val();
			if (validateEmail(memEmail)) {
				$('#memEmail').removeClass('is-invalid');
				$('#memEmail').addClass("is-valid");

			} else if (!validateEmail(memEmail)) {
				$('#memEmail').removeClass('is-valid');
				$('#memEmail').addClass("is-invalid");
				return;
			}
			let obj = {
				"email" : memEmail
			};
			$.ajax({
				url : "/public/emailAuth",
				data : JSON.stringify(obj),
				type : "POST",
				contentType : "application/json;charset=utf-8",
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        	},
				success : function(res) {
					console.log("result : " + res);
					authCode = res;
				}
			});
			$('#emailAuth').css('display', 'block');
		});

		// 이메일 인증번호 확인
		$('#emailAuthBtn').on('click', function() {
			let authNo = $('#authNo').val();
			console.log(authNo);
			console.log(authCode);
			if (authNo === authCode.toString()) {
				$('#authNo').prop("disabled", true);
				$('#emailAuthBtn').prop("disabled", true);
				alert('인증번호가 일치합니다!');
				$('#authNo').removeClass("is-invalid");
			} else {
				$('#authNo').addClass("is-invalid");
				alert('인증번호가 일치하지 않습니다');
			}
		});

		// 주민등록번호 검증
		$('#memRegno').on('blur', function() {
			var memRegno = $('#memRegno').val();
			if (validateResidentNumber(memRegno)) {
				$('#memRegno').removeClass('is-invalid');
				$('#memRegno').addClass("is-valid");
			} else if (!validateResidentNumber(memRegno)) {
				$('#memRegno').removeClass('is-valid');
				$('#memRegno').addClass("is-invalid");
			}
		});

		// 전화번호 검증
		$('#memTel').on('blur', function() {
			var memTel = $('#memTel').val();
			if (validatePhoneNumber(memTel)) {
				$('#memTel').removeClass('is-invalid');
				$('#memTel').addClass("is-valid");
			} else if (!validatePhoneNumber(memTel)) {
				$('#memTel').removeClass('is-valid');
				$('#memTel').addClass("is-invalid");
			}
		});

		$('#memAddress1').on('blur', function() {
			var memAddress1 = $('#memAddress1').val();
			var memAddress2 = $('#memAddress2').val();
			if (memAddress1 == null) {
				$('#memAddress1').removeClass('is-valid');
				$('#memAddress1').addClass('is-invalid');
			}
			if (memAddress1 != null) {
				$('#memAddress1').removeClass('is-invalid');
				$('#memAddress1').addClass('is-valid');
			}
		});
		$('#memAddress2').on('blur', function() {
			var memAddress2 = $('#memAddress2').val();
			if (memAddress2 != null) {
				$('memAddress2').removeClass('is-invalid');
				$('#memAddress2').addClass('is-valid');
			}
			if (memAddress2 == null) {
				$('#memAddress2').removeClass('is-valid');
				$('#memAddress2').addClass('is-invalid');
			}
		});

		// 아이디 중복체크
		$('#checkId').on("click", function() {
			let checkId = $('#memId').val();
			let data = {
				"checkId" : checkId
			};
			$.ajax({
				url : "/public/idChk.do",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        	},
				success : function(result) {
					console.log(result);
					if (result === "OK") {
						$('#memId').removeClass('is-invalid');
						$('#memId').addClass("is-valid");
						$('#valid-id').html("*사용 가능한 아이디입니다 !");
					}

					if (result === "FAILED") {
						$('#memId').removeClass('is-valid');
						$('#memId').addClass("is-invalid");
						$('#invalid-id').html("*중복된 아이디가 존재합니다 !");
					}
				}
			});
		});

		$('#modifyBtn').on("click", function() {
			alert('수정 클릭함');
		});

	});
	function DaumPostCode() {
		new daum.Postcode({
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
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
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
