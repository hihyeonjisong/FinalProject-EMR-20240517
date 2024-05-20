<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>


	<!-- 본문 시작 -->
	<!-- Start::app-content -->
	<div class="main-content app-content">
		<div class="container-fluid">

			<div class="card custom-card">

				<div class="card-header">
					<!-- 페이지 헤더 -->
					<!-- Page Header -->
					<div
						class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
						<h1 class="page-title fw-semibold fs-18 mb-0">직원 공지사항</h1>
					</div>
					<!-- Page Header Close -->
					<!-- 페이지 헤더 끝 -->
				</div>
				<!-- card-header 끝 -->

				<!-- 본문의 본문 -->
				<!-- Start::row-1 -->
				<div class="card-body">
					<div class="row">
						<div class="table-responsive">
							<table class="table text-nowrap table-sm">
								<thead>
									<tr style="text-align: center;">
										<th scope="col" class="col-sm-1">번호</th>
										<th scope="col">제목</th>
										<th scope="col" class="col-sm-2">작성자</th>
										<th scope="col" class="col-sm-2">등록일</th>
										<th scope="col" class="col-sm-1">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="${pagingVO.dataList }" var="empNoticeList" />
									<c:choose>
										<c:when test="${empty empNoticeList }">
											<tr style="text-align: center;">
												<td colspan="5">공지사항이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${empNoticeList }" var="notice" varStatus="status">
												<tr>
													<th scope="row" style="text-align: center;">
														<span class="badge bg-light text-dark">
															${notice.empNoticeNo }
														</span>
													</th>
													<td>
														<!-- 상세보기 링크 -->
														<a href="#" onclick="showDetail(${notice.empNoticeNo})"
														data-bs-toggle="modal" data-bs-target="#modalWindow"
														style="text-align:left;">
															${notice.empNoticeTitle}
														</a>
													</td>
													<td style="text-align: center;">
<!-- 														<span class="badge bg-light text-dark"> -->
															${notice.empNoticeWriter }
<!-- 														</span> -->
													</td>
													<td style="text-align: center;">
														<fmt:parseDate value="${notice.empNoticeDate }" var="dateValue" pattern="yyyy-MM-dd"/>
														<fmt:formatDate value="${dateValue }" pattern="yyyy-MM-dd"/>
													</td>
													<td style="text-align: center;">${notice.empNoticeHit }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div> <!-- table-responsive 끝 -->


					</div>


				</div> <!-- card-body 끝 -->
				<!--End::row-1 -->
				<!-- 본문의 본문 끝 -->

				<div class="card-footer">
					<div align="left" style="float:left;">
<%-- 					<c:set var="admin" value="원무과"/> --%>
<%-- 					<c:set var="master" value="의사"/> --%>
<%-- 					<c:if test="${admin eq sessionScope.user.member.empJob || master eq sessionScope.user.member.empJob}"> --%>
						<sec:authorize access="hasRole('ROLE_SUPER') or hasRole('ROLE_ADMIN')">
						<button class="btn btn-info" id="postBtn"
							onclick="location.href='/emp/notice/form'">등록</button>
						</sec:authorize>
<%-- 					</c:if> --%>
						<button id="listBtn" class="btn btn-light"
							onclick="location.href='/emp/notice/list'">목록</button>
					</div>


					<!-- 검색 공간 -->
					<div style="float:left;margin-left:10px;">
						<form class="row row-cols-lg-auto g-3 align-items-center"
							id="searchForm" method="post">
							<input type="hidden" name="page" id="page"/>
							<div class="input-group">
								<div class="col-3" style="margin-right:1px;">
									<label class="visually-hidden" for="searchType">검색 종류</label>
									<select class="form-select" id="searchType" name="searchType">
										<option value="title"
											<c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
										<option value="content"
											<c:if test="${searchType eq 'content' }">selected</c:if>>제목+내용</option>
										<option value="writer"
											<c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
									</select>
								</div>
								<div class="col-5" style="margin-right:1px;">
									<label class="visually-hidden"
										for="searchWord">검색</label>
									<input type="text" class="form-control"
										id="searchWord" name="searchWord" value="${searchWord }"
										placeholder="검색할 단어를 입력하세요">
								</div>

								<div class="col-4">
									<button type="submit" class="btn btn-info">
									<i class="fas fa-search"></i>검색</button>
								</div>
							</div>
							<sec:csrfInput />
						</form>
					</div>
					<!-- 검색 공간 끝 -->


					<div align="right" style="float:right;">
						<div align="right" id="pagingArea">
							${pagingVO.pagingHTML }
						</div>
					</div>
				</div>

			</div> <!-- custom-card 끝 -->
		</div> <!-- container-fluid 끝 -->
	</div> <!-- main-content app-content 끝 -->
	<!-- End::app-content -->
	<!--본문 끝-->


