<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<meta id="_csrf" name="_csrf" content="${_csrf.token }">
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/sideberCustom.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<style>

.diagnosisTable table, 
.diagnosisTable th, 
.diagnosisTable td {
    border: 1px solid black;
    margin-left: 2%;
}

.diagnosisTable td {
    padding: 6px;
}

#paper2 table, #paper2 th, #paper2 td {
    border:none;
    margin-left: 2%;
    padding: 6px;
}

.searchDrop {
	position: absolute;
	top: 100%;
	left: 0;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	z-index: 100;
	width: 200px;
	display: none;
}

.searchDrop ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.searchDrop li {
	padding: 8px 12px;
	border-bottom: 1px solid #ddd;
}

.searchDrop li a {
	color: black;
	text-decoration: none;
}

.searchDrop li a:hover {
	background-color: #f5f5f5;
}

/* 추가 코드 */
.searchDrop {
	width: 400px; /* 검색창 좌우 여백 고려 */
}

#header-notification-scroll {
  max-height: 300px; /* 원하는 높이로 조정 */
  overflow-y: auto;
}

#header-notification-scroll::-webkit-scrollbar {
  width: 8px; /* 스크롤바 너비 조정 */
}

#header-notification-scroll::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.2); /* 스크롤바 색상 조정 */
  border-radius: 4px; /* 스크롤바 모서리 조정 */
}

#header-notification-scroll::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.4); /* 스크롤바 호버 시 색상 조정 */
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/websocketFunction.js"></script>

<!-- 모달 -->
<div class="modal fade" id="modaldemo8">
	<div class="modal-dialog modal-lg modal-dialog-centered "
		role="document">
		<div class="modal-content shadow" id="modal-body"
			style="border: 0.1px; border-radius: 15px;"></div>
	</div>
</div>

<header class="app-header">
	<input type="hidden" id="userId"
		value="${sessionScope.user.member.memId }">
	<div class="col-4" style="display: none;">
		<div class="form-check switch-select">
			<label class="form-check-label" for="switcher-dark-theme">
				Dark </label> <input class="form-check-input" type="radio"
				name="theme-style" id="switcher-dark-theme">
		</div>
	</div>
	<div class="main-header-container container-fluid">
		<div class="header-content-left">
			<div class="header-element">
				<div class="horizontal-logo">
					<a href="/home" class="header-logo"> <img
						src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/desktop-logo.png"
						alt="logo" class="desktop-logo"> <img
						src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/toggle-logo.png"
						alt="logo" class="toggle-logo"> <img
						src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/desktop-dark.png"
						alt="logo" class="desktop-dark"> <img
						src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/toggle-dark.png"
						alt="logo" class="toggle-dark"> <img
						src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/desktop-white.png"
						alt="logo" class="desktop-white"> <img
						src="${pageContext.request.contextPath }/resources/assets/images/brand-logos/toggle-white.png"
						alt="logo" class="toggle-white">
					</a>
				</div>
			</div>
			<div class="header-element">
<!-- 				<a aria-label="Hide Sidebar" id="sidebarToggle" -->
<!-- 					class="sidemenu-toggle header-link animated-arrow hor-toggle horizontal-navtoggle" -->
<!-- 					data-bs-toggle="sidebar" href="javascript:void(0);"><span></span></a> -->
				<div class="col-md-12" style="margin-left: -75px; margin-top: 7px;">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="input-group" id="searchGroup">
									<input type="text" id="search-input" class="form-control"
										placeholder="검색어 입력">
									<button class="btn btn-outline-light btn-wave" type="button"
										id="search-btn">
										<i class="bx bx-search-alt-2 header-link-icon"></i>
									</button>
									<div id="dropdown-menu" class="searchDrop" style="display: none;">
										<i class="bx bx-search-alt-2 header-ling-icon"></i>검색 결과
										<p style="font-size: 25px;">
											👨‍⚕️ <span style="font-size: 15px;">아래 검색 규칙을 읽고 검색 해
												주세요!</span>
										</p>
										<span>※ 환자 성명에 포함된 글자를 입력해주세요 ※</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="header-content-right">
			<div class="header-element notifications-dropdown">
				<a href="javascript:void(0);" class="header-link dropdown-toggle"
					data-bs-toggle="dropdown" data-bs-auto-close="outside"
					id="messageDropdown" aria-expanded="false"> <i
					class="bx bx-bell header-link-icon"></i> <span
					class="badge bg-secondary rounded-pill header-icon-badge pulse pulse-secondary"
					id="notification-icon-badge"></span>
				</a>

<!-- 알림 보여줄 곳 -->
				<div class="main-header-dropdown dropdown-menu dropdown-menu-end"
					data-popper-placement="none">
					<div class="p-3">
						<div class="d-flex align-items-center justify-content-between">
							<p class="mb-0 fs-17 fw-semibold">알림</p>
							<span class="badge bg-secondary-transparent"
								id="notifiation-data">알림이 존재하지 않습니다.</span>
						</div>
					</div>
					<div class="dropdown-divider"></div>
					<ul class="list-unstyled mb-0" id="header-notification-scroll">
					</ul>
					<div class="p-5 empty-item1 d-none">
						<div class="text-center">
							<span
								class="avatar avatar-xl avatar-rounded bg-secondary-transparent">
								<i class="ri-notification-off-line fs-2"></i>
							</span>
							<h6 class="fw-semibold mt-3">읽지 않은 알림이 없습니다!</h6>
						</div>
					</div>
				</div>
			</div>






			<div class="header-element">
				<!-- Start::header-link|dropdown-toggle -->
				<a href="javascript:void(0);" class="header-link dropdown-toggle"
					id="mainHeaderProfile" data-bs-toggle="dropdown"
					data-bs-auto-close="outside" aria-expanded="false">
					<div class="d-flex align-items-center">
						<div class="me-sm-2 me-0">
							<img
								src="/file/showprofile/${sessionScope.user.member.memNo }"
								alt="img" width="32" height="32" class="rounded-circle">
						</div>
						<div class="d-sm-block d-none">
							<p class="fw-semibold mb-0 lh-1">${sessionScope.user.member.memName }</p>
							<span class="op-7 fw-normal d-block fs-11">직무</span>
						</div>
					</div>
				</a>
				<!-- End::header-link|dropdown-toggle -->
				<ul
					class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end"
					aria-labelledby="mainHeaderProfile">
					<li><a class="dropdown-item d-flex" href="/mypage/${sessionScope.user.member.memNo }"><i
							class="ti ti-user-circle fs-18 me-2 op-7"></i>내 정보</a></li>
					<li><a href="#" id="logout" class="dropdown-item d-flex"><i
							class="ti ti-logout fs-18 me-2 op-7"></i>로그아웃</a></li>
				</ul>
			</div>

<!-- 우측 사이드바 -->
			<div class="header-element">
				<a href="#" id="toggleButton"><i class="bi bi-chat-right-text header-link-icon"></i></a>
			</div>
		</div>
		<!-- End::header-content-right -->
	</div>
	<form action="/logout" method="post" id="logoutForm">
		<sec:csrfInput/>
	</form>
</header>

