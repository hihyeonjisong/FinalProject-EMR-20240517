<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.noto {
	font-family: "Noto Sans KR", sans-serif;
    font-optical-sizing: auto;
    font-style: normal;
}

.side-menu__item {
    display: flex;
    align-items: center;
}

.side-menu__label {
    margin-left: 10px; /* 아이콘과 텍스트 사이의 간격 조정 */
}
.app-sidebar .side-menu__item.active{
	font-weight: 1000 !important;
    background-color: rgb(196 231 255) !important;
}

</style>
<aside class="app-sidebar sticky noto" id="sidebar" style="width: 165px;">
	<div class="main-sidebar-header" style="width: 165px;">
		<a href="/home" class="header-logo"> 
		<img src="${pageContext.request.contextPath }/resources/assets/logo/좌우조합형_black.png"	alt="logo" class="desktop-logo" style="height: 3rem">
<!-- 			 <img -->
<%-- 			src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/toggle-logo.png" --%>
<!-- 			alt="logo" class="toggle-logo"> <img -->
<%-- 			src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/desktop-dark.png" --%>
<!-- 			alt="logo" class="desktop-dark"> <img -->
<%-- 			src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/toggle-dark.png" --%>
<!-- 			alt="logo" class="toggle-dark"> <img -->
<%-- 			src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/desktop-white.png" --%>
<!-- 			alt="logo" class="desktop-white"> <img -->
<%-- 			src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/toggle-white.png" --%>
<!-- 			alt="logo" class="toggle-white"> -->
		</a>
	</div>
	<!-- Start::main-sidebar -->
	<div class="main-sidebar" id="sidebar-scroll">

		<!-- Start::nav -->
		<nav class="main-menu-container nav nav-pills flex-column sub-open">
			<div class="slide-left" id="slide-left">
				<svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24"
					height="24" viewBox="0 0 24 24"> <path
						d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"></path> </svg>
			</div>
			<!-- 사이드바 시작 -->
			<ul class="main-menu">
				
				<!-- 홈 사이드 -->
				<li class="slide has-sub">
					<a href="/admin/main" class="side-menu__item">
						<i class="bx bx-home side-menu__icon"></i>
						<span class="side-menu__label">홈</span>
					</a>
					<ul class="slide-menu child1">
					</ul>
				</li>
				<!-- /홈 사이드 -->
				
				<!-- 마이페이지 사이드 -->
				<li class="slide has-sub">
					<a href="/mypage/${sessionScope.user.member.memNo }" class="side-menu__item"> 
						<i class='bx bxs-face side-menu__icon'></i>
						<span class="side-menu__label">마이페이지</span> 
					</a>
					<ul class="slide-menu child1">
					</ul>
				</li>
				<!-- /마이페이지 사이드 -->
				<!-- 접수/예약 사이드 -->
				<li class="slide has-sub"><a href="javascript:void(0);" 
					class="side-menu__item" style="padding-top: 5px; padding-bottom: 7px;padding-left: 13px;">
					<i class="bi bi-receipt-cutoff" style="font-size:17px;"></i>
					 &nbsp;&nbsp;&nbsp;
					 <span
						class="side-menu__label">접수/예약</span> <i
						class="fe fe-chevron-right side-menu__angle"></i>
				</a>
					<ul class="slide-menu child1">
						<li class="slide"><a href="/admin/receiptForm"
							class="side-menu__item">접수</a></li>
						<li class="slide"><a href="/admin/reserveForm"
							class="side-menu__item">예약</a></li>
					</ul></li>
				<!-- /접수/예약 사이드 -->
				
				<!-- 진료 차트 사이드 -->				
				<li class="slide has-sub">
					<a href="javascript:void(0);" class="side-menu__item"> 
						<i class="bi bi-clipboard2-pulse side-menu__icon" style="margin-top: -9px;"></i> 
						<span class="side-menu__label">진료 차트</span> 
						<i class="fe fe-chevron-right side-menu__angle"></i>
					</a>
					<ul class="slide-menu child1">
						<li class="slide">
							<a href="/doctor/mainChart" class="side-menu__item">메인 차트</a>
						</li>
						<li class="slide">
							<a href="/orderSet/main" class="side-menu__item">오더 세트</a>
						</li>
					</ul>
				</li>
				<!-- 화상회의 -->
				<li class="slide has-sub">
					<a href="/doctor/meeting/treeView" class="side-menu__item" style="padding-top: 7px; padding-bottom: 5px;padding-left: 13px;"> 