<!-- detail modal 공간 --><!-- detail modal 공간 --><!-- detail modal 공간 -->
<!-- detail modal 공간 --><!-- detail modal 공간 --><!-- detail modal 공간 -->
<!-- detail modal 공간 --><!-- detail modal 공간 --><!-- detail modal 공간 -->
<div class="modal fade" id="modalWindow" tabindex="-1"
	aria-labelledby="modalTitle" data-bs-keyboard="false"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
<!-- 				<span id="modalNo" class="modal-title"></span> -->
<!-- 				<span style="margin-left:5px; margin-right:5px;"> | </span> -->
				<h6 class="modal-title" id="modalTitle">
				</h6>
				<button type="button" class="btn-close"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header" id="modalInfo">
				<span id="modalWriter" class="badge bg-light text-dark"></span>
				<span style="margin-left:5px; margin-right:5px;"> | </span>
				<span id="modalDate" class="modal-title"></span>
				<span style="margin-left:5px; margin-right:5px;"> | </span>
				<span id="modalHit" class="modal-title"></span>
			</div>
			<div class="modal-body" id="modalBody">
				<div id="modalContent">
				</div>
			</div>
			<div class="modal-body">
				<div id="modalFiles"></div>
			</div>
			<div class="modal-footer">
<%-- 				<c:set var="admin" value="원무과"/> --%>
<%-- 				<c:set var="master" value="의사"/> --%>
<%-- 				<c:if test="${admin eq sessionScope.user.member.empJob || master eq sessionScope.user.member.empJob}"> --%>
					<sec:authorize access="hasRole('ROLE_SUPER') or hasRole('ROLE_ADMIN')">
					<button id="modBtn" type="button" class="btn btn-info">수정</button>
					<button id="delBtn" type="button" class="btn btn-danger">삭제</button>
					</sec:authorize>
<%-- 				</c:if> --%>
				<button type="button" class="btn btn-light"
					data-bs-dismiss="modal">닫기</button>
				<form action="/emp/notice/delete.do" method="post" id="delForm">
					<input type="hidden" name="empNoticeNo" value="${detailNo }"
						id="modalInput"/>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- detail modal 공간 끝 --><!-- detail modal 공간 끝 --><!-- detail modal 공간 끝 -->
<!-- detail modal 공간 끝 --><!-- detail modal 공간 끝 --><!-- detail modal 공간 끝 -->
<!-- detail modal 공간 끝 --><!-- detail modal 공간 끝 --><!-- detail modal 공간 끝 -->


<!-- form modal 공간 --><!-- form modal 공간 --><!-- form modal 공간 -->
<!-- form modal 공간 --><!-- form modal 공간 --><!-- form modal 공간 -->
<!-- form modal 공간 --><!-- form modal 공간 --><!-- form modal 공간 -->
<!-- form modal 공간 --><!-- form modal 공간 --><!-- form modal 공간 -->
<!-- form modal 공간 --><!-- form modal 공간 --><!-- form modal 공간 -->
<div class="modal fade" id="modalEdit" tabindex="-1"
	aria-labelledby="modalEditTitle" data-bs-keyboard="false"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div id="modalEditTitle">
					<h6 class="modal-title">공지사항 등록</h6>
				</div>
				<button type="button" class="btn-close"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<div class="modal-body" id="modalEditBody">
				<form method="post" id="empNoticeEditForm" class="row g-3 mt-0"
					action="/emp/notice/edit.do" enctype="multipart/form-data">
					<input type="hidden" name="empNoticeNo" id="empNoticeEditNo" value="${detailNo }">
					<div class="row mb-3">
						<label for="empNoticeEditWriter" class="col-md-2 col-form-label">작성자</label>
						<div class="col-sm-3">
							<input type="text" id="empNoticeEditWriter" class="form-control"
								name="empNoticeWriter">
						</div>
					</div>