<div class="toast-container position-fixed top-0 end-0 p-3" id="toastbox">
	<div id="infoToast" class="toast colored-toast bg-info-transparent"
		role="alert" aria-live="assertive" aria-atomic="true">
		<div class="toast-header bg-info text-fixed-white">
			<img class="bd-placeholder-img rounded me-2"
				src="${pageContext.request.contextPath }/resources/img/원무과장.png" alt="...">
			<strong class="me-auto">원무과장</strong>
			<button type="button" class="btn-close" data-bs-dismiss="toast"
				aria-label="Close"></button>
		</div>
		<div class="toast-body"><a href="#" id="description">연가 기안이 승인되었습니다.</a></div>
	</div>
	
<div id="dangerToast" class="toast colored-toast bg-danger-transparent" role="alert" aria-live="assertive"
        aria-atomic="true">
        <div class="toast-header bg-danger text-fixed-white">
            <img class="bd-placeholder-img rounded me-2" src="${pageContext.request.contextPath }/resources/img/원무과장.png" alt="...">
            <strong class="me-auto">원무과장</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"
                aria-label="Close"></button>
        </div>
        <div class="toast-body" id="disagreeBox">
            연가 기안이 반려되었습니다.
        </div>
    </div>
</div>



<!-- 사이드바 -->
<div id="rside" class="">
        <h5>환자기록</h5>
        <h6 id="partiInfo">이름, 나이, 성별</h6>
        <a href="#" id="outIcon"><i class="bi bi-box-arrow-in-up-right outIcon"></i></a>
        <div id="paritcularList">
        <!-- 기록 내역 -->
        </div>
        <textarea class="form-control no-resize" id="txtbox" placeholder="텍스트를 입력하세요" rows="5"
            data-bs-toggle="dropdown"></textarea>
        <a href="#" id="insertParti"><i class="bi bi-pencil-square icon"></i></a>
    </div>
    
    <div class="dropup posi">
        <ul class="dropdown-menu it" id="dropdownMenu">

            <li class="dropdown-item">
            	<a href="#">
<!--                     <span class="avatar avatar-sm online me-1 avatar-rounded" style="border: 1px solid black;"> -->
<!--                         <img src="/resources/assets/img/patient.png" alt="img"> -->
<!--                     </span> -->
<!--                     <span class="mb-0 fw-semibold fp">선민수</span> -->
<!--                     <span class="float-end text-muted fw-normal fs-11">의사</span> -->
				</a>
			</li>
			
        </ul>
    </div>
    
<!-- 진단서 모달 -->
<div class="modal fade" id="diagnosisPaperModal1" tabindex="-1" aria-labelledby="exampleModalScrollable3" data-bs-keyboard="false" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 720px;">
     <div class="modal-content">
         <div class="modal-header">
             <h6 class="modal-title" id="staticBackdropLabel3">진단서</h6>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
             <div class="col-xxl-12 col-xl-12">
                 <div class="row">
                     <div class="col-xl-12">
                         <div class="card custom-card">
                             <div class="card-body">
                                 <div class="content-wrapper">
                                     <div id="diagnosisPaperPrint1">
                                         <p>의료법 시행규칙[별지 제 5호의 2서식]<개정 2019. 9. 27.>
                                         </p>
                                         <h4 style="text-align: center;">진 단 서</h4>
                                         <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12">
                                             <table style="margin-bottom: 10%;  margin-left: 6%" class="diagnosisTable">
                                                 <tr style="border: 1px solid black;;">
                                                     <td>등록번호 <span id="dpPatntNo1"></span></td><br />
                                                 </tr>
                                                 <tr>
                                                     <td>연 번 호 <span id="dpReceiptNo1"></span></td>
                                                 </tr>
                                             </table>
                                         </div>
                                         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                             <table style="width: 630px;" class="diagnosisTable">
                                                 <tr>
                                                     <td class="text-nowrap" style="text-align: center;">환자의 성명 </td>
                                                     <td id="dpName1" style="width:200px;">김길동</td>
                                                     <td class="text-nowrap" style="text-align: center;">주민등록<br/>번호</td>
                                                     <td colspan="2" id="dpRegno1">980101-123456</td>
                                                 </tr>
                                                 <tr>
                                                     <td class="text-nowrap" style="text-align: center;">환자의 주소</td>
                                                     <td class="text-nowrap" colspan="2" id="dpAddress1">경기 안양시 동안구</td>
                                                     <td colspan="2">(전화번호 : <br /><span id="dpTel1">010-1234-4567</span>)</td>
                                                 </tr>
                                                 <tr>
                                                     <td style="text-align: center;">병 명<br />
                                                         <input type="checkbox" name="diagnosisType1" data-value="DP001"/> 임상적 추정<br />
                                                         <input type="checkbox" name="diagnosisType1" data-value="DP002"/> 최종 진단
                                                     </td>
                                                     <td colspan="2">
                                                         (주상병)
                                                         <span id="dpPrimaryDiagnosis1"></span><br />
                                                         (부상병)
                                                         <span id="dpSecondDiagnosis1"></span>
                                                     </td>
                                                     <td>질병 분류번호<br />
                                                         <span id="dpPrimaryCode1">M002</span><br />
                                                         <span id="dpSecondCode1">E003</span><br />
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td class="text-nowrap" style="text-align: center;">발병 연월일</td>
                                                     <td>
                                                         <input type="text" class="form-control" id="dpDiagDate1" style="border: none;">
                                                     </td>
                                                     <td class="text-nowrap" style="text-align: center;">진단 연월일</td>
                                                     <td>
                                                         <input type="text" class="form-control" id="dpOnsetDate1" style="border: none;">
                                                     </td>
                                                 </tr>
                                                 <tr style="height: 50px; border: none;">
                                                     <td class="text-nowrap" style="text-align: center;">
                                                         	치료 내용 및  <br/>향후 치료에 대한 소견
                                                     </td>
                                                     <td colspan="4">
                                                         <textarea class="form-control" style="height: 200px; border: none;"
                                                             id="dpComment1"></textarea>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td  style="text-align: center;"> 용도 </td>
                                                     <td colspan="4">
                                                         <input type="text" class="form-control" id="dpPurpose1" style="border: none;">
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td  style="text-align: center;">  비고 </td>
                                                     <td colspan="4">
                                                         <input type="text" class="form-control" id="dpRemark1" style="border: none;">
                                                     </td>
                                                 </tr>
                                             </table>
                                             <div id="paper2">
                                                 <table>
                                                     <tr>
                                                         <td colspan="5">
                                                             	의료법 제 17조 및 같은 법 시행규칙 제 9조 1항에 따라 위와 같이 진단합니다.
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td colspan="5" style="text-align: center;" id="dpSysdate1">
                                                             2020년 9월 16일
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <td> 의료기관 </td>
                                                         <td> 명칭 </td>
                                                         <td colspan="3"> 대덕인재개발원병원 <span style="margin-left: 10%;">(직인)</span></td>
                                                     </tr>
                                                     <tr>
                                                         <td></td>
                                                         <td>주소</td>
                                                         <td colspan="3">경기도 안양시 동안구 홍안대로 123</td>
                                                     </tr>
                                                     <tr>
                                                         <td></td>
                                                         <td>성명</td>
                                                         <td id="dpDoctor1">김태원 <span style="margin-left: 5%;">(서명 또는 인)</span></td>
                                                         <td>면허번호 </td>
                                                         <td id="dpDoctorNo1">456456456 </td>
                                                     </tr>
                                                     <tr>
                                                         <td>전화 및 Fax </td>
                                                         <td> (전화)</td>
                                                         <td> 042-123-4567</td>
                                                         <td>(팩스)</td>
                                                         <td> 042-123-4777</td>
                                                     </tr>
                                                 </table>
                                             </div>
                                         </div>
                                         <div>
                                             <button type="button" class="btn btn-outline-secondary ml-2"
                                             data-bs-dismiss="modal" style="float:right">취소</button>
                                             <button class="btn btn-secondary shadow-secondary btn-wave" id="diagnosisPaperSendBtn1" style="float:right">작성</button>
                                             <button class="btn btn-secondary shadow-secondary btn-wave" id="savePdfBtn1" style="float:right">발행</button>
                                            <button type="button" class="btn btn-teal-gradient btn-wave" id="diagnosisTest">test</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--진단서 모달 끝-->