<!-- 						<i class="ri-video-chat-line" style="font-size:22px;"></i> -->
						<i class="bi bi-person-video" style="font-size:18px;"></i> 
						<span class="side-menu__label" style="margin-left: 19px;">화상 회의</span> 
					</a>
					<ul class="slide-menu child1">
					</ul>
				</li>
				<!-- /화상회의 사이드 -->

				<!-- Start::slide -->
				<li class="slide has-sub"><a href="javascript:void(0);"
					class="side-menu__item"> <i class="bx bxs-radiation side-menu__icon"></i>
						<span class="side-menu__label">방사선실</span> <i
						class="fe fe-chevron-right side-menu__angle"></i>
				</a>
					<ul class="slide-menu child1">
						<li class="slide"><a href="/radiation/main" class="side-menu__item">메인</a></li>
						<li class="slide"><a href="/radiation/equipmentList" class="side-menu__item">장비조회</a></li>
					</ul>
				</li>
				
				
				<li class="slide has-sub"><a href="javascript:void(0);"
					class="side-menu__item"> <i class="bx bx-task side-menu__icon"></i>
						<span class="side-menu__label">물리치료실</span> <i
						class="fe fe-chevron-right side-menu__angle"></i>
				</a>
					<ul class="slide-menu child1">
					<li class="slide has-sub"><a href="/emp/physical/main"
							class="side-menu__item">물리치료실</a></li>
					<li class="slide has-sub"><a href="/emp/physical/equipmentList"
							class="side-menu__item">장비조회</a></li>
					</ul>
				</li>
				<!-- End::slide -->
				
					<!-- Start::slide -->
				<li class="slide has-sub"><a href="javascript:void(0);" style="padding-left: 10px;"
					class="side-menu__item"> <i class='bx bx-plus-medical' style="font-size:21px;" ></i>
						<span class="side-menu__label" style="margin-left: 19px;">수술</span> <i
						class="fe fe-chevron-right side-menu__angle"></i>
				</a>
					<ul class="slide-menu child1">
						<li class="slide side-menu__label1"><a
							href="javascript:void(0)">수술</a></li>
						<li class="slide"><a href="/surgery/reservList"
							class="side-menu__item">일정 관리</a></li>
<!-- 						<li class="slide"><a href="/emp/surgery/reservForm" -->
<!-- 							class="side-menu__item">수술 일정 등록</a></li> -->
<!-- 						<li class="slide"><a href="/emp/surgery/surgeryRoom" -->
<!-- 							class="side-menu__item">수술실 예약 현황</a></li> -->
						<li class="slide"><a href="/surgeryRecord/getSurgeryList"
							class="side-menu__item">기록 조회</a></li>
					</ul></li>
				<!-- End::slide -->

				<!-- Start::slide -->
				<li class="slide has-sub"><a href="/nurse/hospitalization"
					class="side-menu__item" style="padding-top: 5px; padding-bottom: 5px; padding-left: 10px;">
				<i class="bi bi-hospital" style="font-size: 20px;"></i> 
					
					<span
						class="side-menu__label" style="margin-left: 20px;">입/퇴원</span> 
				</a>
					<ul class="slide-menu child1">
 					</ul></li> 
				<!-- End::slide -->
				<!-- Start::slide -->
				<li class="slide has-sub"><a href="javascript:void(0);"
					class="side-menu__item" style="padding-top: 5px;padding-bottom: 5px;padding-left: 10px;">
					<i class="ri-nurse-line" style="font-size: 21px;"></i>
					
					<span
						class="side-menu__label" style="margin-left: 19px;">간호업무</span> <i
						class="fe fe-chevron-right side-menu__angle"></i>
				</a>
					<ul class="slide-menu child1">
						<li class="slide"><a href="/nurse/main"
							class="side-menu__item">홈</a></li>
						<li class="slide"><a href="/nurse/medicineList"
							class="side-menu__item">의약품</a></li>
						<li class="slide"><a href="/nurse/schedule"
							class="side-menu__item">근무조회</a></li>
						<li class="slide"><a href=" /nurse/surgery"
							class="side-menu__item">수술</a></li>
					</ul></li>
				<!-- End::slide -->
				<li class="slide has-sub">
				    <a href="javascript:void(0);" class="side-menu__item" style="padding-left: 12px; padding-top: 5px; padding-bottom: 5px;">
				        <i class="bi bi-cash-coin" style="font-size: 19px;"></i>
				        <span class="side-menu__label" style="margin-left: 19px;">수납 업무</span>
				        <i class="fe fe-chevron-right side-menu__angle"></i>
				    </a>
				    <ul class="slide-menu child1">
				        <li class="slide"><a href="/admin/receiveForm" class="side-menu__item">수납</a></li>
				        <li class="slide"><a href="/document/getList" class="side-menu__item">문서함</a></li>
				    </ul>
				</li>
				<!-- End::slide -->
			<li class="slide has-sub">
			    <a href="/emp/notice/list" class="side-menu__item" style=" padding-top: 8px;padding-bottom: 5px;"> 
			       <i class="bi bi-archive" style="font-size:18px;"></i>
			        <span class="side-menu__label" style="margin-left: 19px;" >공지사항</span> 
			    </a>
			    <ul class="slide-menu child1">
			        <li class="slide side-menu__label1"><a href="javascript:void(0)">공지사항</a></li>
			        <!-- <li class="slide"><a href="/emp/notice/list" class="side-menu__item">공지사항 목록</a></li>
			        추가 내용
			        <li class="slide"><a href="/emp/notice/create" class="side-menu__item">새로운 공지 작성</a></li>
			        <li class="slide"><a href="/emp/notice/archive" class="side-menu__item">과거 공지사항</a></li> -->
			    </ul>
			</li>