<!-- 						<div class="row mb-3"> -->
					<div class="input-group mb-3">
						<label for="empNoticeEditTitle" class="col-md-2 col-form-label">제목</label>
						<div class="col-md-10 mb-3">
							<input type="text" id="empNoticeEditTitle" class="form-control"
								name="empNoticeTitle">
						</div>
					</div>

					<div class="input-group mb-3">
						<label for="empNoticeEditContent" class="col-md-2 col-form-label">내용</label>
						<div class="col-md-10 mb-3">
							<textarea id="empNoticeEditContent" class="form-control"
								name="empNoticeContent" rows="10">${detailContent }</textarea>
						</div>
					</div>
					
					<div class="input-group mb-3">
						<label for="empNoticeEditFix" class="col-md-2 col-form-label">상단고정</label>
						<div class="col-md-10 mb-3">
							<input type="checkbox" id="empNoticeEditFix" class="form-check-input"
								name="empNoticeFix" value="Y"
								${detailFix == 'Y' ? 'checked' : ''}>
						</div>
					</div>

					<!-- 파일 첨부 구역 -->
					<div class="input-group mb-3">
						<label for="empNoticeFile" class="col-md-2 col-form-label">첨부</label>
<!-- 							<label for="empNoticeFile" class="input-group-text">첨부</label> -->
						<div class="col-md-10 mb-3">
<!-- 								<input type="file" class="custom-file-input" multiple="multiple" -->
							<input type="file" class="form-control" multiple="multiple"
								id="empNoticeFile" name="empNoticeFile">
						</div>
					</div>
					<!-- 파일 첨부 구역 끝 -->


					<!-- 수정시 기본 파일 목록 보이기: ajax 처리에 포함시키기 -->
					<!-- '// 파일 추가할 것'으로 표시함 -->
					<!-- (수정시) 기존 파일 구역 -->
					<div id="modifyEmpNoticeFile"></div>
					<!-- (수정시) 기존 파일 구역 끝-->



					<sec:csrfInput />
				</form>
			</div>

			<div class="modal-footer">
				<div id="modalPostBtn">
					<button id="postEditBtn" type="button" class="btn btn-info"
						onclick="editDetail(${detailNo})" data-bs-dismiss="modal">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- form modal 공간 끝 --><!-- form modal 공간 끝 --><!-- form modal 공간 끝 -->
<!-- form modal 공간 끝 --><!-- form modal 공간 끝 --><!-- form modal 공간 끝 -->
<!-- form modal 공간 끝 --><!-- form modal 공간 끝 --><!-- form modal 공간 끝 -->

<script src="${pageContext.request.contextPath }/resources/js/empNoticePaging.js"></script>

<script type="text/javascript">
// CK에디터 사용
$(function(){
	CKEDITOR.replace('empNoticeEditContent', {
// 		filebrowserUploadUrl: '/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
		filebrowserUploadUrl: '/imageUpload.do'
	});
});
// 전역변수
var detailNo;
var detailTitle;
var detailContent;
var detailWriter;
var detailDate;
var detailFix;
var detailHit;
var detailFileNo;
var detailFiles;