<script>
$(document).ready(function() {
    // beforeSend 함수를 $.ajaxSetup 바깥에서 미리 정의

    // sidebar를 숨기는 작업
    $('#sidebar').collapse('hide');

});
var csrfToken = $("meta[name='_csrf']").attr("content");
var csrfHeader = $("meta[name='_csrf_header']").attr("content");
const notiBox = $('#header-notification-scroll');
var sock = null;
var ws = null;
$(document).ready(function(){
	connectWs();
});
var onlineList;
var offlineList;
// 소켓
function connectWs(){
 	ws = new WebSocket("ws://localhost/echo");
// 	ws = new WebSocket("ws://192.168.143.33:80/echo");
//	ws = new WebSocket("ws://121.184.106.118:80/echo");
// 	sock = ws;
	
	ws.onopen = function(){
		console.log("연결 완료");
		console.log($('#userId').val());
		ws.send('로그인#'+$('#userId').val()+"#SUCCESS");
	};
	
	ws.onmessage = function(event) {
		
		// 받은 데이터가 JSON 형식인지 확인
		let jsonData = null;
		try{
			jsonData = JSON.parse(event.data);
		} catch (e) {
			let responseCode = event.data.split('#')[0];
			if(responseCode === "notiList") getNotiList(event);
			else if(responseCode === "vacationResult") vacationResult(event);
			return;
		}
		let jsonType = jsonData.type;
		console.log(jsonType);
		if(jsonType === "로그인") {
			onlineList = JSON.parse(jsonData.online);
			offlineList = JSON.parse(jsonData.offline);
			showOnline(onlineList, offlineList);
		}
		else if(jsonType === "openSoloChat"){
			let member = JSON.parse(jsonData.member);
			let status = jsonData.status;
			openSoloChat(member, status);
		}
		else if(jsonType === "chat"){
			let chatList = JSON.parse(jsonData.chat);
			printChat(chatList);
		}
		else if(jsonType === "myChatRoom"){
			let chatList = JSON.parse(jsonData.data);
			myChatRoomList(chatList);
		}
		else if(jsonType === "enterChat"){
			let chatPersonList = JSON.parse(jsonData.data);
			enterChat(chatPersonList);
		}
		else if(jsonType === "insertParticular"){
			let particularList = JSON.parse(jsonData.data);
			printParticularSide(particularList);
		}
		else if(jsonType === "checkParticular"){
			let particularList = JSON.parse(jsonData.data);
			printParticularSide(particularList);
		}
		else if(jsonType === "mention"){
			let data = JSON.parse(jsonData.data);
			particularMention(data);
		}
		else if(jsonType === "requestNoti"){
			let data = jsonData.data;
			let destination = jsonData.destination
			requestNoti(data,destination);
		}
		else if(jsonType === "agreeNoti"){
			let data = jsonData.data;
			let masterNo = jsonData.master;
			agreeNoti(data,masterNo);
		}
		else if(jsonType === "disagreeNoti"){
			console.log("여기탐");
			let data = jsonData.data;
			let masterNo = jsonData.master;
			disagreeNoti(data,masterNo);
		}
		else if(jsonType === "docuRequest"){
			documentRequest(jsonData);
		}
		else if(jsonType === "reqCollabo"){
			reqCollabo(jsonData);
		}
		else if(jsonType === "insertDiagnosis"){
			insertDiagnosis(jsonData);
		}
		
		else if(jsonType === "inviteMeeting"){
			inviteMeeting(jsonData);
		}
		
		
	};
	
	ws.onclose = function(){
		showOnline(onlineList, offlineList);
		console.log('close');
	};
	
}

// 환자 기록 사이드바
var partiTargetNo;
$(document).ready(function () {
    var $selectionBox;
    $('#toggleButton').click(function () {
        console.log(partiTargetNo);
        
        openSide(partiTargetNo);

    });

    
    
    $('#txtbox').on("input", function () {
        if ($(this).val() === "@") {
            $('.dropdown-menu').show();
			
            $.ajax({
            	url : "/comm/admin/searchOnline",
            	type : "get",
            	contentType : "application/json;charset=utf-8",
            	beforeSend: function(xhr) {
                    // CSRF 토큰 헤더에 추가
                   xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
        	},
            	success:function(list){
            		console.table(list);
            		
            		let html = '';
            		$.each(list, function(idx, item){
            			html+='<li class="dropdown-item" ">';
            			html+='<a href="#" data-memno="'+item.memNo+'" class="mention">';
            			html+='<span class="avatar avatar-sm online me-1 avatar-rounded" style="border: 1px solid black;">';
            			html+='<img src="/file/displayFile?fileName='+item.attachPath+item.attachName+'" alt="/resources/assets/img/patient.png">';
            			html+='</span>';
            			html+='<span class="mb-0 fw-semibold fp">'+item.memName+'</span>';
            			html+='<span class="float-end text-muted fw-normal fs-11">'+item.empJob+'</span>';
            			html+='</a>';
            			html+='</li>';
            		})
            		$('#dropdownMenu').append(html);
            	}
            });
        } else {
            $('.dropdown-menu').hide();
        }
    });
});
$(document).on("click", ".mention",function(){
	$('.dropdown-menu').hide();
	let memNo = $(this).data("memno");
	let memName = $(this).find(".fp").text();
	
	$('#txtbox').data("memno", memNo);
	
	$('#txtbox').val("@"+memName);
	
	console.log(memNo);
	console.log(memName);
	console.log($('#txtbox').data("memno"));
});


$('#logout').on("click",function(){
	$('#logoutForm').submit();
});

