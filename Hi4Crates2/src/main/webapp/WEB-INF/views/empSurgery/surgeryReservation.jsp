<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<!-- FullCalendar Moment.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<!-- FullCalenar Javascript -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>


<!-- FullCalendar Locale -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!-- Sweetalerts JS -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/sweet-alerts.js"></script>
    
<!-- Sweetalerts CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/sweetalert2/sweetalert2.min.css">



<style>
	.alal{
	position: absolute;
    top: 13%;
    left: 50%;
    transform: translate(-50%, -50%)
	}
	.card {
	height:100%;
	}
	
	#table th{
	white-space:nowrap;
	}
	#placeReserveList{
	overflow-y:auto;
	max-width:100%;
	}
	#placeReserveList .custom-card{
	    height: 95px;
	    width: 90%;
	    margin: 5%
	}
</style>
<div class="main-content app-content">
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-xl-2" style="margin-right:-5px;">
				<div class="card custom-card" style="height: 100%;">
					<!-- 제목 시작 -->
					<div class="card-header justify-content-between">
						<div class="card-title">수술 예약 대기 환자</div>
					</div>
					<div id="placeReserveList">
						<c:forEach var="surgeryReservWaitingVO"
							items="${surgeryWaitingList }">
							<input type="hidden" id="surgeryReservationNo">
							<div class="card border custom-card"
								style="background-color: white;">
								<div class="card-header"
									style="height: 30px; background-color: #f6feff !important">
									<span class="fw-semibold fs-13"
										style="position: absolute; left: 12px; top: 7px;">${surgeryReservWaitingVO.clinicName}</span>
								</div>
								<div class="card-body p-2">
									<div
										class="d-flex justify-content-between align-items-start mb-3 flex-wrap"
										style="">
										<div class="d-inline-flex align-items-start position-relative">
											<div class="flex-grow-1">
												<a href="#" class="surgeryMem" 
												data-data='{
												"patntNo" : "${surgeryReservWaitingVO.patntNo }",
												"surgeryReservationNo" : "${surgeryReservWaitingVO.surgeryReservationNo }",
												"doctorName" : "${surgeryReservWaitingVO.doctorName }",
												"patntName" : "${surgeryReservWaitingVO.patntName }",
												"patntAge" : "${surgeryReservWaitingVO.memAge }",
												"patntGender" : "${surgeryReservWaitingVO.memGender }",
												"patntTel" : "${surgeryReservWaitingVO.memTel }",
												"surgeryKindName" : "${surgeryReservWaitingVO.surgeryKindName }",
												"bodycodeName" : "${surgeryReservWaitingVO.bodycodeName }",
												"surgeryDoctor" : "${surgeryReservWaitingVO.surgeryDoctor }"
 												}'><span class="mb-0 d-block fs-15 fw-semibold">${surgeryReservWaitingVO.patntName}</span></a>
												<span class="fs-13 text-muted">${surgeryReservWaitingVO.memGender },
													${surgeryReservWaitingVO.memAge}세</span>
											</div>
										</div>
										<span class="fs-10 badge rounded-pill bg-secondary">${surgeryReservWaitingVO.historyName}</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-xl-3" style="margin-left:-5px; margin-right:-5px;">
        <div class="card custom-card" >
            <div class="card-header justify-content-between">
                    <div class="card-title">환자 상세정보</div>
            </div>
            <div class="card-body">
                <table class="table table-bordered border-primary"">
                    <tbody id="table">
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                    주치의
                            </th>
                            <td>
                                <span id="doctorName"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                    이름
                            </th>
                             <td>
                                <span id="patntName"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                       성별
                            </th>
                             <td>
                                <span id="patntGender"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                       나이
                            </th>
                             <td>
                                <span id="patntAge"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                       전화번호
                            </th>
                             <td>
                                <span id="patntTel"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                       수술 종류
                            </th>
                             <td>
                                <span id="surgeryName"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                       수술 부위
                            </th>
                             <td>
                                <span id="bodypartName"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                    보호자 이름
                            </th>
                             <td>
                                <input type="text" class="form-control" id="protectorName" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                보호자 연락처
                            </th>
                             <td>
                                <input type="text" class="form-control" id="protectorTel" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                    관계
                            </th>
                             <td>
                                <input type="text" class="form-control" id="protectorRelate" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                    예약 날짜
                            </th>
                             <td>
                                <input type="text" class="form-control" id="surgeryReservDate" readonly>
                            </td>
                        </tr>
                       
                        <!-- 시간 셀렉트박스 -->
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                예약 시간
                            </th>
                            <td>
                                <select name="reservation_time" id="surgeryReservTime" class="form-select custom-select">
                                    <!-- <option value="">원하는 진료시간을 선택하세요.</option> -->
                                     <option selected=""></option>
                                    <!-- 9:00부터 12:00까지 -->
                                    <optgroup label="오전">
                                        <option value="09:00">9:00</option>
                                        <option value="09:30">9:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <!-- <option value="12:00">12:00</option> -->
                                    </optgroup>
                                    <!-- 13:00부터 18:00까지 -->
                                    <optgroup label="오후">
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                    </optgroup>
                                </select>
                            </td>
                         </tr>
                        <tr>
                            <th scope="row" class="me-2 fw-semibold">
                                수술실
                            </th>
                            <td>
                                <select name="reservation_time" id="surgeryRoom" class="form-select custom-select">
                                    <optgroup label="수술실">
                                    	<option class="text-muted">수술실 선택</option>
                                        <option value="1" id="surgeryRoom1">수술실 1</option>
                                        <option value="2" id="surgeryRoom2">수술실 2</option>
                                    </optgroup>
                                </select>
                            </td>
                         </tr>
                         <tr>
                         <td colspan="2">
		                <input type="button" value="삭제" class="btn btn-outline-light rounded-pill btn-wave" id="deleteBtn" style="float:right; display:none; margin-right:10px">
		                <input type="button" value="등록" class="btn btn-outline-info rounded-pill btn-wave" id="submitBtn" style="float:right;">
		                </td>
		                </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
			<div class="col-xl-7" style="margin-left:-5px;">
				<div class="row" style="height: 100%; width: 107%;">
					<div class="col-xl-12">
						<div class="card custom-card" >
							<div class="card-header">
								<div class="card-title">일정 등록</div>
								<font style="font-weight: bold; position: absolute; color: red; top: 165%; left: 21%; z-index: 9999;">*수술실 1</font>
								<font style="font-weight: bold; position: absolute; color: orange; top: 200%; left: 21%; z-index: 9999;">*수술실 2</font>
							</div>
							<div class="card-body">
								<div id="calendar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="card bg-white border-0" style="display:none;" id="deleteConfirm">
                                        <div class="alert custom-alert1 alert-danger">
                                            <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert" aria-label="Close"><i class="bi bi-x"></i></button>
                                            <div class="text-center px-5 pb-0">
                                                <svg class="custom-alert-icon svg-danger" xmlns="http://www.w3.org/2000/svg" height="1.5rem" viewBox="0 0 24 24" width="1.5rem" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M15.73 3H8.27L3 8.27v7.46L8.27 21h7.46L21 15.73V8.27L15.73 3zM12 17.3c-.72 0-1.3-.58-1.3-1.3 0-.72.58-1.3 1.3-1.3.72 0 1.3.58 1.3 1.3 0 .72-.58 1.3-1.3 1.3zm1-4.3h-2V7h2v6z"/></svg>
                                                <h5>danger</h5>
                                                <p class="">This alert is created to just show the danger message.</p>
                                                <div class="">
                                                    <button class="btn btn-sm btn-danger m-1">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


