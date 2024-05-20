<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="page">


	<!-- Start::app-content -->
	<div class="main-content app-content">
		<div class="container-fluid">

			<!-- Page Header -->
			<div class="d-md-flex d-block align-items-center justify-content-center my-4 page-header-breadcrumb">
				<h1 class="page-title fw-semibold fs-18 mb-0" style="font-size: xx-large;">공지사항</h1>
			</div>
			<!-- Page Header Close -->

			<!-- Start::row-1 -->
			<div class="row">
				<div class="col-xl-12">
					<div class="d-flex justify-content-center align-items-center" style="width: 100%; height: 100vh;">
						<div class="card custom-card overflow-hidden" style="width: 80%; height: 90%;">
							<div class="card-header justify-content-between">
								<div class="card-title" style="font-size: large;">
								  	  공지사항을 확인해주세요.
								</div>
								<div class="d-flex flex-wrap gap-2">
									<div>
										<input class="form-control form-control-sm" type="text" placeholder="검색어를 입력해주세요." aria-label=".form-control-sm example">
									</div>
								</div>
							</div>
				<div class="card-body p-0">
					<div class="table-responsive">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty noticeList }">
										<tr>
											<td colspan="4">조회하신 게시글이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${noticeList }" var="notice">
											<tr>
												<td>${notice.patntNoticeNo }</td>
												<td><a
													href="/crud/board/read?boardNo=${notice.patntNoticeNo }">
														${notice.patntNoticeTitle } </a></td>
												<td>${fn:substring(notice.patntNoticeDate, 0, 10)}</td>
												<td>${notice.patntNoticeHit }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer border-top-0 d-flex justify-content-center">
								<div class="d-flex align-items-center flex-wrap overflow-auto">
									<div class="ms-auto">
										<ul class="pagination mb-0 overflow-auto">
											<li class="page-item disabled">
												<a class="page-link">Previous</a>
											</li>
											<li class="page-item active" aria-current="page"><a class="page-link" href="javascript:void(0);">1</a></li>
											<li class="page-item">
												<a class="page-link" href="javascript:void(0);">2</a>
											</li>
											<li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
											<li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
											<li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
											<li class="page-item">
												<a class="page-link" href="javascript:void(0);">Next</a>
											</li>
										</ul>
									</div>
								</div>
								<div>
									<button class="btn btn-primary">글쓰기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--End::row-1 -->

		</div>
	</div>
	<!-- End::app-content -->
</div>

	
<!-- Scroll To Top -->
<div class="scrollToTop">
	<span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
</div>
<div id="responsive-overlay"></div>
<!-- Scroll To Top -->