$(function() {
	var patntInfo;
	var protector;
	var chartRecordList;
	$("#search-input").click(function() {
		 event.stopPropagation();
		$('#searchGroup').css("width","400px");
		$("#dropdown-menu").show();
	});
	
	$("#search-input").on("input",function(){
		var searchName = $('#search-input').val();
		var data = {searchName : searchName};
		let html = `<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>`;
		$('#dropdown-menu').html(html);
		    $.ajax({
		    	type:"post",
		    	url :"/comm/getSearchList",
		    	data : JSON.stringify(data),
		    	contentType : "application/json;charset=utf-8",
		    	beforeSend: function(xhr) {
		             xhr.setRequestHeader(csrfHeader, csrfToken);
		         },
		         success:function(result){
		        	 console.log(result)
					if(result != null && result.length > 0){
						html = "<div class='col-xl-12' style=''>";
						html += "<div class='card custom-card'>";
						$.each(result, function(idx,val){
						var reg = val.memRegno1 +"-"+ val.memRegno2[0]+"******";
						console.log(reg);
							html+= '<div class="card-header">';
							html+= '<div class="me-3">';
							html+= '<span style="font-weight: bold; color: skyblue;">'+val.memName+'</span>';
							html+= '<i class="bx bx-plus-medical" style="color: red; margin-left:10px;"></i>';
							html+= '<span style="margin-left: 15px;">'+val.memGender+", "+val.memAge+'세</span>';
							html+= '<i class="ti ti-arrow-big-right" style="margin-left: 15px;">';
							html+= '<a class="link-opacity-25" id="showDetail" data-bs-effect="effect-scale" data-bs-param="'+val.memNo+'" href="#">';
							html+= '<span> 상세보기</span>';
							html+= '</a>';
							html+= '</i>';
							html+= '<br>';
							html+= '<span class="badge rounded-pill bg-success-transparent" style="margin-top: 5px;">no.'+formatNumber(val.memNo)+'</span> ';
							html+= '<i class="bx bxs-phone-call" style="margin-left: 20px;"></i>';
							html+= '<span style="margin: 10px;">'+val.memTel+'</span>';
							html+= '<i class="bx bx-info-square"></i>  '+reg;
							html+= '</div>';
							html+= '</div>';
						});
						html += "</div></div>";
						$('#dropdown-menu').html(html);
					}else{
			        	html = "<p>"+"검색 정보가 없습니다."+"</p>";
			        	$('#dropdown-menu').html(html);
					}
		         },
		         error:function(xhr, status, error){
		        	 var errorMessage = xhr.status + ": "+xhr.statusText;
		        	 alert('에러 발생 : '+errorMessage);
		        	 console.err('에러 발생',error);
		         }
		    });
	});
// 	$("#search-btn").click(function(){
// 		var searchName = $('#search-input').val();
// 		var data = {searchName : searchName};
// 		let html = `<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>`;
// 		$('#dropdown-menu').html(html);
// 		    $.ajax({
// 		    	type:"post",
// 		    	url :"/comm/getSearchList",
// 		    	data : JSON.stringify(data),
// 		    	contentType : "application/json;charset=utf-8",
// // 		    	beforeSend: function(xhr) {
// // 		             xhr.setRequestHeader(csrfHeader, csrfToken);
// // 		         },
// 		         success:function(result){
// 		        	 console.log(result)
// 					if(result != null && result.length > 0){
// 						html = "<div class='col-xl-12' style=''>";
// 						html += "<div class='card custom-card'>";
// 						$.each(result, function(idx,val){
// 						var reg = val.memRegno1 +"-"+ val.memRegno2[0]+"******";
// 						console.log(reg);
// 							html+= '<div class="card-header">';
// 							html+= '<div class="me-3">';
// 							html+= '<span style="font-weight: bold; color: skyblue;">'+val.memName+'</span>';
// 							html+= '<i class="bx bx-plus-medical" style="color: red; margin-left:10px;"></i>';
// 							html+= '<span style="margin-left: 15px;">'+val.memGender+", "+val.memAge+'세</span>';
// 							html+= '<i class="ti ti-arrow-big-right" style="margin-left: 15px;">';
// 							html+= '<a class="link-opacity-25" id="showDetail" data-bs-effect="effect-scale" data-bs-param="'+val.memNo+'" href="#">';
// 							html+= '<span> 상세보기</span>';
// 							html+= '</a>';
// 							html+= '</i>';
// 							html+= '<br>';
// 							html+= '<span class="badge rounded-pill bg-success-transparent" style="margin-top: 5px;">no.'+formatNumber(val.memNo)+'</span> ';
// 							html+= '<i class="bx bxs-phone-call" style="margin-left: 20px;"></i>';
// 							html+= '<span style="margin: 10px;">'+val.memTel+'</span>';
// 							html+= '<i class="bx bx-info-square"></i>  '+reg;
// 							html+= '</div>';
// 							html+= '</div>';
// 						});
// 						html += "</div></div>";
// 						$('#dropdown-menu').html(html);
// 					}else{
// 			        	html = "<p>"+"검색 정보가 없습니다."+"</p>";
// 			        	$('#dropdown-menu').html(html);
// 					}
// 		         },
// 		         error:function(xhr, status, error){
// 		        	 var errorMessage = xhr.status + ": "+xhr.statusText;
// 		        	 alert('에러 발생 : '+errorMessage);
// 		        	 console.err('에러 발생',error);
// 		         }
// 		    });
// 	});
	
});
	/* 자세히 보기 클릭 */
	$(document).on("click", "#showDetail", function(){
		$('#modal-body').html();
		var paramValue = $(this).data('bs-param');
		$.ajax({
			url : "/comm/showpatientdetail",
			type : "get",
			 data: { param: paramValue },
			 beforeSend: function(xhr) {
                 // CSRF 토큰 헤더에 추가
                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
     	},
			 success :function(res){
				console.log(res);
				chartRecordList = res[0];
				let particularList = res[1];
				patntInfo = res[2];
				protector = res[3];
// 				console.table(chartRecordList);
// 				console.table(particularList);
// 				console.table(patntInfo);
// 				console.table(protector);
				let html ="";
	             html+='<div class="row g-0">'
	                 +'<div class="col-5 leftmd">'
	                 +'<p>'
	                 +'<h6 style="float: left;">'
	                 +'<i class="bx bx-building-house" style="margin-left: 20px; font-size: 20px;"></i>'
	                 +'</h6>'
	                 +'<span class="leftmdTitle">최근방문기록</span>'
	                 +'</p><br><br>';
	                 $.each(chartRecordList, function(index, chart)
	                 {
	                 html+='<p class="leftmdContent">'+chart.chartDate+' '+chart.memName+'<br><span class="badge rounded-pill bg-dark-transparent">'+formatNumber(chart.chartNo)+'</span></p>'
	                 });
	             html+='<div style="margin-top: 50px;"></div>'
	                 +'<p>'
	                 +'<h6 style="float: left;">'
	                 +'<i class="bx bx-message-square-dots" style="margin-left: 20px; font-size: 20px;"></i>'
	                 +'</h6>'
	                 +'<span class="leftmdTitle">특이사항</span><br>'
	                 +'</p>';
	                 if(particularList.length > 0){
		                 $.each(particularList, function(index, particular){
		             html+='<p class="leftmdContent" style="color: black; font-weight: 500;">'
		                 +'<i class="bx bx-bell"></i> '
		                 +particular.particularDescription+'<br>'
	                     +'<span class="leftmdContent">'+particular.particularDate+', '+particular.particularWriter+'</span>'
		                 +'</p>';
		                 });
	                 }
	                 else{
	                 html +='<p class="leftmdContent" style="color: black; font-weight: 500;">'
		                 +'<i class="bx bx-task-x"></i>'
		                 +' 특이사항 기록이 존재하지 않습니다.<br>'
		                 +'</p>'
	                 }
	                 html+='</div>';
	                 html +='<div class="col-7 rightmd" >'
	                 +'<p>'
	                 +'<h6 style="float: left;">'
	                 +'<i class="bx bx-user" style="margin-left: 20px; font-size: 20px;"></i>'
	                 +'</h6>'
	                 +'<span class="leftmdTitle">환자 정보</span>'
	                 +'<span class="rightmdTime">'+patntInfo.memSignupDate+'</span>'
	                 +'</p>'
	                 +'<p class="rightmdNo">no.'+formatNumber(patntInfo.memNo)+'</p>'
	                 +'<p class="rightmdName">'+patntInfo.memName+'<span style="font-size: 15px;margin-left: 10px;">'+patntInfo.memGender+','+patntInfo.memAge+'세</span></p>'
	                 +'<p>'
	                 +'<span class="rightmdSubtitle" style="margin-left: 20px;">주민등록번호</span>'
	                 +'<span class="rightmdSubtitle" style="margin-left: 100px;">대표연락처</span>'
	                 +'</p>'
	                 +'<p>'
	                 +'<span class="rigtmdSubcontent" style="margin-left: 22px; ">'+patntInfo.memRegno1+'-'+patntInfo.memRegno2.substr(0,1)+'******</span>'
	                 +'<span class="rigtmdSubcontent" style="left: 555px; ">'+patntInfo.memTel+'</span>'
	                 +'</p>'
	                 +'<div style="margin-top: 50px;"></div>'
	                 +'<p>'
	                 +'<h6 style="float: left;">'
	                 +'<i class="bx bx-user-plus" style="margin-left: 20px; font-size: 20px;"></i>'
	                 +'</h6>'
	                 +'<span class="leftmdTitle">보호자</span><br>'
	                 +'</p>'
	                 +'<p>';
	                 if(protector != null ){
		            html +='<span style="margin-left: 20px;">'+protector.protectorName+'</span>'
		                 +'<span style="margin-left: 20px;">'+protector.protectorTel+'</span>'
		                 +'<span style="margin-left: 20px;">'+protector.protectorRelate+'</span>'
		                 +'<span style="margin-left: 20px;">'+protector.protectorDate+'</span>'
	                 }else{
	                	 html +='<span style="margin-left: 20px;"><i class="bx bx-task-x"></i> 등록된 보호자가 없습니다 !</span>'	 
	                 }
	                 html+='</p>'
	                 +'<p style="float: right; margin-right: 15px;">'
	                 +'<button class="btn btn-outline-info rounded-pill btn-wave" id="selectPatientBtn" data-bs-dismiss="modal" >선택</button>'
	                 +'<button class="btn btn-outline-dark rounded-pill btn-wave" data-bs-dismiss="modal" >닫기</button>'
	                 +'</p>'
	                 +'</div>'
					 +'</div>';
				$('#modal-body').html(html);
				
				// 선택 또는 닫기 버튼 클릭 이벤트 핸들러
				$("#selectPatientBtn, .btn-outline-dark").click(function() {
					partiTargetNo = patntInfo.patntNo;
				    $("#dropdown-menu").hide(); // 드롭다운 메뉴 토글
// 				    printParticularSide(partiTargetNo);
				    getPartiAjax(partiTargetNo);
				    console.log('확인');
				});
			 }
		});
			 $('#modaldemo8').modal('show');
			 
			// 모달창 외부 클릭시 드롭다운토글 없애기
			 $('#modaldemo8').on('shown.bs.modal', function() {
			     $('body').on('click', function(e) {
			         // 모달 내부를 클릭한 경우에는 처리하지 않음
			         if ($(e.target).closest('.modal-content').length === 0) {
// 			             $("#dropdown-menu").hide(); // 드롭다운 메뉴 숨기기
			         }
			     });
			 });
			
			
			
			 
	});
	function formatNumber(num) {
	    var str = num.toString();
	    while (str.length < 4) {
	        str = '0' + str;
	    }
	    return str;
	}

	/* 알림 목록 클릭 이벤트 */

