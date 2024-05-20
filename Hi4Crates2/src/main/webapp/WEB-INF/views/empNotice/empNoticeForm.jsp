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

<c:set value="등록" var="btnText" />
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="btnText" />
</c:if>

<div class="page">

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
										<a href="/emp/home">직원 메인</a>
									</li>
									<li class="breadcrumb-item">
										<a href="/emp/notice/list">직원 공지사항</a>
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

						<form method="post" id="empNoticeForm" class="row g-3 mt-0" 
							action="/emp/notice/insert.do" enctype="multipart/form-data">
							
							<c:if test="${status eq 'u' }">
								<input type="hidden" name="empNoticeNo" value="${notice.empNoticeNo }">
							</c:if>
							<div class="row mb-3">
								<label for="empNoticeWriter" class="col-md-2 col-form-label">작성자</label>
								<div class="col-sm-3">
									<input type="text" id="empNoticeWriter" class="form-control"
										name="empNoticeWriter" value="${sessionScope.user.member.memName }" readonly>
								</div>
							</div>

							<div class="row mb-3">
								<label for="empNoticeTitle" class="col-md-2 col-form-label">제목</label>
								<div class="col-md-10 mb-3">
									<input type="text" id="empNoticeTitle" class="form-control"
										name="empNoticeTitle" value="${notice.empNoticeTitle }">
								</div>
							</div>

							<div class="row mb-3">
								<label for="empNoticeContent" class="col-md-2 col-form-label">내용</label>
								<div class="col-md-10 mb-3">
									<textarea id="empNoticeContent" class="form-control"
										name="empNoticeContent">${notice.empNoticeContent }</textarea>
								</div>
							</div>

							<div class="row mb-3">
								<label for="empNoticeFix" class="col-md-2 col-form-label">상단고정</label>
								<div class="col-md-10 mb-3">
									<input type="checkbox" id="empNoticeFix" class="form-check-input"
										name="empNoticeFix" value="Y" 
										${notice.empNoticeFix == 'Y' ? 'checked' : ''}>
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
														href="/emp/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}" 
														target="_blank">(다운로드)</a></p>
														<a href="#" onclick="openImage('/emp/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}');
															return false;">
															<img src="/emp/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}" 
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
								<label for="empNoticeFile" class="col-md-2 col-form-label">첨부</label>
								<div class="col-md-10 mb-3">
									<input type="file" class="form-control" multiple="multiple"
										id="empNoticeFile" name="empNoticeFile"
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
									<button id="listBtn" id="listBtn" class="btn btn-light"
										onclick="location.href='/emp/notice/list'">목록</button>
								</c:if>
								<c:if test="${status eq 'u' }">
									<button id="cancelBtn" id="cancelBtn" class="btn btn-light"
										onclick="location.href='/emp/notice/detail?empNoticeNo=${notice.empNoticeNo}'"
										>취소</button>
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


</body>
<script type="text/javascript">
//CK에디터 사용
$(function(){
	CKEDITOR.replace('empNoticeContent', {
// 		filebrowserUploadUrl: '/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
		filebrowserUploadUrl: '/imageUpload.do'
	});
});
// 버튼 클릭 이벤트
$(function(){
	var noticeForm = $("#empNoticeForm");
	var postBtn = $("#postBtn");

	// [실시간 알림] '등록/수정'버튼 클릭 이벤트
	postBtn.on("click", function(){
		console.log("postBtn click이벤트 들어옴");
		console.log("val: " + $(this).val());
		
		var title = $("#empNoticeTitle").val();
		var ckContent = CKEDITOR.instances.empNoticeContent.getData();
		
		if(title == null || title == ""){
			alert("제목이 입력되지 않았습니다.");
			$("#empNoticeTitle").focus();
			return false;
		}
		
		if(ckContent == null || ckContent == "" || ckContent.length < 1){
			alert("내용이 입력되지 않았습니다.");
// 			$("#empNoticeContent").focus();
			$(CKEDITOR.instances.empNoticeContent).focus();
			return false;
		}
		
		console.log("val: " + $(this).val());
		console.log("text: " + $(this).text());
		// script에서 .val()로 불러오려면 button의 value로 넣어야 함
		// button의 이름으로 할 거면 .text() <- 공백 등으로 더 불안정
		
		// [실시간 알림??] '수정'버튼 클릭시 이벤트
		if($(this).val() == "수정"){
			console.log("postBtn '수정'");
			noticeForm.attr("action", "/emp/notice/update.do")
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
	var fileList = document.getElementById('empNoticeFile').files;
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