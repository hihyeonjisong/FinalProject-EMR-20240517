<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<style>
.image-preview{
	max-height: 200px; /* 이미지의 최대 높이를 100px로 지정 */
	width: auto; /* 가로 너비는 자동으로 조정됨 */
}
</style>
<div class="page">
        <!-- 본문 시작 -->
        <!-- Start::app-content -->
 	<div class="main-content app-content">
		<div class="container-fluid">

			<div class="card-header">
                <!-- 페이지 헤더 -->
                <!-- Page Header -->
				<div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
					<h1 class="page-title fw-semibold fs-18 mb-0">공지사항</h1>
					<div class="ms-md-1 ms-0">
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="/emp/notice/list">list</a></li>
								<li class="breadcrumb-item active" aria-current="page">detail</li>
							</ol>
						</nav>
					</div>
				</div>
				<!-- Page Header Close -->
				<!-- 페이지 헤더 끝 -->
			</div>

			<!-- 본문의 본문 -->
			<!-- Start::row-1 -->
			<div class="card-body">
				<div class="row">
					<div class="table-responsive">
						<table border="1" class="table">
							<c:set value="${empNoticeVO }" var="detail" />
							<tr>
								<th colspan="8" style="text-align:center;">
									<h6>${detail.empNoticeTitle }</h6>
								</th>
							</tr>
							<tr>
								<th>
									작성자
								</th>
								<td>
									<span>${detail.empNoticeWriter }</span>
								</td>
								<th>
									작성일
								</th>
								<td>
									<span>${detail.empNoticeDate}</span>
								</td>
								<th>
									글번호
								</th>
								<td>
									<span>${detail.empNoticeNo }</span>
								</td>
								<th>
									조회수
								</th>
								<td>
									<span>${detail.empNoticeHit }</span>
								</td>
							</tr>
							<tr>
								<td colspan="8">
									<div style="padding:10px;">
										<span>${detail.empNoticeContent }</span>
									</div>
								</td>
							</tr>
							<!-- 첨부파일 표시 구역 --><!-- 첨부파일 표시 구역 --><!-- 첨부파일 표시 구역 -->
							<tr>
								<th width="150px;">
									첨부파일
								</th>
								<td colspan="7">
									<span>
										<c:if test="${not empty detail.attachFileList}">
											<c:forEach items="${detail.attachFileList}" var="file" varStatus="status">
												<div style="padding:10px;">
													<p>파일 ${status.count}: <c:out value="${file.attachName}"></c:out> <a 
														href="/emp/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}" 
														target="_blank">(다운로드)</a></p>
														<a href="#" onclick="openImage('/emp/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}');
															return false;" class="image-preview">
															<img src="/emp/notice/imageView.do?filePath=${file.attachLoc}${file.attachPath}&fileName=${file.attachName}" 
																class="image-preview">
														</a>
												</div>
											</c:forEach>
										</c:if>
									</span>
								</td>
							</tr>
							<!-- 첨부파일 표시 구역 끝 --><!-- 첨부파일 표시 구역 끝 --><!-- 첨부파일 표시 구역 끝 -->
						</table>
                   	</div>
                  </div>
			</div>
			<!--End::row-1 -->
			<!-- 본문의 본문 끝 -->

			<div class="card-footer" align="left">
			
<%-- 				<c:set var="admin" value="원무과"/> --%>
<%-- 				<c:if test="${admin eq sessionScope.user.member.empJob}"> --%>
				<sec:authorize access="hasRole('ROLE_SUPER') or hasRole('ROLE_ADMIN')">
					<button class="btn btn-info" id="editBtn"
						onclick="location.href='/emp/notice/update?empNoticeNo=${detail.empNoticeNo}'">수정</button>
					<button id="delBtn" class="btn btn-danger" type="button">삭제</button>
				</sec:authorize>
<%-- 				</c:if> --%>
					<button id="listBtn" class="btn btn-light"
						onclick="location.href='/emp/notice/list'">목록</button>
					<form action="/emp/notice/delete" method="post" id="delForm">
						<input type="hidden" name="empNoticeNo" value="${detail.empNoticeNo }"/>
						<input type="hidden" name="attachmentGroupNo" value="${detail.attachmentGroupNo }"/>
					</form>
					
			</div>
			<div class="card-footer" align="right">
			</div>
				
		</div>
	</div>
	<!-- End::app-content -->
	<!--본문 끝-->

</div>
    

</body>
<script type="text/javascript">
$(function(){
	var delBtn = $("#delBtn");
	
	delBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			delForm.submit();
		}
	});
});
</script>
</html>