$(document).on("click", ".dropdown-item-close1", function(event) {
    event.preventDefault();
    event.stopPropagation();
    $(this).closest(".dropdown-item").remove();
    let notiNo = $(this).data("notino");
    console.log($(this));
    console.log(notiNo);

    $("#notifiation-data").text("안읽은 알림 (" + $(".dropdown-item-close1").length + ")개");
    $("#notification-icon-badge").text($(".dropdown-item-close1").length+"+");

    if ($(".dropdown-item-close1").length === 0) {
        $(".empty-item1").removeClass("d-none");
        $("#notifiation-data").text("");
        $("#notification-icon-badge").text("");
    }
    
    let data = {
		"notiNo" : notiNo	    		
    };
    $.ajax({
    	url : "/noti/checkNoti.do",
    	type : "post",
    	data : JSON.stringify(data),
    	contentType : "application/json;charset=utf-8",
    	beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	},
    	success : function(){
    		console.log("체크완료")
    	}
    });
});
	
	
$(function(){
	if($(".dropdown-item-close1").length === 0) {
	      let elementShow1 = $(".empty-item1");
	      elementShow1.removeClass("d-none");
	}else{
	      let elementShow1 = $(".empty-item1");
	      elementShow1.addClass("d-none");
	}
});

(function () {
    "use strict";

    var listElement = document.getElementById('header-notification-scroll');
    var listItems = listElement.querySelectorAll('li');
    
    // 만약 리스트 아이템이 5개 이상이면 SimpleBar 초기화
    if (listItems.length > 5) {
        new SimpleBar(listElement, { autoHide: true });
    }
})();

$('#goMypage').on("click",function(event){
	event.preventDefault();
	let form = $('#goMypageForm');
	let memNo = $(this).data("memno");
	$('#mypageMemno').val(memNo);
	form.submit();
		
});

