<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<style>
.image-preview{
	max-height: 120px; /* 이미지의 최대 높이를 100px로 지정 */
	width: auto; /* 가로 너비는 자동으로 조정됨 */
}
.selected-image {
	max-width: 100px; /* 이미지의 최대 너비 설정 */
	height: auto; /* 이미지의 비율을 유지하기 위해 높이 자동 조정 */
	margin-right: 10px; /* 이미지 간 간격 설정 */
}
</style>
<head>
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

<c:set value="등록" var="btnText" />
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="btnText" />
</c:if>

<body class="landing-body">
<div class="page">

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
<%@ include file="/WEB-INF/views/patient/patientHeader.jsp"%>

	<!-- 본문 시작 -->
	<!-- Start::app-content -->
	<div class="main-content app-content">
		<div class="container-fluid">

			<div class="card custom-card">

				<div class="card-header">
					<!-- 페이지 헤더 -->
					<!-- Page Header -->
					<div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
						<c:if test="${status ne 'u' }">
							<h1 class="page-title fw-semibold fs-18 mb-0">공지사항 등록</h1>
						</c:if>
						<c:if test="${status eq 'u' }">
							<h1 class="page-title fw-semibold fs-18 mb-0">공지사항 수정</h1>
						</c:if>
						<div class="ms-md-1 ms-0">
							<nav>
								<ol class="breadcrumb mb-0">
									<li class="breadcrumb-item">
										<a href="/home">HOME</a>
									</li>
									<li class="breadcrumb-item">
										<a href="/patient/notice/list">공지사항</a>
									</li>
									<c:if test="${status ne 'u' }">
										<li class="breadcrumb-item active" aria-current="page">공지사항 등록</li>
									</c:if>
									<c:if test="${status eq 'u' }">
										<li class="breadcrumb-item active" aria-current="page">공지사항 수정</li>
									</c:if>
								</ol>
							</nav>
						</div>
					</div>
					<!-- Page Header Close -->
					<!-- 페이지 헤더 끝 -->
				</div>
					<!-- 본문의 본문 -->
					<!-- Start::row-1 -->
					<div class="row">

					<div class="card-body">

						<form method="post" id="patntNoticeForm" class="row g-3 mt-0" 
							action="/patient/notice/insert.do" enctype="multipart/form-data">
							
							<c:if test="${status eq 'u' }">
								<input type="hidden" name="patntNoticeNo" value="${notice.patntNoticeNo }">
							</c:if>
							<div class="row mb-3">
								<label for="patntNoticeWriter" class="col-md-2 col-form-label">작성자</label>
								<div class="col-sm-3">
									<input type="text" id="patntNoticeWriter" class="form-control"
										name="patntNoticeWriter" value="a001" readonly>
								</div>
							</div>

							<div class="row mb-3">
								<label for="patntNoticeTitle" class="col-md-2 col-form-label">제목</label>
								<div class="col-md-10 mb-3">
									<input type="text" id="patntNoticeTitle" class="form-control"
										name="patntNoticeTitle" value="${notice.patntNoticeTitle }">
								</div>
							</div>

							<div class="row mb-3">
								<label for="patntNoticeContent" class="col-md-2 col-form-label">내용</label>
								<div class="col-md-10 mb-3">
									<textarea id="patntNoticeContent" class="form-control"
										name="patntNoticeContent">${notice.patntNoticeContent }</textarea>
								</div>
							</div>

							<div class="row mb-3">
								<label for="patntNoticeFix" class="col-md-2 col-form-label">상단고정</label>
								<div class="col-md-10 mb-3">
									<input type="checkbox" id="patntNoticeFix" class="form-check-input"
										name="patntNoticeFix" value="Y" 
										${notice.patntNoticeFix == 'Y' ? 'checked' : ''}>
								</div>
							</div>

							<!-- 이미 첨부된 파일 조회 --><!-- 이미 첨부된 파일 조회 --><!-- 이미 첨부된 파일 조회 -->
							<!-- 이미 첨부된 파일 조회 --><!-- 이미 첨부된 파일 조회 --><!-- 이미 첨부된 파일 조회 -->
							<!-- 이미 첨부된 파일 조회 --><!-- 이미 첨부된 파일 조회 --><!-- 이미 첨부된 파일 조회 -->
							<c:if test="${status eq 'u' }">
								<div class="row mb-3">
									<label for="" class="col-md-2 col-form-label">기존 첨부파일</label>
									<div class="col-md-10 mb-3">
										<c:if test="${not empty notice.attachFileList}">
											<input type="hidden" value="${notice.attachmentGroupNo }" name="attachmentGroupNo" >
											<c:forEach items="${notice.attachFileList}" var="file" varStatus="status">
												<div style="padding:10px;">
													<p>파일 ${status.count}: <c:out value="${file.attachName}"></c:out> <a 
														href="/patient/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}" 
														target="_blank">(다운로드)</a></p>
														<a href="#" onclick="openImage('/patient/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}');
															return false;">
															<img src="/patient/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}" 
																class="image-preview">
														</a>
												</div>
											</c:forEach>
										</c:if>
									</div>
								</div>
							</c:if>
							<!-- 이미 첨부된 파일 조회 끝--><!-- 이미 첨부된 파일 조회 끝--><!-- 이미 첨부된 파일 조회 끝-->
							<!-- 이미 첨부된 파일 조회 끝--><!-- 이미 첨부된 파일 조회 끝--><!-- 이미 첨부된 파일 조회 끝-->
							<!-- 이미 첨부된 파일 조회 끝--><!-- 이미 첨부된 파일 조회 끝--><!-- 이미 첨부된 파일 조회 끝-->
							
							<!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 -->
							<!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 -->
							<!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 --><!-- 파일 첨부 구역 -->
							<div class="row mb-3">
								<label for="patntNoticeFile" class="col-md-2 col-form-label">첨부</label>
								<div class="col-md-10 mb-3">
									<input type="file" class="form-control" multiple="multiple"
										id="patntNoticeFile" name="patntNoticeFile"
										onchange="displaySelectedFiles()">
									<ul id="selectedFilesList" class="list-unstyled mt-2"></ul>
								</div>
							</div>
							<!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 -->
							<!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 -->
							<!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 --><!-- 파일 첨부 구역 끝 -->
							
								<sec:csrfInput />
						</form> <!-- [실시간 알림] from 끝 -->
					</div>

					<div class="card-footer">
						<div class="row">
							<div class="col-12" style="margin-top: 10px;">
								<button id="postBtn" type="button"
									class="btn btn-info" value="${btnText }">${btnText }</button>
									<!-- script에서 .val()로 불러오려면 button의 value로 넣어야 함 -->
									<!-- button의 이름으로 할 거면 .text() <- 공백 등으로 더 불안정 -->
								<c:if test="${status ne 'u' }">
									<button id="listBtn" id="listBtn" class="btn btn-info"
										onclick="location.href='/patient/notice/list'">list</button>
								</c:if>
								<c:if test="${status eq 'u' }">
									<button id="cancelBtn" id="cancelBtn" class="btn btn-info"
										onclick="location.href='/patient/notice/detail?patntNoticeNo=${notice.patntNoticeNo}'"
										>cancel</button>
								</c:if>
							</div>
						</div>
					</div>
					<!-- card-footer 끝 -->


				</div>
				<!--End::row-1 -->
				<!-- 본문의 본문 끝 -->

			</div>
		</div>
	</div>
	<!-- End::app-content -->
	<!--본문 끝-->

