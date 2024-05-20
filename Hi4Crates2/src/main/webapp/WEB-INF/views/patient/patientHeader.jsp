<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<meta id="_csrf" name="_csrf" content="${_csrf.token }">
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<aside class="app-sidebar sticky" id="sidebar" style="background-color: rgba(0, 0, 0, 0);">
            <div class="container-xl">
                <!-- Start::main-sidebar -->
                <div class="main-sidebar">

                    <!-- Start::nav -->
                    <nav class="main-menu-container nav nav-pills sub-open homeheader">
                        <div class="landing-logo-container">
                            <div class="horizontal-logo">
                                <a href="/home" class="header-logo">
                                    <img src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/hhbro-logo.png" alt="logo" class="desktop-logo" style="width: 200px; height: auto;">
                                    <img src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/hhbro-logo.png" alt="logo" class="desktop-white" style="width: 200px; height: auto;">
<%--                                     <img src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/asd.png" alt="logo" class="desktop-logo" style="width: 150px; height: auto;"> --%>
<%--                                     <img src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/asd.png" alt="logo" class="desktop-white" style="width: 150px; height: auto;"> --%>
                                </a>
                            </div>
                        </div>
                        <div class="slide-left" id="slide-left"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"> <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"></path> </svg></div>
						<ul class="main-menu">
							<li class="slide"><a href="#" onclick="goToHospitalPage()"
								class="side-menu__item1"> <span class="side-menu__label"
									style="font-size: 30px; font-weight: 700; opacity: 0.8; color:black; margin-right: 50px;">병원정보</span>
							</a>
							</li>
							<!-- Start::slide -->
							<li class="slide"><a href="#" onclick="goBook()" class="side-menu__item1">
									<span class="side-menu__label"
									style="font-size: 30px; font-weight: 700; opacity: 0.8; color:black; margin-right: 50px;">진료예약</span>
							</a></li>
							<!-- End::slide -->
							<!-- Start::slide -->
							<!-- End::slide -->
							<!-- Start::slide -->
							<li class="slide"><a href="#team" class="side-menu__item1"
								onclick="howToCome()"> <span class="side-menu__label"
									style="font-size: 30px; font-weight: 700; opacity: 0.8; color:black; margin-right: 50px;">오시는길</span>
							</a></li>
							<!-- End::slide -->
							<!-- Start::slide -->
							<li class="slide"><a href="#team" class="side-menu__item1"
								onclick="readNotice"> <span class="side-menu__label"
									style="font-size: 30px; font-weight: 700; opacity: 0.8; color:black;">공지사항</span>
							</a></li>
							<!-- End::slide -->

						</ul>
						<div style="display: flex; justify-content: space-between;">
						<c:set var="session" value="${sessionScope.user.member }" />
							<c:choose>
								<c:when test="${session eq null }">
						    <div style="cursor: pointer; padding: 10px; border-radius: 5px;">
						        <a href="/login">
						            <span class="side-menu__label" style="font-size: 15px; font-weight: 700; opacity: 0.8; color:black;">로그인</span>
						        </a>
						    </div>
						    
						    <div style="cursor: pointer; padding: 10px; border-radius: 5px;">
						        <a href="" data-bs-toggle="modal" data-bs-target="#exampleModalLg">
						            <span class="side-menu__label" style="font-size: 15px; font-weight: 700; opacity: 0.8; color:black;">회원가입</span>
						        </a>
						    </div>
								</c:when>
						    	<c:otherwise>
						    <div style="cursor: pointer; padding: 10px; border-radius: 5px;">
						        <a href="#" id="logout">
						            <span class="side-menu__label" style="font-size: 15px; font-weight: 700; opacity: 0.8; color:black;" >로그아웃</span>
						        </a>
						    </div>
						    <div style="cursor: pointer; padding: 10px; border-radius: 5px;">
						        <a href='/pMypage/home?memNo=${sessionScope.user.member.memNo }'>
						            <span class="side-menu__label" style="font-size: 15px; font-weight: 700; opacity: 0.8; color:black;">마이페이지</span>
						        </a>
						    </div>
						    	</c:otherwise>
							</c:choose>
						    <div style="cursor: pointer; padding: 10px; border-radius: 5px;">
						        <a href="/admin/main">
						            <span class="side-menu__label" style="font-size: 15px; font-weight: 700; opacity: 0.8; color:black;">직원전용</span>
						        </a>
						    </div>
						    
						</div>
                    </nav>
                    <!-- End::nav -->

                </div>
                <!-- End::main-sidebar -->
            </div>

        </aside>
        
	<form action="/logout" method="post" id="logoutForm">
		<sec:csrfInput/>
	</form>
	
<script type="text/javascript">

$('#logout').on("click",function(){
	$('#logoutForm').submit();
})

function howToCome() {
	location.href = "/how/toCome";
}

// 병원소개 페이지로 이동
function goToHospitalPage() {
    window.location.href = '/aboutUs/hospital';
}

// 진료예약 페이지로 이동
function goBook(){
	let check = "${sessionScope.user.member.memNo}";
	if(check === null || check === ""){
		alert('로그인 하고 이용해주세요');
		window.location.href = "/login";
		return false;
	}
	window.location.href = '/book/do';
	
}

// 환자 공지사항 페이지로 이동
function readNotice(){
	window.location.href = '/patient/notice/list';
}

// 스크롤 내렸을 때 헤더영역 색상주기
window.addEventListener('scroll', function() {
        var header = document.getElementById('sidebar');
        var scrollPosition = window.scrollY;
        if (scrollPosition > 0) {
            header.style.backgroundColor = 'white'; // 헤더의 배경색을 변경합니다. 원하는 색상으로 수정하세요.
        } else {
            header.style.backgroundColor = 'rgba(0, 0, 0, 0)'; // 스크롤이 위로 올라갈 때는 다시 투명하게 만듭니다.
        }
    });
</script>
        