function printParticularSide(parti){
	$.ajax({
		url : "/comm/getPartiInfo",
		data : JSON.stringify({
			"partiTargetNo" : partiTargetNo
		}),
		type : "post",
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	},
		success : function(res){
			$('#partiInfo').text(res.memName + ", "+res.memAge + " 세, "+ res.memGender+", "+res.memRegno1);
			
		}
	});
	var dateGroup = {};
	
	parti.forEach(function(item){
		let date = item.particularDate.split(" ")[0].replaceAll("-", ".");
		if(!dateGroup[date]){
			dateGroup[date] = [];
		}
		dateGroup[date].push(item);
	});
	console.table(dateGroup);
	let partiList = $('#paritcularList');
	partiList.empty();
	
	for(var date in dateGroup){
		let dateHtml = '<div class="row sep">';
		dateHtml += '<hr class="col-4 line">';
		dateHtml += '<div class="col-4 dateFont">';
		dateHtml +=date
		dateHtml += '</div>';
		dateHtml += '<hr class="col-4 line">';
		dateHtml += '</div>';
		partiList.append(dateHtml);
		
		let partiHtml = '<ul class="list-unstyled mb-0 mt-2 chat-users-tab" id="chat-msg-scroll">';
		dateGroup[date].forEach(function(item){
			partiHtml += '<li class="checkforactive m-2">';
			partiHtml += '    <div class="d-flex align-items-top">';
			partiHtml += '        <div class="me-1 lh-1">';
			partiHtml += '            <span class="avatar avatar-md online me-2 avatar-rounded"';
			partiHtml += '                style="border: 1px solid; border-color: black;">';
			partiHtml += '                <img src="/file/showprofile/'+item.memNo+ '" alt="img">';
			partiHtml += '            </span>';
			partiHtml += '        </div>';
			partiHtml += '        <div class="flex-fill">';
			partiHtml += '            <p class="mb-0 fw-semibold">';
			partiHtml += item.particularWriter;
			partiHtml += '                <a href="#"><span class="float-end text-muted fw-normal fs-11 here">'+timeFormat(item.particularDate.split(" ")[1].substr(0,5))+'</span></a>';
			partiHtml += '            </p>';
			partiHtml += '            <p class="fs-12 mb-0">';
			partiHtml += '                <span class="chat-msg text-truncate">'+item.particularDescription+'</span>';
			partiHtml += '            </p>';
			partiHtml += '            <div>';
			partiHtml += '                <span class="badge rounded-pill bg-outline-light text-dark">';
			partiHtml += '                    <a href="#"><i class="bi bi-check-circle check" data-partino="'+item.particularNo+'" data-patntno="'+item.patntNo+'" style="color: green;"></i></a>';
			partiHtml += '                    <span class="text-muted checkHit"  style="margin-left: 5px;">';
			if(item.particularCheck != null && item.particularCheck != 0)
			partiHtml += item.particularCheck;
			partiHtml += '</span>';
			partiHtml += '                </span>';
			partiHtml += '            </div>';
			partiHtml += '        </div>';
			partiHtml += '    </div>';
			partiHtml += '</li>';
		});
			partiHtml += '</ul>'
			partiList.append(partiHtml);
	}
}

$(document).on("click",".check",function(){
	console.log("클릭")
    let hit = $(this).closest('.checkforactive').find('.checkHit');
    console.log(hit);
    if(hit.text() === null || hit.text() === "") hit.text(1);
    else {
        let hitpoint = parseInt(hit.text());
        hit.text(hitpoint+1);
    }
    
    let particularNo = $(this).data("partino");
    let patntNo = $(this).data("patntno");
    let data = {
    		"code" : "checkParticular",
    		"particularNo" : particularNo,
    		"patntNo" : patntNo
    }
    console.table(data);
    ws.send(JSON.stringify(data));
});

$('#insertParti').click(function(){
	let writer = "${sessionScope.user.member.memName}";
	let myNo = ${sessionScope.user.member.memNo};
	let particularDescription = $('#txtbox').val();
	console.log(particularDescription);
	console.log(partiTargetNo);
	let memNo = null;
	memNo = $('#txtbox').data("memno");
	let data = {
			"code" : "insertParticular",
			"particularDescription" : particularDescription,
			"patntNo" : partiTargetNo,
			"particularWriter" : writer,
			"memNo" : myNo
	}
	if(memNo != null && memNo != "" ){
			let notiData = {
				"code" : "mention",
				"particularDescription" : particularDescription,
				"patntNo" : partiTargetNo,
				"particularWriter" : writer,
				"memNo" : myNo,
				"targetNo" : memNo
			};
			ws.send(JSON.stringify(notiData));
		}
	ws.send(JSON.stringify(data));
	$('#txtbox').data("");
	$('#txtbox').val("");
});

$('#description').click(function(){
	let patntNo = $(this).data("patntno");
	$('#infoToast').hide();
	openSide(patntNo);
	
});

function timeFormat(time){
	// 주어진 시간을 시간과 분으로 분리
    let [hour, minute] = time.split(':').map(Number);
    
    // 시간이 24시 이상이면 12를 빼고 PM으로 설정
    let period = (hour >= 12) ? 'PM' : 'AM';
    // 12시간 형식으로 변경
    hour = (hour > 12) ? hour - 12 : hour;
    // 시간이 0시일 경우 12로 변경
    hour = (hour == 0) ? 12 : hour;
    
    // 시간과 분을 문자열로 결합하여 반환
    return hour.toString().padStart(2, '0') + ':' + minute.toString().padStart(2, '0') + ' ' + period;
}

function openSide(partiTargetNo){
	$('#rside').toggleClass('open');
    $.ajax({
    	url : "/comm/admin/getParticularList",
    	type : "post",
    	data : JSON.stringify(
    	{"patntNo" : partiTargetNo} 		
    	),
    	contentType : "application/json;charset=utf-8",
    	beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	},
    	success : function(parti){
    		console.table(parti);
    		printParticularSide(parti);
    	}
    });
}
$('#outIcon').click(function(){
	$('#rside').toggleClass('open')
});

// 진단서

//현재 날짜, 시간 출력
	// 현재 날짜와 시간을 가져오기 위해 Date 객체 생성
	var now = new Date();
	
	// 연, 월, 일, 시, 분을 가져오기
	var year = now.getFullYear();
	var month = addZero(now.getMonth() + 1); // 월은 0부터 시작하므로 1을 더함
	var day = addZero(now.getDate());
	var hours = addZero(now.getHours());
	var minutes = addZero(now.getMinutes());
	
	// 출력을 위한 포맷 지정
	var formattedDateTime = year + '년' + month + '월' + day + '일  ' + hours + '시' + minutes + '분';
	
	// 현재 날짜와 시간을 출력
	console.log("현재 시간: " + formattedDateTime);
	$("#currentTime").html(formattedDateTime);
	
	// 0을 추가하여 한 자리 숫자를 두 자리 숫자로 변환하는 함수
	function addZero(number) {
	    return (number < 10 ? '0' : '') + number;
	}
	
	//진단서 발행 폼 띄우기