</div>

</div>
</body>
<script type="text/javascript">
//CK에디터 사용
$(function(){
	CKEDITOR.replace('patntNoticeContent', {
		filebrowserUploadUrl: '/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
// 		filebrowserUploadUrl: '/imageUpload.do'
	});
});
// 버튼 클릭 이벤트
$(function(){
	var noticeForm = $("#patntNoticeForm");
	var postBtn = $("#postBtn");

	// [실시간 알림] '등록/수정'버튼 클릭 이벤트
	postBtn.on("click", function(){
		console.log("postBtn click이벤트 들어옴");
		console.log("val: " + $(this).val());
		
		var title = $("#patntNoticeTitle").val();
		var ckContent = CKEDITOR.instances.patntNoticeContent.getData();
		
		if(title == null || title == ""){
			alert("제목이 입력되지 않았습니다.");
			$("#patntNoticeTitle").focus();
			return false;
		}
		
		if(ckContent == null || ckContent == "" || ckContent.length < 1){
			alert("내용이 입력되지 않았습니다.");
// 			$("#patntNoticeContent").focus();
			$(CKEDITOR.instances.patntNoticeContent).focus();
			return false;
		}
		
		console.log("val: " + $(this).val());
		console.log("text: " + $(this).text());
		// script에서 .val()로 불러오려면 button의 value로 넣어야 함
		// button의 이름으로 할 거면 .text() <- 공백 등으로 더 불안정
		
		// [실시간 알림??] '수정'버튼 클릭시 이벤트
		if($(this).val() == "수정"){
			console.log("postBtn '수정'");
			noticeForm.attr("action", "/patient/notice/update.do")
		}
		// [실시간 알림] 글 등록
		noticeForm.submit();
	});
	
});
// 새 창으로 이미지 띄우기
function openImage(imageUrl) {
	var newWindow = window.open("", "_blank");
	newWindow.document.write("<img src='" + imageUrl + "'/>");
	newWindow.document.close();
}
// 첨부할 파일 목록과 이미지 미리보기 띄우기
function displaySelectedFiles() {
	var fileList = document.getElementById('patntNoticeFile').files;
	var selectedFilesList = document.getElementById('selectedFilesList');
	selectedFilesList.innerHTML = ''; // 기존 미리보기를 모두 제거

	for (var i = 0; i < fileList.length; i++) {
		var file = fileList[i];
		if (file.type.match('image.*')) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var listItem = document.createElement('li');
				
				// 이미지 추가
				var image = document.createElement('img');
				image.src = event.target.result;
				image.classList.add('selected-image');
				listItem.appendChild(image);
				
				// 파일명 추가
				var fileNamePara = document.createElement('p');
				fileNamePara.textContent = 'File ' + (i + 1) + ': ' + file.name;
				listItem.appendChild(fileNamePara);
				
				selectedFilesList.appendChild(listItem);
			}
			reader.readAsDataURL(file);
		}
	}
}
</script>
</html>