//'등록' form 보기
//wrtBtn(등록) 버튼 클릭시 작동
$(function(){
	var wrtBtn = $("#wrtBtn");

	wrtBtn.on("click", function(){
		$.ajax({
			type: "get",
			url: "/emp/notice/reset.do",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(),
			beforeSend: function(xhr) {
	            // CSRF 토큰 헤더에 추가
	           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success: function(result){
				console.log("[새글등록창] ajax 성공");

				console.log("[새글등록창] result: " + result);
				if(result == null || result == ""){
					console.log("[새글등록창] if절 내부 | result: " + result);
					// modal 제목 교체
					$("#modalEditTitle").html("<h6 class='modal-title'>공지사항 등록</h6>");

					// 작성자명 비우기
					$("#empNoticeEditWriter").val("");
					// 제목입력칸 비우기
					$("#empNoticeEditTitle").val("");
					// 본문입력칸 비우기
					CKEDITOR.instances.empNoticeEditContent.setData("");
					// 파일 추가할 것: 파일첨부칸 비우기
					$("#empNoticeFile").val("");

					// 글등록 버튼: onclick에 등록처리 함수 추가
					$("#modalPostBtn").html(
						"<button id='postEditBtn' type='button' class='btn btn-info' onclick='insertDetail()' data-bs-dismiss='modal'>등록</button>"
					);
				}
				$("#modalEdit").modal("show");
			},
			error: function(xhr, status, error){
				alert("글 등록창을 열지 못했습니다. 다시 시도해주세요.");
			}
		});
	});
});

//새 글 등록 처리
function insertDetail() {
	var ckContent = CKEDITOR.instances.empNoticeEditContent.getData();
	console.log("[등록처리] ckContent: " + ckContent);

	var fixed = $("#empNoticeEditFix").is(":checked") ? "Y" : "N";
	console.log("[등록처리] 상단고정?: " + fixed);

	// FormData 사용
	var formData = new FormData();

	// 파일 추가
	var fileInput = document.getElementById('empNoticeFile');
	for (var i = 0; i < fileInput.files.length; i++){
		formData.append('empNoticeFile', fileInput.files[i]);
	}

	console.log("[등록처리] formData: " + formData);

	// 다른 데이터 추가
	formData.append("empNoticeWriter", $("#empNoticeEditWriter").val());
	formData.append("empNoticeTitle", $("#empNoticeEditTitle").val());
	formData.append("empNoticeContent", ckContent);
	formData.append("empNoticeFix", fixed);

	console.log("[등록처리] ajax 직전 formData: " + formData);

	// AJAX
	$.ajax({
		type: "post",
		url: "/emp/notice/create.do",
		data: formData,
		processData: false,
		contentType: false,
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success: function(data) {
			if(data === "upload_success"){
				alert("새로운 공지사항을 등록했습니다.");
				console.log("[등록처리] data: " + data);
				location.href="/emp/notice/list";
			}else{

			}
// 				showDetail(data.empNoticeNo);
		},
		error: function(){
			alert("새 글이 정상적으로 등록되지 않았습니다. 확인하시고 다시 시도해주세요.");
			console.error("[등록처리] 오류: ", xhr, status, error);
		}
	});
}

// 상세보기
//상세 정보를 modal에 표시하는 함수
function showDetail(empNoticeNo) {
	// AJAX를 사용하여 empNoticeNo에 해당하는 상세 정보를 가져옴
	console.log("showDetail 시작");
	$.ajax({
		type: "GET",
		url: "/emp/notice/detail.do",
		data: { empNoticeNo: empNoticeNo },
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success: function(data) {
			detailNo = data.empNoticeNo;
			detailTitle = data.empNoticeTitle;
			detailContent = data.empNoticeContent;
			detailWriter = data.empNoticeWriter;
			detailDate = data.empNoticeDate;
			detailFix = data.empNoticeFix;
			detailHit = data.empNoticeHit;

			if(data.attachmentGroupNo != null){
				detailFileNo = data.attachmentGroupNo;
				detailFiles = data.attachFileList;	// 첨부파일 정보 받아오기

				console.log("[showDetail]detailFileNo? " + detailFileNo);
				console.log("[showDetail]detailFiles? " + detailFiles);
			}
			// detailFileNo로 파일 가져오기

			// 가져온 데이터를 modal에 표시
			$("#modalTitle").text(detailTitle);
// 			$("#modalBody").text(detailContent);
			$("#modalWriter").text(detailWriter);
			$("#modalDate").text(detailDate);
			$("#modalHit").text(detailHit);
			$("#modalContent").html(detailContent);
// 			$("#modalNo").text(data.empNoticeNo);
			$("#modalFiles").html("");	// 칸 비우기(임시)
			// 파일 추가할 것
			if(detailFileNo != null && detailFiles.length > 0){
				console.log("[showDetail]detailFileNo != null 조건 충족");

				// 파일명 목록
				var fileListHTML = "<ul class='list-group'>";
				detailFiles.forEach(function(file){
					// 파일 경로 생성
					var filePaths = file.attachLoc + file.attachPath; 
					// gat 방식으로 이미지 경로와 파일명을 넘겨서 호출을 한다.
					var callImageUrl = "/emp/notice/imageView.do?filePath=" + filePaths + "&fileName=" + file.attachName;
					
					// 파일에 접근할 수 있는 링크 생성
					fileListHTML += '<li class="list-group-item">';
					fileListHTML += 	'<a href="' + callImageUrl + '">';
					fileListHTML += 		'<i class="bx bx-box"></i> ' ;
					fileListHTML += 		file.attachName
					fileListHTML += 		'<br>'
					fileListHTML += 		'<img src="' + callImageUrl +'" height="100" width="auto">'
					fileListHTML += 	'</a>';
					fileListHTML += '</li>';
					console.log("[showDetail]file.attachName: " + file.attachName);
					console.log("[showDetail]file.attachPath: " + file.attachPath);

				});
				fileListHTML += "</ul>";

				$("#modalFiles").html(
						// 구역 표시
						"<div class='modal-footer'>"
						// 파일 목록 출력
						+ "<span>"
						+ fileListHTML
						+ "</span>"
						+ "</div>"
				);
			}else{
				console.log("[showDetail]detailFileNo != null 조건 불충족(else)");
				$("modalFiles").html("");
			}

			console.log("[showDetail]detailNo: " + detailNo);
// 			console.log("[showDetail]detailTitle: " + detailTitle);

			$("#modBtn").click(function(){
				var empNoticeNo = $("#modalNo").text();
// 				window.location.href = "/emp/notice/detail?empNoticeNo=" + data.empNoticeNo;
				window.location.href = "/emp/notice/update?empNoticeNo=" + data.empNoticeNo;
			});
		},	// success 닫기
		error: function(){
			alert("공지사항 상세정보를 불러오는 데에 실패했습니다. 다시 시도해주세요.");
		}
	});
}
// showDetail 끝

// 수정form
// detail 안에서 editBtn 클릭시 작동
$(function(){
	// 수정 창 모달로 열었을 때 input칸 채워두기
	var editBtn = $("#editBtn");

	editBtn.on("click", function(){
		var editNo = $("#empNoticeEditNo").val(detailNo);
		console.log( "[editBtn 온클릭이벤트] editNo: " + editNo.val() );

		$.ajax({
			type: "get",
			url: "/emp/notice/status.do",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(),
			success: function(result){
				console.log("수정폼 ajax 성공");

				// status에 따라 modal 내용(글자) 바꾸는 코드를 여기에 넣어야 함
				// 예: 공지사항 수정 ("#modalEditTitle")
				console.log("result: " + result);
				if(result === 'u'){
					console.log("[글수정][if절 내부] result: " + result);
					console.log("[글수정]u체크 if절 내부: editNo.val(): " + editNo.val());
					// 서버에 수정사항 요청하는 내부 ajax 작성:
					// detail 출력할 때 사용한 ajax 가져옴
					$.ajax({
						type: "GET",
						url: "/emp/notice/detail.do",
						data: { empNoticeNo: editNo.val() },
						beforeSend: function(xhr) {
				            // CSRF 토큰 헤더에 추가
				           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
						},
						success: function(data) {
							console.log("수정form 두 번째 ajax 실행!")
							detailNo = data.empNoticeNo;
							detailTitle = data.empNoticeTitle;
							detailContent = data.empNoticeContent;
							detailWriter = data.empNoticeWriter;
							detailDate = data.empNotic_eDate;
							detailFix = data.empNoticeFix;
							detailHit = data.empNoticeHit;
							detailFiles = data.attachFileList;
							console.log("[수정폼ajax2] detailNo: " + detailNo);
							console.log("[수정폼ajax2] detailTitle: " + detailTitle);
							console.log("[수정폼ajax2] detailContent: " + detailContent);
							console.log("[수정폼ajax2] detailFiles: " + detailFiles);

							// 가져온 데이터를 modal에 표시
							$("#empNoticeEditWriter").val(detailWriter);
							$("#empNoticeEditTitle").val(detailTitle);
							CKEDITOR.instances.empNoticeEditContent.setData(detailContent);
							// 상단 고정 옵션
							$("#empNoticeEditFix").prop('checked', detailFix === "Y" ? true : false )
							
							// modal에 이미 첨부되어 있는 파일 목록 보이기
							if(detailFiles != null && detailFiles.length > 0){
								console.log("[글수정]detailFiles: " + detailFiles);

								var fileCard;
// 								fileCard += '<div class="row">'
// 								fileCard += 	'<div class="col-xl-12">';
// 								fileCard += 		'<div class="row row-cols-1 row-cols-md-4 g-4">';
								
								detailFiles.forEach(function(file){
									var filePaths = file.attachLoc + file.attachPath;
									var callImageUrl = "/emp/notice/imageView.do?filePath=" + filePaths + "&fileName=" + file.attachName;
									
									fileCard += 			'<div class="col col-sm-3">';
									fileCard += 				'<div class="card custom-card">';
									fileCard += 					'<img src="' + callImageUrl + '" class="card-img-top">';
									fileCard += 					'<div class="card-body">';
									fileCard += 						'<h6 class="card-title fw-semibold">' + file.attachName + '</h6>';
									fileCard += 						'<p class="card-text">'
									fileCard +=								'<ul class="list-group">'
									fileCard +=									'<li>'
									fileCard +=										'Type: ' + file.attachType
									fileCard +=									'</li>'
									fileCard +=									'<li>'
									fileCard += 									'Size: ' + file.attachSize + ' byte'
									fileCard +=									'</li>'
									fileCard +=									'<li>'
									fileCard +=										file.attachDate
									fileCard +=									'</li>'
									fileCard +=								'</ul>'
									fileCard += 						'</p>';
									fileCard += 					'</div>';
									fileCard += 				'</div>';
									fileCard += 			'</div>';
// 									console.log("[글수정]fileCard: " + fileCard);
								});	// forEach 종료
								
// 								fileCard += 		'</div>';
// 								fileCard += 	'</div>';
// 								fileCard += '</div>';
								
								$("#modifyEmpNoticeFile").html(
										'<div class="row">'
											+ '<div class="col-xl-12">'
												+ '<div class="row row-cols-1 row-cols-md-4 g-4">'
													+ fileCard
												+ '</div>'
					 						+ '</div>'
			 							+ '</div>'
										);
							}	// if (첨부파일이 있다면) 종료
												
						},	// success 끝
						error: function(){
							console.log("[수정폼ajax2] 에러 발생!")
							alert("기존 게시글 내용을 불러오지 못했습니다. 다시 시도해주세요.");
						}
					});	// 내부 ajax 종료

					// form 형태 처리
					// modal title 변경
					$("#modalEditTitle").html("<h6 class='modal-title'>공지사항 수정</h6>");
					// modal 등록 버튼을 수정 버튼으로 변경
					$("#modalPostBtn").html("<button id='postEditBtn' type='button' class='btn btn-info' onclick='editDetail(${detailNo})' data-bs-dismiss='modal'>수정</button>");
					// (임시) 작성자명 readonly 설정
					$("#empNoticeEditWriter").html("<input type='text' id='empNoticeEditWriter' class='form-control' name='empNoticeWriter' readonly>");
					// 제목입력칸 비우기
					$("#empNoticeEditTitle").html("<input type='text' id='empNoticeEditTitle' class='form-control' name='empNoticeTitle' value=''>");
					// 파일 추가할 것?
					
				}	// if(result === 'u') 닫기

				// 수정용 form 있는 modal 창 띄우기
				$("#modalEdit").modal("show");
			},	// success 닫기
			error: function(xhr, status, error){
				alert("수정창 열기에 실패했습니다. 다시 시도해주세요.");
			}	// error 닫기
		});	// ajax 닫기
	});	// editBtn 클릭이벤트 닫기
});	//function 닫기

// 수정처리
// ajax로 수정기능 구현 (modal창용)
function editDetail(empNoticeNo) {
	// getData: id로 값을 가져오므로 ()안에 값 들어가면 X
	var ckContent = CKEDITOR.instances.empNoticeEditContent.getData();
	console.log("[수정처리] ckContent: " + ckContent);

	var fixed = $("#empNoticeEditFix").is(":checked") ? "Y" : "N";
	console.log("[수정처리] 상단고정?: " + fixed);

	var empNoticeVO = {
		empNoticeNo: $("#empNoticeEditNo").val(),
		empNoticeWriter: $("#empNoticeEditWriter").val(),
		empNoticeTitle: $("#empNoticeEditTitle").val(),
		empNoticeContent: ckContent,
// 		empNoticeFix: $("#empNoticeEditFix").is(":checked") ? "Y" : "N"
		empNoticeFix: fixed
		// 파일 추가할 것
	};

	$.ajax({
		type: "post",
		url: "/emp/notice/edit.do",
		data: JSON.stringify(empNoticeVO),
		contentType: "application/json",
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success: function(data) {
			alert("게시글을 수정했습니다.");
			console.log("data: " + data);
			location.href="/emp/notice/list";

// 			setTimeout(function(){
// 				showDetail(data.empNoticeNo);
// 			}, 1000);
		},
		error: function(){
			alert("글 수정에 실패했습니다.");
		}
	});
}


// 게시글 삭제 처리
$(function(){
	var delBtn = $("#delBtn");
	delBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
// 			$("#delForm").submit();
			var empNoticeNo = detailNo;
			var attachmentGroupNo = detailFileNo;
			console.log("empNoticeNo: " + empNoticeNo);

			$.ajax({
				type: "post",
				url: "/emp/notice/delete.do",
				data: {empNoticeNo: empNoticeNo,
					attachmentGroupNo: attachmentGroupNo},
				beforeSend: function(xhr) {
		            // CSRF 토큰 헤더에 추가
		           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success: function(response){
					alert("삭제되었습니다.");
					location.href="/emp/notice/list";
				},
				error: function(xhr, status, error){
					alert("삭제에 실패했습니다. 다시 시도해주세요.");
				}
			});
		} // if(confirm) 끝
	});
});