$(document).on("click", ".docu", function(){
	let receiptNo = $(this).data("receiptno"); //진단서 발행 대상 접수번호
	let memNo = $(this).data("memno");
	console.log(receiptNo);
	console.log(memNo);
	
	//인풋박스 리드온리 풀기
		$("#dpDiagDate1").prop("readonly", false);
		$("#dpOnsetDate1").prop("readonly", false);
		$("#dpComment1").prop("readonly", false);
		$("#dpPurpose1").prop("readonly", false);
		$("#dpRemark1").prop("readonly", false);
		
		//pdf발행버튼 숨기고, 진단서 발행버튼 나타나게 하기
	  	$("#diagnosisPaperSendBtn1").show();
	  	$("#savePdfBtn1").hide();
	
	//진단서 모달 열기
	$("#diagnosisPaperModal1").modal('show');

	//기본값 세팅
	let dpPatntNo = $("#dpPatntNo1");
	let dpReceiptNo = $("#dpReceiptNo1");
	let dpName = $("#dpName1");
	let dpRegno = $("#dpRegno1");
	let dpAddress = $("#dpAddress1");
	let dpTel = $("#dpTel1");
	let dpPrimaryDiagnosis = $("#dpPrimaryDiagnosis1");	//주상병
	let dpPrimaryCode = $("#dpPrimaryCode1");
	let dpSysdate = $("#dpSysdate1");
	let dateText = year + '년' + month + '월' + day+ '일  ';

	dpSysdate.text(dateText);
	//부상병은 리스트로
	let dpSecondDiagnosis = $("#dpSecondDiagnosis1");
	let dpSecondCode = $("#dpSecondCode1");
	//의사정보
	let dpDoctor = $("#dpDoctor1");
	let dpDoctorNo = $("#dpDoctorNo1");

	$.ajax({
		url : "/doctor/getDiagnosisPaper",
		type : "POST",
		contentType : 'application/json',
		dataType : 'json',
		data : JSON.stringify({receiptNo : receiptNo}),
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	},
		success : function(res) {
			//    				console.log("성공" + res);
			console.table(res);

			let patntInfo = res.patntInfo; //환자정보
			let doctorInfo = res.doctorInfo; //의사정보
			let diseaseInfoList = res.diseaseInfoList; //상병리스트

			//환자정보
			dpPatntNo.text("0000"+ patntInfo.patntNo); //환자번호
			dpReceiptNo.text("0000"+ receiptNo); //접수번호
			dpName.text(patntInfo.memName); //환자이름
			dpRegno.text(patntInfo.memRegno1+ " - "+ patntInfo.memRegno2); //주민등록번호
			dpAddress.text(patntInfo.memAddress1+ " "+ patntInfo.memAddress2); //주소
			dpTel.text(patntInfo.memTel); //전화번호

			//상병정보
			//주상병
			dpPrimaryDiagnosis.text(diseaseInfoList[0].disNameKr);
			dpPrimaryCode.text(diseaseInfoList[0].disNo);

			let dpSecondDiagnosisList = "<div>";
			let dpSecondCodeList = "<div>";
			//부상병
			for (var i = 1; i < diseaseInfoList.length; i++) {
				dpSecondDiagnosisList += "<p>"+ diseaseInfoList[i].disNameKr+ "</p>";
				dpSecondCodeList += "<p>"+ diseaseInfoList[i].disNo+ "</p>";
				console.log(i);
			}

			dpSecondDiagnosisList += "</div>";
			dpSecondCodeList += "</div>";

			dpSecondDiagnosis.html(dpSecondDiagnosisList);
			dpSecondCode.html(dpSecondCodeList);

			//의사정보
			dpDoctor.text(doctorInfo.memName); //의사이름
			dpDoctorNo.text(doctorInfo.empLicence); //의사이름
			
			$('.docu').fadeOut();
		}
	});
	//진단서 인서트 테스트 버튼
	$("#diagnosisTest").on("click", function(){
		
		
	    $('input[name="diagnosisType1"][data-value="DP002"]').prop('checked', true);

		$("#dpDiagDate1").val("2024-05-17");
		$("#dpOnsetDate1").val("2024-05-17");
		$("#dpComment1").val("상기 환자는 허리통증 및 좌측 하지통증으로 내원함.\n 통증이 심하여 약물치료, 물리치료를 병행하며 치료중인 환자임.\n 향후 4주간의 안정가료 및 보존적 치료가 필요한 것으로 사료됨");
		$("#dpPurpose1").val("보험사 제출용");
		$("#dpRemark1").val("단, 진단명 추가 및 진단기간이 변경될수 있음");
		let paperType = "DT001";
		let diagnosisType = diagnosisValue;
	
	});
	
	
	//진단서 발행 버튼 이벤트(진단서 인서트)
	$("#diagnosisPaperSendBtn1").on("click",function() {
		let selectedValue = '';
		let diagnosisValue = $("input[name='diagnosisType1']:checked").data("value");

		let dpDiagDate = $("#dpDiagDate1").val();
		let dpOnsetDate = $("#dpOnsetDate1").val();
		let dpComment = $("#dpComment1").val();
		let dpPurpose = $("#dpPurpose1").val();
		let dpRemark = $("#dpRemark1").val();
		let paperType = "DT001";
		let diagnosisType = diagnosisValue;
		receiptNo; //접수번호

		let data = {
			diagnosisPaperContent : dpComment,
			diagnosisPaperPurpose : dpPurpose,
			diagnosisPaperType : paperType,
			receiptNo : receiptNo,
			diagnosisPaperRemark : dpRemark,
			diagnosisPaperDiagDate : dpDiagDate,
			diagnosisPaperOnsetDate : dpOnsetDate,
			diagnosisType : diagnosisType
		}

		$.ajax({
			url : "/doctor/insertDiagnosisPaper",
			type : "POST",
			data : JSON.stringify(data),
			contentType : 'application/json',
			dataType : "text",
			beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    	},
			success : function(res) {
				let insertDiagnosisAlert = {
						"code" : "insertDiagnosis",
						"memNo" : memNo,
						"receiptNo" : receiptNo
				};
				ws.send(JSON.stringify(insertDiagnosisAlert))
				$("#diagnosisPaperModal1").modal('hide');
				$('#infoToast').fadeOut();
				console.log("성공!");
			}
		});
	});
});
	$(document).click(function(event){
	    var targetElement = event.target; // 클릭된 요소
	    var isClickInsideInputBox = $('#search-input').has(targetElement).length > 0; // 클릭된 요소가 인풋 박스 내부에 있는지 확인
		
	    // 클릭된 요소가 인풋 박스 내부에 없다면 드롭다운 닫기
	    if (!isClickInsideInputBox) {
	    	$('#search-input').val("");
	    	$('#searchGroup').css("width","200px");
	    	console.log("여기")
	        $('.searchDrop').hide();
	    }
	});
	
	
	// 진단서출력!!!!(pdf발행)