<!-- End::slide -->
				<!-- Start::slide -->
				<li class="slide has-sub"><a href="javascript:void(0);" style="padding-left: 10px;"
					class="side-menu__item"> <i class="bx bx-error side-menu__icon" style="font-size:22px;"></i>
						<span class="side-menu__label">관리</span> <i
						class="fe fe-chevron-right side-menu__angle"></i>
				</a>
					<ul class="slide-menu child1">
						<li class="slide has-sub"><a href="javascript:void(0);"
							class="side-menu__item">의약품<i
								class="fe fe-chevron-right side-menu__angle"></i></a>
							<ul class="slide-menu child2">
								<li class="slide"><a href="/admin/medicineList"
									class="side-menu__item">조회</a></li>
								<li class="slide"><a href="/admin/medicineRequestList"
									class="side-menu__item">관리</a></li>
							</ul></li>
						<li class="slide has-sub"><a href="javascript:void(0);"
							class="side-menu__item">의료기기<i
								class="fe fe-chevron-right side-menu__angle"></i></a>
							<ul class="slide-menu child2">
								<li class="slide"><a href="form_inputs.html"
									class="side-menu__item">조회</a></li>
								<li class="slide"><a href="/admin/equipmentRequestList"
									class="side-menu__item">관리</a></li>
							</ul></li>
						<li class="slide"><a href="/admin/vacationRequestList"
							class="side-menu__item">연가 관리</a></li>
						<li class="slide"><a href="/admin/permission"
							class="side-menu__item">권한 관리</a></li>
						<li class="slide"><a href="/empList/showEmpList"
							class="side-menu__item">인사 관리</a></li>
					</ul></li>
				<!-- End::slide -->
				
					<!-- 통계 현황 사이드 -->
				<li class="slide has-sub">
				    <a href="javascript:void(0);" class="side-menu__item" style="padding-top: 8px; padding-left: 10px;"> 
				        <i class="bx bx-bar-chart-alt side-menu__icon" style="font-size: 22px;"></i>
				        <span class="side-menu__label">통계 현황</span> 
				        <i class="fe fe-chevron-right side-menu__angle"></i>
				    </a>
				
				    <ul class="slide-menu child1 mega-menu">
				        <li class="slide side-menu__label1"><a href="javascript:void(0)">통계 현황</a></li>
				        <li class="slide"><a href="/statistics/yearMonth" class="side-menu__item">연/월 매출</a></li>
				        <li class="slide"><a href="/statistics/revenue" class="side-menu__item">월/과 매출</a></li>
				        <li class="slide"><a href="/statistics/patientEmp" class="side-menu__item">환자 수 추이</a></li>
				    </ul>
				</li>
				<!-- Start::slide -->

			</ul>
			<div class="slide-right" id="slide-right">
				<svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24"
					height="24" viewBox="0 0 24 24"> <path
						d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z"></path> </svg>
			</div>
		</nav>
		<!-- End::nav -->

	</div>
</aside>
<script>
$(document).ready(function() {
    var currentUrl = window.location.href;
    console.log(currentUrl);
    $('.side-menu__item').each(function() {
        var href = $(this).attr('href');
        if (currentUrl.includes(href)) {
        	console.log("링크선택함 여기여기")
        	console.log($(this).parents('.side-menu__item'));
            $(this).addClass('active');
            
            $(this).parents('.side-menu__item').addClass('active');
            $(this).parents('.has-sub').addClass('open');
            $(this).parents('.has-sub').find('ul').css('display','block');
        }
    });
});
</script>