//새 글 등록 처리
// function insertDetail() {
// 	var ckContent = CKEDITOR.instances.empNoticeEditContent.getData();
// 	console.log("[등록처리] ckContent: " + ckContent);

// 	var fixed = $("#empNoticeEditFix").is(":checked") ? "Y" : "N";
// 	console.log("[수정처리] 상단고정?: " + fixed);

// 	var empNoticeVO = {
// 		empNoticeNo: $("#empNoticeEditNo").val(),
// 		empNoticeWriter: $("#empNoticeEditWriter").val(),
// 		empNoticeTitle: $("#empNoticeEditTitle").val(),
// 		empNoticeContent: ckContent,
// 		empNoticeFix: fixed,
// 		empNoticeFile: $("#empNoticeFile")[0].files[0]
// 	};
// // 		empNoticeFix: $("#empNoticeEditFix").is(":checked") ? "Y" : "N"

// 	$.ajax({
// 		type: "post",
// 		url: "/emp/notice/create.do",
// 		data: JSON.stringify(empNoticeVO),
// 		contentType: "application/json",
// 		success: function(data) {
// 			alert("새로운 공지사항을 등록했습니다.");
// 			console.log("[새글등록] data: " + data);
// 			location.href="/emp/notice/list";
// // 				showDetail(data.empNoticeNo);
// 		},
// 		error: function(){
// 			alert("새 글 등록 실패! 다시 시도해주세요.");
// 		}
// 	});
// }