$(document).on("click", ".disa",function(){
	$('#infoToast').fadeOut();
	console.log("123123123123123---------",$(this).data("receiptno"));
	  
// 	  let t = $('.mydia');
	  let receiptNo = $(this).data("receiptno");
	  
	  //발행(입력)버튼 숨기고 pdf 발행버튼 띄우기
	  	$("#diagnosisPaperSendBtn1").hide();
	  	$("#savePdfBtn1").show();
	  
		//진단서 모달 열기

		$("#diagnosisPaperModal1").modal('show');

	  
		//기본값 세팅
		let dpPatntNo = $("#dpPatntNo1");
		let dpReceiptNo = $("#dpReceiptNo1");
		let dpName = $("#dpName1");
		let dpRegno = $("#dpRegno1");
		let dpAddress = $("#dpAddress1");
		let dpTel = $("#dpTel1");
		let dpPrimaryDiagnosis = $("#dpPrimaryDiagnosis1");
		let dpPrimaryCode = $("#dpPrimaryCode1");
		let dpSysdate = $("#dpSysdate1");
		let dateText = year + '년' + month + '월' + day+ '일  ';
		let dpDiagDate = $("#dpDiagDate1");
		let dpOnsetDate = $("#dpOnsetDate1");
		let dpComment = $("#dpComment1");
		let dpPurpose= $("#dpPurpose1");
		let dpRemark = $("#dpRemark1");
		let diagnosisType = $("#diagnosisType1");

		dpSysdate.text(dateText);
		//부상병은 리스트로
		let dpSecondDiagnosis = $("#dpSecondDiagnosis1");
		let dpSecondCode = $("#dpSecondCode1");
		//의사정보
		let dpDoctor = $("#dpDoctor1");
		let dpDoctorNo = $("#dpDoctorNo1");

		$.ajax({
			url : "/doctor/getDiagnosisPaper",
			type : "POST",
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify({receiptNo : receiptNo}),
			beforeSend: function(xhr) {
              // CSRF 토큰 헤더에 추가
             xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
  			},
			success : function(res) {
				//    				console.log("성공" + res);
				console.log(res.diagnosisPaper);

				let patntInfo = res.patntInfo; //환자정보
				let doctorInfo = res.doctorInfo; //의사정보
				let diseaseInfoList = res.diseaseInfoList; //상병리스트
				let diagnosisPaperInfo = res.diagnosisPaper; 	//진단서 입력한 리스트

				//환자정보
				dpPatntNo.text("0000"+ patntInfo.patntNo); //환자번호
				dpReceiptNo.text("0000"+ receiptNo); //접수번호
				dpName.text(patntInfo.memName); //환자이름
				dpRegno.text(patntInfo.memRegno1+ " - "+ patntInfo.memRegno2); //주민등록번호
				dpAddress.text(patntInfo.memAddress1+ " "+ patntInfo.memAddress2); //주소
				dpTel.text(patntInfo.memTel); //전화번호

				//상병정보
				//주상병
				dpPrimaryDiagnosis.text(diseaseInfoList[0].disNameKr);
				dpPrimaryCode.text(diseaseInfoList[0].disNo);

				let dpSecondDiagnosisList = "<div>";
				let dpSecondCodeList = "<div>";
				//부상병
				for (var i = 1; i < diseaseInfoList.length; i++) {
					dpSecondDiagnosisList += "<p>"+ diseaseInfoList[i].disNameKr+ "</p>";
					dpSecondCodeList += "<p>"+ diseaseInfoList[i].disNo+ "</p>";
					console.log(i);
				}

				dpSecondDiagnosisList += "</div>";
				dpSecondCodeList += "</div>";

				dpSecondDiagnosis.html(dpSecondDiagnosisList);
				dpSecondCode.html(dpSecondCodeList);

				//의사정보
				dpDoctor.text(doctorInfo.memName); //의사이름
				dpDoctorNo.text(doctorInfo.empLicence); //의사이름
				
				//진단정보
				dpDiagDate.val(diagnosisPaperInfo.diagnosisPaperDiagDate.substring(0,10));
				dpOnsetDate.val(diagnosisPaperInfo.diagnosisPaperOnsetDate.substring(0,10));
				dpComment.val(diagnosisPaperInfo.diagnosisPaperContent);
				dpPurpose.val(diagnosisPaperInfo.diagnosisPaperPurpose);
				dpRemark.val(diagnosisPaperInfo.diagnosisPaperRemark);
				
				//인풋박스 리드온리로바꾸기
				$("#dpDiagDate1").prop("readonly", true);
				$("#dpOnsetDate1").prop("readonly", true);
				$("#dpComment1").prop("readonly", true);
				$("#dpPurpose1").prop("readonly", true);
				$("#dpRemark1").prop("readonly", true);

				
				if(diagnosisPaperInfo.diagnosisType=='DP001'){
					 $('input[name="diagnosisType1"][data-value="DP001"]').prop('checked', true);
				}
				if(diagnosisPaperInfo.diagnosisType=='DP002'){
					 $('input[name="diagnosisType1"][data-value="DP002"]').prop('checked', true);
				}
				
				
			}
		});
//진단서 pdf변환
$("#savePdfBtn1").on("click",function(){
	$("#savePdfBtn1").hide();
	$("#diagnosisTest").hide();
	
	  window.jsPDF = window.jspdf.jsPDF;
	  console.log("실행!");
		 html2canvas($('#diagnosisPaperPrint1')[0]).then(function(canvas) {
		        // 캔버스를 이미지로 변환
		        let imgData = canvas.toDataURL('image/png');

		        let margin = 10; // 출력 페이지 여백설정
		        let imgWidth = 210 - (10 * 2); // 이미지 가로 길이(mm) A4 기준
		        let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
		        let imgHeight = canvas.height * imgWidth / canvas.width;
		        let heightLeft = imgHeight;

		        let doc = new jsPDF('p', 'mm');
		        let position = margin;

		        // 첫 페이지 출력
		        doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
		        heightLeft -= pageHeight;

		        // 한 페이지 이상일 경우 루프 돌면서 출력
		        while (heightLeft >= 20) {
		            position = heightLeft - imgHeight;
		            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
		            doc.addPage();
		            heightLeft -= pageHeight;
		        }
		        // 파일 저장
		        doc.save('진단서.pdf');
		    });
		 
			$("#diagnosisPaperModal1").modal('hide');
		});
});
	
//진단서 체크박스 하나만 선택하게(라디오버튼처럼)
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("diagnosisType");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
}
	
	
	
	
$(document).on("click", ".collabo",function(){
	$('#infoToast').fadeOut();
});

function getPartiAjax(partiTargetNo){
    $.ajax({
        url : "/comm/admin/getParticularList",
        type : "post",
        data : JSON.stringify(
        {"patntNo" : partiTargetNo}       
        ),
        contentType : "application/json;charset=utf-8",
        beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    },
        success : function(parti){
            console.table(parti);
            printParticularSide(parti);
        }
    });
}

//날짜변환
function formatDate(date) {
	   // 문자열을 Date 객체로 변환
    var date = new Date(date);
	   
    // 요일 이름 배열
    var days = ['일', '월', '화', '수', '목', '금', '토'];

    // 날짜가 유효한지 확인
    if (isNaN(date.getTime())) {
        return "Invalid Date";
    }

    // 년, 월, 일을 가져옴
    var year = date.getFullYear();
    var month = date.getMonth() + 1; // getMonth()는 0부터 시작하므로 1을 더함
    var day = date.getDate();
    var dayOfWeek = days[date.getDay()];

    // 월과 일이 한 자리 숫자인 경우 앞에 0을 추가하여 두 자리로 만듦
    if (month < 10) {
        month = '0' + month;
    }
    if (day < 10) {
        day = '0' + day;
    }

    // 년-월-일 형식으로 반환
    return year + '년 ' + month + '월 ' + day + '일 ' + ' (' + dayOfWeek + ')';
}

//날짜+시간변환
function formatDateWithTime(dateString) {
    // 문자열을 Date 객체로 변환
    var date = new Date(dateString);

    // 요일 이름 배열
    var days = ['일', '월', '화', '수', '목', '금', '토'];

    // 날짜가 유효한지 확인
    if (isNaN(date.getTime())) {
        return "Invalid Date";
    }

    // 년, 월, 일, 시, 분, 요일을 가져옴
    var year = date.getFullYear();
    var month = date.getMonth() + 1; // getMonth()는 0부터 시작하므로 1을 더함
    var day = date.getDate();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var dayOfWeek = days[date.getDay()];

    // 시와 분이 한 자리 숫자인 경우 앞에 0을 추가하여 두 자리로 만듦
    if (hours < 10) {
        hours = '0' + hours;
    }
    if (minutes < 10) {
        minutes = '0' + minutes;
    }

    // 시간 정보가 있는 경우 시간까지 포함하여 반환, 없는 경우 일까지만 반환
    if (isNaN(hours) || isNaN(minutes)) {
        return year + '년 ' + month + '월 ' + day + '일 ' + ' (' + dayOfWeek + ')';
    } else {
        return year + '년 ' + month + '월 ' + day + '일 '+ ' (' + dayOfWeek + ') ' + hours + '시 ' + minutes + '분 ';
    }
}


</script>