<script>
var calData;
var carryData;
	
	

$(function(){
	var calendarPersonal = '';
	console.log("dd")
// 	var calendarEl = $('#calendar');
	var calendarEl = document.querySelector("#calendar");
	console.log(calendar);
	
	function loadCalendar(data){
		console.log("BB")
		$.ajax({
			url :"/surgery/getSurgeryCal",
			type : "get",
			beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    	},
		success : function(res){
				
			if(calData != null) {
				res = calData;
			}
			
		calendarPersonal = new FullCalendar.Calendar(calendarEl, {
// 		       events : [
// 		    	   {
// 					title : "하이",
// 					start : "2024-04-26"
// 		       }
// 		    	   ],
				
				events : res,	
		       initialView: 'dayGridMonth',
		       height : '680px',
		       headerToolbar : {				// 헤드툴바 설정
		           left: 'prev,next,today',
		           center: 'title',
		           right: ''
		       },
		        expandRows : true,
		        selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,	// 드롭 가능 여부 설정
				editable : true,	// 수정 가능 여부 설정
				nowIndicator: true, // 현재 시간 마크
				navLinks : true,	// 링크 활성화 여부 설정
		    	locale: 'ko', // 한국어 설정
				
		    	
		    	
		    	// 날짜 선택
		    	dateClick : function(info){
		    		$('#surgeryRoom1').css("display","block");
		    		$('#surgeryRoom2').css("display","block");
		    		console.log(this);
		    		console.log(info);
		    		let dateStr = info.dateStr;
		    		let dayEl = info.dayEl;
		    		console.log(dayEl);
		    		
		    		if($(dayEl).find(".fc-event-title").text() === "연가"){
					 // 알럿창을 보여줍니다.
					 
					 	let alert = $('<div class="alert alert-warning alert-dismissible fade custom-alert-icon shadow-sm alal" role="alert">'+
				        			'<svg class="svg-warning" xmlns="http://www.w3.org/2000/svg" height="1.5rem" viewBox="0 0 24 24" width="1.5rem" fill="#000000">'+
				        			'<path d="M0 0h24v24H0z" fill="none"/><path d="M1 21h22L12 2 1 21zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z"/></svg>'+
				      				  '해당 날짜에 주치의가 연가중입니다.'+
				        			'<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"><i class="bi bi-x"></i></button>'+
				      				'</div>');
					 	$('body').append(alert);
					 	alert.hide().addClass("show").fadeIn('slow');
					 	setTimeout(function() {
					 		alert.fadeOut('slow');
					 		alert.remove();
					 		}, 2000);
		    			return false;
		    		}
					
		    		
		    		$.ajax({
		    			url:"/surgery/surgerydatecheck",
		    			type:"post",
		    			data : JSON.stringify({"startStr" : dateStr}),
		    			contentType : "application/json; charset=utf-8",
		    			beforeSend: function(xhr) {
	                        // CSRF 토큰 헤더에 추가
	                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	            	},
		    			success : function(res){
		    				console.table(res);
							if(res.length === 2){
							let alert = $('<div class="alert alert-danger  alert-dismissible fade custom-alert-icon shadow-sm alal" role="alert">'+
					        			'<svg class="svg-danger" xmlns="http://www.w3.org/2000/svg" height="1.5rem" viewBox="0 0 24 24" width="1.5rem" fill="#000000"><path d="M0 0h24v24H0z" fill="none"/><path d="M15.73 3H8.27L3 8.27v7.46L8.27 21h7.46L21 15.73V8.27L15.73 3zM12 17.3c-.72 0-1.3-.58-1.3-1.3 0-.72.58-1.3 1.3-1.3.72 0 1.3.58 1.3 1.3 0 .72-.58 1.3-1.3 1.3zm1-4.3h-2V7h2v6z"/></svg>'+
					      				  '비어있는 수술실이 없습니다.'+
					        			'<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"><i class="bi bi-x"></i></button>'+
					      				'</div>');
						 	$('body').append(alert);
						 	alert.hide().addClass("show").fadeIn('slow');
						 	setTimeout(function() {
						 		alert.fadeOut('slow');
						 		alert.remove();
						 		}, 2000);
						 	
			    			return false;
							}
				    		$('#surgeryReservDate').val(dateStr);
				    		
				    		$.each(res,function(idx, item){
				    			if(item.surgeryRoomNo === '1'){
				    				$('#surgeryRoom1').css("display","none");
				    			}
				    			if(item.surgeryRoomNo === '2'){
				    				$('#surgeryRoom2').css("display","none");
				    			}
				    		});
		    			}
		    		});
		    		
		    	},
		    	
		    	eventClick : function(info){
		    		console.table(info);
		    		console.log(info.el.text)
		    		let json = info.event._def.extendedProps;
		    		let bodycodeName = json.bodycodeName;
		    		let doctorName = json.doctorName;
		    		let memAge = json.memAge
		    		let memGender = json.memGender;
		    		let memTel = json.memTel;
		    		let surgeryKindName = json.surgeryKindName;
		    		let surgeryReservationNo = json.surgeryReservationNo;
		    		let patntName = info.el.text
		    		let surgeryRoomNo = json.surgeryRoomNo;
		    		
		    		let instance = info.event._instance;
		    		let startVal = instance.range.start;
		    		let surgeryReservationDate =  startVal.toISOString().split('T')[0].split(' ')[0];
		    		let surgeryReservationTime = json.surgeryReservationTime;
		    		
		    		let protectorNo = json.protectorNo;
		    		let protectorName = json.protectorName;
		    		let protectorRelate = json.protectorRelate;
		    		let protectorTel = json.protectorTel;
		    		
		    		let patntNo = json.patntNo;
		    		
		    		$('#doctorName').text(doctorName)
		    		$('#patntName').text(patntName)
		    		$('#patntGender').text(memGender)
		    		$('#patntAge').text(memAge)
		    		$('#patntTel').text(memTel)
// 		    		if(surgeryKindName.length > 16){
// 			    		$('#surgeryName').text(surgeryKindName.substr(0,16)+"...")
// 		    		}else{
		    			$('#surgeryName').text(surgeryKindName)
// 		    		}
		    		
		    		
		    		$('#bodypartName').text(bodycodeName);
		    		$('#protectorName').val(protectorName);
		    		$('#protectorTel').val(protectorTel);
		    		$('#protectorRelate').val(protectorRelate);
		    		$('#surgeryReservDate').val(surgeryReservationDate);
		    		$('#surgeryReservTime').val(surgeryReservationTime);
		    		$('#surgeryReservationNo').val(surgeryReservationNo);
		    		
		    		
		    		$('#surgeryRoom').val(surgeryRoomNo)
		    		$('#submitBtn').val("수정");
		    		$('#submitBtn').off('click');
		    		$('#submitBtn').attr('id','modifyBtn');
		    		$('#deleteBtn').css("display","block");
		    		
		    		console.log($('#surgeryRoom').val())
		    		
		    		

		    		
		    		$('#modifyBtn').click(function(){
		    			
		    		let datas = {
		    			"surgeryReservationNo": surgeryReservationNo,
		    			"patntNo" : patntNo,
		    			"protectorNo" : protectorNo,
		    			"protectorName" : $('#protectorName').val(),
		    			"protectorTel" : $('#protectorTel').val(),
		    			"protectorRelate" : $('#protectorRelate').val(),
		    			"surgeryReservationDate" : $('#surgeryReservDate').val(),
		    			"surgeryReservationTime" : $('#surgeryReservTime').val(),
		    			"surgeryRoomNo" : $('#surgeryRoom').val()
		    		}
		    		console.table(datas);
		    			$.ajax({
		    				url : "/surgery/modify",
		    				type : "post",
		    				data : JSON.stringify(datas),
		    				contentType : "application/json; charset=utf-8",
		    				beforeSend: function(xhr) {
		                        // CSRF 토큰 헤더에 추가
		                      xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		            	},
		    				success : function(){
		    					location.reload();
		    				}
		    			});
		    		});
		    		$('#deleteBtn').click(function(){
		    			swal.fire({
		    				  title: "수술 취소 확인",
		    				  text: "취소된 일정은 되돌릴 수 없습니다. 정말 취소 하시겠습니까?",
		    				  icon: "warning",
		    				  showCancelButton: true,
		    				  confirmButtonColor: "#3085d6",
		    				  cancelButtonColor: "#d33",
		    				  confirmButtonText: "확인",
		    				  cancelButtonText: "취소"
		    				}).then((result) => {
		    				  if (result.isConfirmed) {
		    				    console.log("사용자가 확인을 선택했습니다.");
		    				    $.ajax({
		    				    	url : "/surgery/delete",
		    				    	type : "post",
		    				    	data : JSON.stringify({
		    				    		"surgeryReservationNo" : surgeryReservationNo
		    				    	}),
		    				    	contentType : "application/json;charset=utf-8",
		    				    	beforeSend: function(xhr) {
		    	                        // CSRF 토큰 헤더에 추가
		    	                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		    	            	},
		    				    	success : function(){
		    				    		location.reload();
		    				    	}
		    				    });
		    				  } else {
		    				    console.log("사용자가 취소를 선택했습니다.");
		    				  }
		    				});
		    		});
		    	}
		    	
		    	
		    	
		    	
		    	
		    	
		    	
         });
		calendarPersonal.render();
			}
		})
	}
	loadCalendar();
	
	
	$(document).on("click",".surgeryMem",function(){
		console.log("ㅇㅇ");
		let data = $(this).data("data");
		carryData = data;
		$('#doctorName').text(data.doctorName);
		$('#patntName').text(data.patntName);
		$('#patntGender').text(data.patntGender);
		$('#patntAge').text(data.patntAge);
		$('#patntTel').text(data.patntTel);
		let surgeryName = data.surgeryKindName;
		let surgeryDoctor = data.surgeryDoctor;
		if(surgeryName.length > 16) {
			surgeryName = surgeryName.substr(0,16);
			$('#surgeryName').text(surgeryName+"...");
		}else{
			$('#surgeryName').text(data.surgeryKindName);
		}
		$('#bodypartName').text(data.bodycodeName);
		
		$.ajax({
			url : "/surgery/empvacationcal",
			type : "post",
			data : JSON.stringify({"empNo" : surgeryDoctor}),
			contentType : "application/json; charset=utf-8",
			beforeSend: function(xhr) {
                // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    	},
			success : function(data){
				calData = data;
				loadCalendar();
			}
		});
	});
});

$('#submitBtn').on("click",function(){
	
	let jsonData = {
			"protectorName" : $('#protectorName').val(),
			"protectorTel" : $('#protectorTel').val(),
			"protectorRelate" : $('#protectorRelate').val(),
			"surgeryReservationDate" : $('#surgeryReservDate').val(),
			"surgeryReservationTime" : $('#surgeryReservTime').val(),
			"surgeryRoomNo" : $('#surgeryRoom').val()
	}
	let mergeJson = Object.assign({}, carryData, jsonData);
	$.ajax({
		url : "/surgery/reservation",
		type : "post",
		data : JSON.stringify(mergeJson),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	},
		success : function(res){
			if(res === "SUCCESS"){
				location.reload();
			}
		}
	});
});

</script>