//상세보기 백업
//상세 정보를 modal에 표시하는 함수
// function showDetail(empNoticeNo) {
// 	// AJAX를 사용하여 empNoticeNo에 해당하는 상세 정보를 가져옴
// 	console.log("showDetail 시작");
// 	$.ajax({
// 		type: "GET",
// 		url: "/emp/notice/detail.do",
// 		data: { empNoticeNo: empNoticeNo },
// 		success: function(data) {
// 			detailNo = data.empNoticeNo;
// 			detailTitle = data.empNoticeTitle;
// 			detailContent = data.empNoticeContent;
// 			detailWriter = data.empNoticeWriter;
// 			detailDate = data.empNoticeDate;
// 			detailFix = data.empNoticeFix;
// 			detailHit = data.empNoticeHit;
// 			if(data.attachmentGroupNo != null){
// 				detailFileNo = data.attachmentGroupNo;
// 			}
// 			console.log("detailFileNo? " + detailFileNo);
// 			// detailFileNo로 파일 가져오기
// 			$.ajax({
// 				type: "GET",
// 				url: "/emp/notice/detailFile.do",
// 				data: { attachmentGroupNo: detailFileNo },
// 				success: function(fileData){
// 					// 반환: attachmentVO
// 					console.log("[showDetail] detailFile.do 성공");
// 					// 파일이 배열 형태로 반환될 경우
// 					if(Array.isArray(fileData)){
// 						// 배열의 각 요소에 대해 반복하여 파일 정보를 처리
// 						fileData.forEach(function(attachmentVO){
// 							// 파일 정보를 화면에 출력하거나 처리하는 코드 자리
// 							// 파일명 출력:
// 							console.log("[파일배열] 파일번호: " + attachmentVO.attachNo);
// 							console.log("[파일배열] 파일명: " + attachmentVO.attachName);
// 							console.log("[파일배열] 파일타입: " + attachmentVO.attachType);
// 							console.log("[파일배열] 파일크기: " + attachmentVO.attachSize);
// 							detailFiles += fileData.attachName;
// 						});
// 					}else{
// 						// 파일이 단일 객체로 반환된 경우
// 						// 파일 정보 처리 코드 자리
// 						console.log("[단일파일] 파일번호: " + attachmentVO.attachNo);
// 						console.log("[단일파일] 파일명: " + attachmentVO.attachName);
// 						console.log("[단일파일] 파일타입: " + attachmentVO.attachType);
// 						console.log("[단일파일] 파일크기: " + attachmentVO.attachSize);
// 						detailFiles = fileData.attachName;
// 					}

// 				},
// 				error: function(){
// 					alert("첨부파일 정보를 불러오는 데에 실패했습니다. 다시 시도해주세요.")
// 					console.log("[showDetail] detailFile.do 실패");
// 				}
// 			});


// 			// 가져온 데이터를 modal에 표시
// 			$("#modalTitle").text(detailTitle);
// //			$("#modalBody").text(detailContent);
// 			$("#modalWriter").text(detailWriter);
// 			$("#modalDate").text(detailDate);
// 			$("#modalHit").text(detailHit);
// 			$("#modalContent").html(detailContent);
// //			$("#modalNo").text(data.empNoticeNo);
// 			// 파일 추가할 것
// 			if(detailFileNo != null){
// 				$("modalFiles").html(
// 						"<div class='modal-footer'>"
// 						// 더 상세한 태그로 바꿀 것
// 						+ "<span>"
// 						+ '<i class="bx bx-ICON_NAME"></i>'
// 						+ $(detailFiles)
// 						+ "</span>"
// 						+ "</div>"
// 				);
// 			}else{
// 				$("modalFiles").html("");
// 			}

// 			console.log("detailNo: " + detailNo);
// 			console.log("detailTitle: " + detailTitle);

// 			$("#modBtn").click(function(){
// 				var empNoticeNo = $("#modalNo").text();
// 				window.location.href = "/emp/notice/detail?empNoticeNo=" + data.empNoticeNo;
// 			})
// 		},
// 		error: function(){
// 			alert("공지사항 상세정보를 불러오는 데에 실패했습니다. 다시 시도해주세요.");
// 		}
// 	});
// }
//showDetail 끝
</script>
