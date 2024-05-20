<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.beddie {
	width: 50px;
	height: auto;
	float: left;
}
.brightness {
	-webkit-filter: brightness(0.50);
	filter: brightness(0.50);
}
.opacity {
	-webkit-filter: opacity(50%);
	filter: opacity(50%) grayscale(1);
}
.btn-sm {
	width: 3.25em;
	font-size: 8px;
/* 	display: flex; */
	align-items:center;
/* 	justify-content: center; */
}
.btn-bed {
	align-items:center;
	text-align: center;
	margin: 4px 15px;
}
.posibad {
	position : absolute !important;
	right : 5px;
}
.table-bed{
	width: 560px;
	table-layout: fixed;
}
</style>
</head>
<body>
	<!-- 본문 시작 -->
	<!-- Start::app-content -->
	<div class="main-content app-content">
		<div class="container-fluid">

			<!-- Start::row-1 -->
			<div class="row">
<!-- 				<div class="col-xxl-2 col-xl-12"> -->
				<div class="col-xl-2">
					<div class="row">
<!-- 						<div class="col-xxl-12 col-xl-6"> -->
						<div class="col-xl-12">
							<div class="card custom-card">

								<div class="card-header">
									<div class="card-title">환자 목록</div>
								</div>

								<div class="card-body p-0" id="waitingList">
								</div>
								
<!-- 								<div class="card-footer p-0"></div> -->
							</div>
						</div>
					</div>
				</div>

<!-- 				<div class="col-xxl-10 col-xl-12"> -->
				<div class="col-xl-4">

					<div class="card custom-card" style="height: 37vh;">
						<div class="card-header">
							<div class="card-title">오더 조회</div>
						</div>
						
						<div class="card-body" data-simplebar style="overflow-y: auto;">
							<ul class="list-group list-group-flush">
								<li class="list-group-item" id="order1">
									<p class="card-title fw-semibold">환자이름 (성별, 나이)</p>
								</li>
								<li class="list-group-item" id="order2">
									<p class="card-title fw-semibold">오더종류</p>
								</li>
								<li class="list-group-item" id="order3">
									<p class="card-title fw-semibold">치료부위</p>
								</li>
								<li class="list-group-item" id="order4">
									<p class="card-title fw-semibold">진료차트</p>
								</li>
							</ul>
						</div>
						
					</div>

					<div class="row-xl-3">
						<div class="card custom-card" style="height: 37vh;">
							<div class="card-header">
								<div class="card-title">치료세팅</div>
							</div>
							<div class="card-body" style="overflow-y: auto;">
								<div>
									<div>
	<!-- 									<p class="fw-semibold mb-3 d-flex align-items-center"> -->
									</div>
									<div>
										<p class="card-title fw-semibold">치료부위 </p>
										<div id="treatPart"></div>
									</div>
									<hr>
									<div>
										<p class="card-title fw-semibold">치료방법 </p>
<!-- 										<div id="treat1"></div> -->
										<div id="treat2"></div>
									</div>
									<hr>
									<div>
										<p class="card-title fw-semibold">치료기기 </p>
										<div id="treat3"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-6">
					<div class="row">
						<div class="col-xl-12">
							<div class="card custom-card">
								<div class="card-header d-flex justify-content-between">
									<div class="card-title">환자 배치</div>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table text-nowrap table-bordered table-bed">
											<tr>
												<td>
													<div id="bed1name"></div>
												</td>
												<td>
													<div id="bed2name"></div>
												</td>
												<td>
													<div id="bed3name"></div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="container">
														<!-- <div style="position: relative;" onclick="countDown('bed1');"> -->
														<img id="bed1"
															src="/resources/assets/img/bedtime-icon.png"
															class="brightness opacity beddie">
<!-- 														<div style="position: absolute;"> -->
														<!-- </div> -->
													</div>
												</td>
												<td>
													<div class="container">
														<img id="bed2"
															src="/resources/assets/img/bedtime-icon.png"
															class="brightness opacity beddie">
														<!-- </div> -->
													</div>
												</td>
												<td>
													<div class="container">
														<img id="bed3"
															src="/resources/assets/img/bedtime-icon.png"
															class="brightness opacity beddie">
														<!-- </div> -->
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="container" style="display:flex;">
														<div id="bed1_1">
															<span style='color: #808080; font-size: large;'>00:00</span>
														</div>
														<div>
															<button class='btn btn-light btn-sm' id='bed1Done'>완료</button>
														</div>
													</div>
												</td>
												<td>
													<div class="container" style="display:flex;">
														<div id="bed2_1">
															<span style='color: #808080; font-size: large;'>00:00</span>
														</div>
														<div>
															<button class='btn btn-light btn-sm' id='bed2Done'>완료</button>
														</div>
													</div>
												</td>
												<td>
													<div class="container" style="display:flex;">
														<div id="bed3_1">
															<span style='color: #808080; font-size: large;'>00:00</span>
														</div>
														<div>
															<button class='btn btn-light btn-sm' id='bed3Done'>완료</button>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div id="bed4name"></div>
												</td>
												<td>
													<div id="bed5name"></div>
												</td>
												<td>
													<div id="bed6name"></div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="container">
														<img id="bed4"
															src="/resources/assets/img/bedtime-icon.png"
															class="brightness opacity beddie">
														<!-- </div> -->
													</div>
												</td>
												<td>
													<div class="container">
														<img id="bed5"
															src="/resources/assets/img/bedtime-icon.png"
															class="brightness opacity beddie">
														<!-- </div> -->
													</div>
												</td>
												<td>
													<div class="container">
														<div style="position: relative;"
															onclick="countDown('bed6');">
															<img id="bed6"
																src="/resources/assets/img/bedtime-icon.png"
																class="brightness opacity beddie">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="container" style="display:flex;">
														<div id="bed4_1">
															<span style='color: #808080; font-size: large;'>00:00</span>
														</div>
														<div>
															<button class='btn btn-light btn-sm' id='bed4Done'>완료</button>
														</div>
													</div>
												</td>
												<td>
													<div class="container" style="display:flex;">
														<div id="bed5_1">
															<span style='color: #808080; font-size: large;'>00:00</span>
														</div>
														<div>
															<button class='btn btn-light btn-sm' id='bed5Done'>완료</button>
														</div>
													</div>
												</td>
												<td>
													<div class="container" style="display:flex;">
														<div id="bed6_1">
															<span style='color: #808080; font-size: large;'>00:00</span>
														</div>
														<div>
															<button class='btn btn-light btn-sm' id='bed6Done'>완료</button>
														</div>
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-12">
							<div class="card custom-card" style="height: 31vh;">
								<div class="card-header d-flex justify-content-between">
									<div class="card-title">치료 기록</div>
								</div>
								<div class="card-body">
									<div id="reportInfo">
										<p class="card-title fw-semibold">환자</p>
									</div>
									<div id="typeInfo">
										<p class="card-title fw-semibold">시행 치료</p>
									</div>
									<div>
										<p class="card-title fw-semibold">치료 요약</p>
	<!-- 									<div id="selectArea"></div> -->
										<div>
											<textarea class="form-control" id="ptRecordContent" placeholder="치료 요약을 작성합니다."></textarea>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-info" id="finish">저장</button>
									<button type="button" class="btn btn-teal-gradient btn-wave" id="testPhy">test</button>
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
	<!--본문 끝-->

</body>
<script type="text/javascript">
// 로그인한 사용자(물리치료사) empNo 구하기
var therapist = ${sessionScope.user.member.memNo};
console.log("therapist: " + therapist);
var theraEmpNo;
$(function(){
	console.log("therapist 값 function 안에서 보기: " + therapist);
	$.ajax({
		url: '/emp/physical/theraNo',
		type: 'post',
		contentType : "application/json",	// 서버에 전송하는 데이터 타입
		data : JSON.stringify({"memNo": therapist}),
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success: function(res) {
			console.log("therapist empNo 가져온 것으로 판정");
			if(!res){
				console.log("therapist empNo 조회 실패!");
			}else{
				theraEmpNo = res;
				console.log("theraEmpNo? " + res);
			}
		}	// success 끝
	});	// ajax 끝
});	// function 끝
// 대기 환자 목록 조회
function getWaitingList(){
	$.ajax({
		url: '/emp/physical/patnts',
		type: 'POST',
		dataType: 'json', // 서버에서 응답으로 JSON을 사용하는 경우
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success: function(data) {
			// 서버에서 받은 데이터를 처리하여 HTML 업데이트
			console.log("function getWaitingList()");
			console.log("data!!! " + data);
				
			let html = '';
			let sites = [
				{value: 'LOC008', text: '물리치료실'},
				{value: 'LOC009', text: '물리치료 대기실'},
				{value: 'LOC012', text: '수납 대기실'},
			];
			let states = [
				{value: 'HS001', text: '대기중'},
				{value: 'HS003', text: '치료중'},
			];
			
				
			// 환자 목록 생성
			$.each(data, function(index, item) {
				
				// 공통 서식 시작
				html += '<div class="card border custom-card" style="background-color:white; width: 88%; height: 110px;margin-left: 10px;margin-bottom: 10px; margin-top: 5px;">';
				html += 	'<div class="card-header" style="height: 30px; background-color: #f6feff !important">';
				html += 		'<span class="fw-semibold fs-13" style="position: absolute; left: 12px; ">';
				// 장소 표시
				$.each(sites, function(index, site) {
					if (item.historyLoc === site.value) {
						html += site.text;
					}
				});
				
				html += 		'</span>';
				html += 	'</div>';
				html += 	'<div class="card-body p-3" style="width: 240px;height: 110px;margin-left: 10px;margin-bottom: 10px;">';
				html += 		'<div class="d-flex justify-content-between align-items-start mb-3 flex-wrap" style="">';
				html += 			'<div class="d-inline-flex align-items-start position-relative">';
				html += 				'<a href="javascript:void(0)" id="waitingMem" data-memNo="'+item.memNo+'"  data-receiptNo="'+item.receiptNo+'" class="stretched-link"></a>';
				html += 				'<div class="flex-grow-1">';
				html += 					'<span class="mb-0 d-block fs-15 fw-semibold pickPt">';
				html += 						item.memName;
				html += 					'</span>';
				html += 					'<span class="fs-13 text-muted">';
				html += 						item.memGender + ', ' + item.memAge + '세'
				html += 					'</span>';
				html += 				'</div>';
				html += 			'</div>';
				// 환자 상태 표시 뱃지(대기중/치료중)
				$.each(states, function(index, state) {
					if(state.value === 'HS003'){
						html += '<span class="fs-10 badge rounded-pill bg-secondary posibad">';
					}else if(state.value === 'HS001'){
						html += '<span class="fs-10 badge rounded-pill bg-light text-dark posibad">';
					}else{
						console.log("적절한 historyStatus 없음!");
					}
					if (item.historyStatus === state.value) {
						html += state.text;
						console.log("state.text 추가!");
					}
					html += 			'</span>';
				});
				html += 		'</div>';
				html += 		'<input type="hidden" value="' + item.receiptNo + '" />';
				html += 	'</div>';
				html += '</div>';
				// 공통 서식 끝
			});	// $.each 끝
			
			// HTML 업데이트
			$('#waitingList').html(html);
		}	// success 끝
// 		error: function(xhr, status, error) {
// 			console.error(xhr.responseText); // 에러 처리
// 		}
	});
}	// getWaitingList() function 끝
// 대기환자 목록조회 끝
////////////////////////////////////////////////////////////////////////////////////////////////////
// 페이지 로드 후 처음 한 번 요청을 실행
getWaitingList();
// 비동기 요청 반복 실행
setInterval(getWaitingList, 3000);	// 실행간격 시간 설정
////////////////////////////////////////////////////////////////////////////////////////////////////
var memNo;
var memName;
var memGender;
var memAge;
var orderNo;
var empNo;
var receiptNo;
var therapyType;
// 환자 목록에서 환자 클릭시: 오더 & 치료세팅 출력
$('body').on('click','#waitingMem',function(event){
// 	event.preventDefault();
	memNo = $(this).attr('data-memNo');
	receiptNo = $(this).attr('data-receiptNo');
	console.log("memNo: " + memNo + " | receiptNo: " + receiptNo);
	let data = {
		memNo : memNo,
		receiptNo : receiptNo
	};
	
	$.ajax({
		url : "/emp/physical/order",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(data),
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
		},
		success : function (res) {
			console.log("order ajax - res: " + res);
			
			// 오더 조회 구역
			let order1 = $('#order1');
			let order2 = $('#order2');
			let order3 = $('#order3');
			let order4 = $('#order4');
			// 치료세팅 구역
			let treatPart = $('#treatPart');
			let treat1 = $('#treat1');
			let treat2 = $('#treat2');
			let treat3 = $('#treat3');

			// 오더 조회에 뿌릴 html 코드 목록
			let html1 = "";
			let html2 = "";
			let html3 = "";
			let html4 = "";
			
			// 치료세팅에 뿌릴 html 코드 목록
			let htmlTreat = "";
			let htmlTreat1 = "";
			let htmlTreat2 = "";
			let htmlTreat3 = "";
			
			// 치료부위 값 담을 곳
			let bodyCodes = res.bodyCodes;
			// 오더코드 값 담을 곳
			let orderCodes = res.orderCodes;
			console.log("orderCodes 값 있니? " + orderCodes);
			// 접수번호 값 담기
			receiptNo = res.chartVO.receiptNo;
			console.log("order ajax - receiptNo: " + receiptNo);
			// 값 세팅 시작
			memName = res.memName;
			memGender = res.memGender;
			memAge = res.memAge;
			
			// pt_record 기록용 정보 담기
			orderNo = res.orderVO.orderNo;
			empNo = res.orderVO.empNo;

			html1 += '<span class="card-title fw-semibold">' + memName + '</span>';
			html1 += " (" + memGender + ", " + memAge + "세)";
			html2 += '<p class="card-title fw-semibold">' + "오더코드 " + '</p>';
			// 오더코드 추가하며 치료세팅의 치료장비/치료종류 출력하기
			console.log("order ajax - orderCodes 직전");
			let orderList = [];
			therapyType = "";
			therapyType += "<span class='card-title fw-semibold'>시행 치료</span> ";
			$.each(orderCodes, function(index, value){
				console.log("$.each orderCodes 시작");
				if (value === null){
					return true;	// null이면 넘어가기
				}
// 				console.table(value);
// 				console.log(orderList);
				if(value.orderCode === 'OD003' && !orderList.includes(value.orderCode)){
					orderList.push(value.orderCode);
					html2 += value.orderCode;
					html2 += "(온열 치료) ";
					htmlTreat2 += "온열 치료 | ";
					therapyType += "온열 치료 | ";
				}else if(value.orderCode === 'OD008' && !orderList.includes(value.orderCode)){
					orderList.push(value.orderCode);
					html2 += value.orderCode;
					html2 += "(초음파 치료) ";
					htmlTreat2 += "초음파 치료 | ";
					therapyType += "초음파 치료 | ";
				}else if(value.orderCode === 'OD009' && !orderList.includes(value.orderCode)){
					orderList.push(value.orderCode);
					html2 += value.orderCode;
					html2 += "(충격파 치료) ";
					htmlTreat2 += "충격파 치료 | ";
					therapyType += "충격파 치료 | ";
				}
				console.log("$.each orderCodes 끝");
			});	// $.each 끝
			console.log("order ajax - orderCodes 끝");
			
			// 사용한 치료 기기 선택
			// selectbox html 담을 공간 => treat3, htmlTreat3
			// ajax로 기기 목록 가져오기
			console.log("order ajax - /equip 시작");
			$.ajax({
				url : "/emp/physical/equip",
				type : "get",
				contentType: "application/json;charset=utf-8",
				data: JSON.stringify(),
				beforeSend: function(xhr) {
		            // CSRF 토큰 헤더에 추가
		           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
				},
				success : function (list) {
					console.log("/equip: list " + list);
					
					htmlTreat3 += '<select class="form-select" onchange="selectedTherapyFunction(this.value)">';
						// db medical_equip 에서 리스트로 가져와서 Each로 빼기
						$.each(list, function(index, item) {
							htmlTreat3 += '<option value="' + item.eqNo + '">' + item.eqName + ' | ' + item.eqModel + '</option>';
						});	// .each 끝
					htmlTreat3 += '</select>';
					treat3.html(htmlTreat3);
					
				}	// success 끝
			});	// ajax 끝
			// 오더조회 구역
			console.log("/equip ajax 끝");
			
			// 치료세팅:
			html3 += '<p class="card-title fw-semibold">' + "치료부위 " + "</p>";
			let bodyList = [];
			$.each(bodyCodes, function(index, idx) {
// 				console.log(bodyList);
				console.log("치료부위 bodyCodes $.each 시작");
				if (idx === null){
					return true;	// null이면 넘어가기
				}
				if(!bodyList.includes(idx.codeName)){
					bodyList.push(idx.codeName);
					html3 += idx.codeName;
					html3 += " | ";
					htmlTreat += idx.codeName + " | ";
				}
				console.log("치료부위 bodyCodes $.each 끝");
			});	// $.each 종료
			html3 += "<br/>"; 
			
			html4 += '<span class="card-title fw-semibold">' + "차트 기록: " + '</span>' 
					+ res.chartVO.chartRecord + "<br/>";
			html4 += '<span class="card-title fw-semibold">' 
					+ "담당 의사: " + '</span>' + res.docName + "<br/>";
			
			// html 뿌리기
			order1.html(html1);
			order2.html(html2);
			order3.html(html3);
			order4.html(html4);
			treatPart.html(htmlTreat);
			treat1.html(htmlTreat1);
			treat2.html(htmlTreat2);
// 			treat3.html(htmlTreat3);
		}
	});
});
////////////////////////////////////////////////////////////////////////////////////////////////////
var selectedTherapy = '1';	// 기기번호 저장
//select에서 onchange로 값 선택
function selectedTherapyFunction(value){
	selectedTherapy = value;
	console.log("selectedTherapy: " + selectedTherapy);
}
// test 버튼 클릭시 텍스트 입력
$('#testPhy').on('click', function(){
	let phyTest = "환부에 오더에 따른 물리 치료 진행했습니다.";
	$('#ptRecordContent').val(phyTest);
});
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//클릭 타이머 코드
var timer1;
// 침대별 값 세팅
var dataPtNo1 = "1";
var dataEmpNo1;
var dataOrderNo1;
var receiptNo1;
var memNo1;
var selectedTherapy1;
var therapyType1;
// 침대1 타이머
$("#bed1").on("click",function() {
	console.log("click 이벤트 인식 ");
	var image = $("#bed1");
	var isBrightness = image.hasClass("brightness");
	var isOpacity = image.hasClass("opacity");
	const bedded1 = document.getElementById('bed1_1');

// 	var time = 10;
//	var min = "";
//	var sec = "";
	// var isStopped = true;

	// 값 임시로 담아놓기
	dataEmpNo1 = empNo;
	dataOrderNo1 = orderNo;
	memNo1 = memNo;
	receiptNo1 = receiptNo;
	console.log("receipNo1: " + receiptNo1);
	selectedTherapy1 = selectedTherapy;
	therapyType1 = therapyType;
	// 이미지 CSS로 상태 파악
	if (isBrightness && isOpacity) {
		console.log("class 존재 인식 ");
		clearInterval(timer1); // 이미 진행 중인 카운트다운을 멈춤
		image.removeClass("brightness opacity");

		console.log("memNo1: " + memNo1);
		console.log("dataEmpNo1: " + dataEmpNo1);
		var data = {
				"memNo": memNo1,
				"empNo": dataEmpNo1,
				"receiptNo": receiptNo1
			};
		
		// 값 가져가서 pt_status update 를 ajax로
		$.ajax({
			url : "/emp/physical/statusStart",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            // CSRF 토큰 헤더에 추가
	           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function (res) {
				console.log("환자 상태 변경 res: " + res);
				if (res === "success"){
					console.log("환자 상태변경 성공!");
				}else{
					console.log("환자 상태변경 실패!!!!");
				}
			}	// success 끝
		});	// ajax 끝
		
		// 타이머 구역
		var time = 900;	// 카운트다운 시간 설정
		timer1 = setInterval(function() {
			var min = parseInt(time / 60);
			var sec = time % 60;

			bedded1.innerHTML =
				"<div class='container'>" +
					"<div class='inline-block'>" +
						"<div>" +
							"<span style='font-size:large;'>" + min
								+ ":" + sec + "</span>" +
						"</div>" +
					"</div>" +
				"</div>";
			time--;

			if (time < 0) {
				clearInterval(timer1);
				image.addClass("brightness opacity");

				bedded1.innerHTML = 
						"<div class='container'>"
							+ "<div class='inline-block'>"
								+ "<div>"
									+ "<span style='color:#808080;font-size:large;'>00:00</span>"
								+ "</div>"
							+ "</div>"
						+ "</div>";
				
			}	// if (time < 0) 종료
		}, 1000);	// setInterval 끝
		// 타이머 구역 끝
		
		// 침대(환자배치 메뉴) '완료' 버튼 클릭 이벤트
		$("#bed1Done").on("click",function() {
			// 타이머 중단 및 이미지 변경
			clearInterval(timer1);
			image.addClass("brightness opacity");
			// 초시계 초기화
			bedded1.innerHTML = 
				"<div class='container'>"
					+ "<div class='inline-block'>"
						+ "<div>"
							+ "<span style='color:#808080;font-size:large;'>00:00</span>"
						+ "</div>"
					+ "</div>"
				+ "</div>";
			
			// 침대제목 비우기
			$('#bed1name').html("");
			
			// '치료 기록' 칸에 값 넣기
			// 환자 신상 입력
			let report =
					'<span class="card-title fw-semibold">' + memName + '</span>'
					+ " (" + memGender + ", " + memAge + "세)";
			$('#reportInfo').html(report);
			// 치료 종류 입력
			let typeInfo = $('#typeInfo');
			typeInfo.html(therapyType1);
			console.log('typeInfo: ' + therapyType1);
				
			// 치료 기록 작성 후 '저장' 버튼 클릭 이벤트
			$("#finish").on("click",function() {
				// 보낼 값 정리
				dataPtNo1;	// "1" 들어있음
				dataEmpNo1 = theraEmpNo;	// 물리치료사 empNo
				dataOrderNo1;	// orderNo 들어있음;
// 				let ptEqNo = selectedTherapy;	// onchange 함수로 구한 값
				let ptRecordContent = $('#ptRecordContent').val();	// textarea id로 가져옴
				
				// 치료기록 등록을 위한 data
				let data = {
						ptEqNo: selectedTherapy1,
						ptRecordContent: ptRecordContent,
						ptNo: dataPtNo1,
						empNo: dataEmpNo1,
						orderNo: dataOrderNo1
				};
				
				// 치료기록 등록을 위해 data 전송
				$.ajax({
					url : "/emp/physical/report",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (insert) {
						console.log("환자 치료기록 입력 insert: " + insert);
						if (insert === 'success'){
							console.log("(침대1) 치료기록 입력 성공!");
							$('#reportInfo').html("");
							$('#typeInfo').html("");
							$('#ptRecordContent').val("");
// 							alert("치료 기록을 입력했습니다.");
							Swal.fire({
								title: "입력 완료!",
								text: "치료기록을 입력했습니다.",
								icon: "success"
							});
							location.reload();
						}else{
							console.log("치료기록 입력 실패!!!!!");
// 							alert("치료기록을 입력하지 못했습니다.");
							Swal.fire({
								title: "입력 실패!",
								text: "치료기록을 입력하지 못했습니다.",
								icon: "error"
							});
						}
					},	// success 끝
					error: function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});	// 치료기록 등록 ajax 끝
				
				// 환자 위치&상태 변경
				$.ajax({
					url : "/emp/physical/statusDone",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify({
						receiptNo: receiptNo1
					}),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (statusDone) {
						console.log("환자 상태 변경 statusDone: " + statusDone);
						if (statusDone === 'success'){
							console.log("환자상태 변경 성공!");
						}else{
							console.log("환자상태 변경 실패!!!!!");
						}
							console.log("환자다시뽑기")
							getWaitingList();
					}	// success 끝
				});	// 상태변경 ajax 끝
				
			});	// 치료기록 '저장' 버튼 클릭 이벤트 끝
						
		});	// 완료버튼 클릭이벤트 종료
		
		// 환자 정보 세팅 (침상배정 표 상단 tr)
		let bedName1 = $('#bed1name');
		let htmlName1 = '';
		htmlName1 += memName;
		htmlName1 += " (" + memGender + ", " + memAge + "세)";
		bedName1.html(htmlName1);
		
	} else {	// 이미지 CSS로 상태파악 끝
		// 한번 더 눌렀을 때
		console.log("class 없음");
		clearInterval(timer1);
		image.addClass("brightness opacity");
		//	bedded1.innerHTML = "<span style='color:#808080;font-size:large;'>00:00</span>";
	}
});
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//클릭 타이머 코드
var timer2;
// 침대별 값 세팅
var dataPtNo2 = "2";
var dataEmpNo2;
var dataOrderNo2;
var receiptNo2;
var memNo2;
var selectedTherapy2;
var therapyType2;
// 침대2 타이머
$("#bed2").on("click",function() {
	console.log("click 이벤트 인식 ");
	var image = $("#bed2");
	var isBrightness = image.hasClass("brightness");
	var isOpacity = image.hasClass("opacity");
	const bedded2 = document.getElementById('bed2_1');

	// 값 임시로 담아놓기
	dataEmpNo2 = empNo;
	dataOrderNo2 = orderNo;
	memNo2 = memNo;
	receiptNo2 = receiptNo;
	console.log("receipNo2: " + receiptNo2);
	selectedTherapy2 = selectedTherapy;
	therapyType2 = therapyType;
	// 이미지 CSS로 상태 파악
	if (isBrightness && isOpacity) {
		console.log("class 존재 인식 ");
		clearInterval(timer2); // 이미 진행 중인 카운트다운을 멈춤
		image.removeClass("brightness opacity");

		console.log("memNo2: " + memNo2);
		console.log("dataEmpNo2: " + dataEmpNo2);
		var data = {
				"memNo": memNo2,
				"empNo": dataEmpNo2,
				"receiptNo": receiptNo2
			};
		
		// 값 가져가서 pt_status update 를 ajax로
		$.ajax({
			url : "/emp/physical/statusStart",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            // CSRF 토큰 헤더에 추가
	           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function (res) {
				console.log("환자 상태 변경 res: " + res);
				if (res === "success"){
					console.log("환자 상태변경 성공!");
				}else{
					console.log("환자 상태변경 실패!!!!");
				}
			}	// success 끝
		});	// ajax 끝
		
		// 타이머 구역
		var time = 900;	// 카운트다운 시간 설정
		timer2 = setInterval(function() {
			var min = parseInt(time / 60);
			var sec = time % 60;

			bedded2.innerHTML =
				"<div class='container'>" +
					"<div class='inline-block'>" +
						"<div>" +
							"<span style='font-size:large;'>" + min
								+ ":" + sec + "</span>" +
						"</div>" +
					"</div>" +
				"</div>";
			time--;

			if (time < 0) {
				clearInterval(timer2);
				image.addClass("brightness opacity");

				bedded2.innerHTML = 
						"<div class='container'>"
							+ "<div class='inline-block'>"
								+ "<div>"
									+ "<span style='color:#808080;font-size:large;'>00:00</span>"
								+ "</div>"
							+ "</div>"
						+ "</div>";
				
			}	// if (time < 0) 종료
		}, 1000);	// setInterval 끝
		// 타이머 구역 끝
		
		// 침대(환자배치 메뉴) '완료' 버튼 클릭 이벤트
		$("#bed2Done").on("click",function() {
			// 타이머 중단 및 이미지 변경
			clearInterval(timer2);
			image.addClass("brightness opacity");
			// 초시계 초기화
			bedded2.innerHTML = 
				"<div class='container'>"
					+ "<div class='inline-block'>"
						+ "<div>"
							+ "<span style='color:#808080;font-size:large;'>00:00</span>"
						+ "</div>"
					+ "</div>"
				+ "</div>";
			
			// 침대제목 비우기
			$('#bed2name').html("");
			
			// '치료 기록' 칸에 값 넣기
			// 환자 신상 입력
			let report =
					'<span class="card-title fw-semibold">' + memName + '</span>'
					+ " (" + memGender + ", " + memAge + "세)";
			$('#reportInfo').html(report);
			// 치료 종류 입력
			let typeInfo = $('#typeInfo');
			typeInfo.html(therapyType2);
			console.log('typeInfo: ' + therapyType2);
				
			// 치료 기록 작성 후 '저장' 버튼 클릭 이벤트
			$("#finish").on("click",function() {
				// 보낼 값 정리
				dataPtNo2;	// "2" 들어있음
				dataEmpNo2 = theraEmpNo;	// 물리치료사 empNo
				dataOrderNo2;	// orderNo 들어있음;
// 				let ptEqNo = selectedTherapy;	// onchange 함수로 구한 값
				let ptRecordContent = $('#ptRecordContent').val();	// textarea id로 가져옴
				
				// 치료기록 등록을 위한 data
				let data = {
						ptEqNo: selectedTherapy2,
						ptRecordContent: ptRecordContent,
						ptNo: dataPtNo2,
						empNo: dataEmpNo2,
						orderNo: dataOrderNo2
				};
				
				// 치료기록 등록을 위해 data 전송
				$.ajax({
					url : "/emp/physical/report",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 치료기록 입력 res: " + res);
						if (res === 'success'){
							console.log("(침대2) 치료기록 입력 성공!");
							$('#reportInfo').html("");
							$('#typeInfo').html("");
							$('#ptRecordContent').val("");
							Swal.fire({
								title: "입력 완료!",
								text: "치료기록을 입력했습니다.",
								icon: "success"
							});
							location.reload();
						}else{
							console.log("치료기록 입력 실패!!!!!");
							Swal.fire({
								title: "입력 실패!",
								text: "치료기록을 입력하지 못했습니다.",
								icon: "error"
							});
						}
					}	// success 끝
				});	// 치료기록 등록 ajax 끝
				
				// 환자 위치&상태 변경
				$.ajax({
					url : "/emp/physical/statusDone",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify({
						receiptNo: receiptNo2
					}),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 상태 변경 res: " + res);
						if (res === 'success'){
							console.log("환자상태 변경 성공!");
						}else{
							console.log("환자상태 변경 실패!!!!!");
						}
					}	// success 끝
				});	// 상태변경 ajax 끝
				
			});	// 치료기록 '저장' 버튼 클릭 이벤트 끝
						
		});	// 완료버튼 클릭이벤트 종료
		
		// 환자 정보 세팅 (침상배정 표 상단 tr)
		let bedName2 = $('#bed2name');
		let htmlName2 = '';
		htmlName2 += memName;
		htmlName2 += " (" + memGender + ", " + memAge + "세)";
		bedName2.html(htmlName2);
		
	} else {	// 이미지 CSS로 상태파악 끝
		// 한번 더 눌렀을 때
		console.log("class 없음");
		clearInterval(timer2);
		image.addClass("brightness opacity");
		//	bedded2.innerHTML = "<span style='color:#808080;font-size:large;'>00:00</span>";
	}
});
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//클릭 타이머 코드
var timer3;
// 침대별 값 세팅
var dataPtNo3 = "3";
var dataEmpNo3;
var dataOrderNo3;
var receiptNo3;
var memNo3;
var selectedTherapy3;
var therapyType3;
// 침대3 타이머
$("#bed3").on("click",function() {
	console.log("click 이벤트 인식 ");
	var image = $("#bed3");
	var isBrightness = image.hasClass("brightness");
	var isOpacity = image.hasClass("opacity");
	const bedded3 = document.getElementById('bed3_1');

// 	var time = 10;
// 	var min = "";
// 	var sec = "";

	// 값 임시로 담아놓기
	dataEmpNo3 = empNo;
	dataOrderNo3 = orderNo;
	memNo3 = memNo;
	receiptNo3 = receiptNo;
	console.log("receipNo3: " + receiptNo3);
	selectedTherapy3 = selectedTherapy;
	therapyType3 = therapyType;
	
	// 이미지 CSS로 상태 파악
	if (isBrightness && isOpacity) {
		console.log("class 존재 인식 ");
		clearInterval(timer3); // 이미 진행 중인 카운트다운을 멈춤
		image.removeClass("brightness opacity");

		console.log("memNo3: " + memNo3);
		console.log("dataEmpNo3: " + dataEmpNo3);
		var data = {
				"memNo": memNo3,
				"empNo": dataEmpNo3,
				"receiptNo": receiptNo3
			};
		
		// 값 가져가서 pt_status update 를 ajax로
		$.ajax({
			url : "/emp/physical/statusStart",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            // CSRF 토큰 헤더에 추가
	           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function (res) {
				console.log("환자 상태 변경 res: " + res);
				if (res === 'success'){
					console.log("환자 상태변경 성공!");
				}else{
					console.log("환자 상태변경 실패!!!!");
				}
			}	// success 끝
		});	// ajax 끝
		
		// 타이머 구역
		var time = 900;	// 카운트다운 시간 설정
		timer3 = setInterval(function() {
			var min = parseInt(time / 60);
			var sec = time % 60;

			bedded3.innerHTML =
				"<div class='container'>" +
					"<div class='inline-block'>" +
						"<div>" +
							"<span style='font-size:large;'>" + min
								+ ":" + sec + "</span>" +
						"</div>" +
					"</div>" +
				"</div>";
			time--;

			if (time < 0) {
				clearInterval(timer3);
				image.addClass("brightness opacity");

				bedded3.innerHTML = 
						"<div class='container'>"
							+ "<div class='inline-block'>"
								+ "<div>"
									+ "<span style='color:#808080;font-size:large;'>00:00</span>"
								+ "</div>"
							+ "</div>"
						+ "</div>";
				
			}	// if (time < 0) 종료
		}, 1000);	// setInterval 끝
		// 타이머 구역 끝
		
		// 침대(환자배치 메뉴) '완료' 버튼 클릭 이벤트
		$("#bed3Done").on("click",function() {
			// 타이머 중단 및 이미지 변경
			clearInterval(timer3);
			image.addClass("brightness opacity");
			bedded3.innerHTML = 
				"<div class='container'>"
					+ "<div class='inline-block'>"
						+ "<div>"
							+ "<span style='color:#808080;font-size:large;'>00:00</span>"
						+ "</div>"
					+ "</div>"
				+ "</div>";
				
			// 침대제목 비우기
			$('#bed3name').html("");
			
			// '치료 기록' 칸에 값 넣기
			// 환자 신상 입력
			let report =
					memName + " (" + memGender + ", " + memAge + "세)";
			$('#reportInfo').html(report);
			// 치료 종류 입력
			let typeInfo = $('#typeInfo');
			typeInfo.html(therapyType);
			console.log('typeInfo: ' + therapyType);
			
			// 치료 기록 작성 후 '저장' 버튼 클릭 이벤트
			$("#finish").on("click",function() {
// 				let therapist = ${sessionScope.user.member.memNo}
// 				console.log("therapist: " + therapist);
				// 보낼 값 정리
				dataPtNo3;	// "3" 들어있음
				dataEmpNo3 = theraEmpNo;	// 물리치료사 empNo
				dataOrderNo3;	// orderNo 들어있음;
// 				let ptEqNo = selectedTherapy;	// onchange 함수로 구한 값
				let ptRecordContent = $('#ptRecordContent');	// textarea id로 가져옴
				
				// 치료기록 등록을 위한 data
				let data = {
						ptEqNo: selectedTherapy3,
						ptRecordContent: ptRecordContent.val(),
						ptNo: dataPtNo3,
						empNo: dataEmpNo3,
						orderNo: dataOrderNo3
				};
				
				// 치료기록 등록을 위해 data 전송
				$.ajax({
					url : "/emp/physical/report",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 치료기록 res: " + res);
						if (res === 'success'){
							console.log("(침대3) 치료기록 입력 성공!");
							$('#reportInfo').html("");
							$('#typeInfo').html("");
							$('#ptRecordContent').val("");
							Swal.fire({
								title: "입력 완료!",
								text: "치료기록을 입력했습니다.",
								icon: "success"
							});
							location.reload();
						}else{
							console.log("치료기록 입력 실패!!!!!");
							Swal.fire({
								title: "입력 실패!",
								text: "치료기록을 입력하지 못했습니다.",
								icon: "error"
							});
						}
					}	// success 끝
				});	// 치료기록 등록 ajax 끝
				
				// 환자 위치&상태 변경
				$.ajax({
					url : "/emp/physical/statusDone",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify({
						receiptNo: receiptNo3
					}),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 상태 변경 res: " + res);
						if (res === 'success'){
							console.log("환자상태 변경 성공!");
						}else{
							console.log("환자상태 실패!!!!!");
						}
					}	// success 끝
				});	// 상태변경 ajax 끝
				
			});	// 치료기록 '저장' 버튼 클릭 이벤트 끝
						
		});	// 완료버튼 클릭이벤트 종료
		
		// 환자 정보 세팅 (침상배정 표 상단 tr)
		let bedName3 = $('#bed3name');
		let htmlName3 = '';
		htmlName3 += memName;
		htmlName3 += " (" + memGender + ", " + memAge + "세)";
		bedName3.html(htmlName3);
		
	} else {	// 이미지 CSS로 상태파악 끝
		// 한번 더 눌렀을 때
		console.log("class 없음");
		clearInterval(timer3);
		image.addClass("brightness opacity");
	}
});
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//클릭 타이머 코드
var timer4;
// 침대별 값 세팅
var dataPtNo4 = "4";
var dataEmpNo4;
var dataOrderNo4;
var receiptNo4;
var memNo4;
var selectedTherapy4;
var therapyType4;
// 침대4 타이머
$("#bed4").on("click",function() {
	console.log("click 이벤트 인식 ");
	var image = $("#bed4");
	var isBrightness = image.hasClass("brightness");
	var isOpacity = image.hasClass("opacity");
	const bedded4 = document.getElementById('bed4_1');

// 	var time = 10;
// 	var min = "";
// 	var sec = "";

	// 값 임시로 담아놓기
	dataEmpNo4 = empNo;
	dataOrderNo4 = orderNo;
	memNo4 = memNo;
	receiptNo4 = receiptNo;
	console.log("receipNo4: " + receiptNo4);
	selectedTherapy4 = selectedTherapy;
	therapyType4 = therapyType;
	
	// 이미지 CSS로 상태 파악
	if (isBrightness && isOpacity) {
		console.log("class 존재 인식 ");
		clearInterval(timer4); // 이미 진행 중인 카운트다운을 멈춤
		image.removeClass("brightness opacity");

		console.log("memNo4: " + memNo4);
		console.log("dataEmpNo4: " + dataEmpNo4);
		var data = {
				"memNo": memNo4,
				"empNo": dataEmpNo4,
				"receiptNo": receiptNo4
			};
		
		// 값 가져가서 pt_status update 를 ajax로
		$.ajax({
			url : "/emp/physical/statusStart",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            // CSRF 토큰 헤더에 추가
	           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function (res) {
				console.log("환자 상태 변경 res: " + res);
				if (res === 'success'){
					console.log("환자 상태변경 성공!");
				}else{
					console.log("환자 상태변경 실패!!!!");
				}
			}	// success 끝
		});	// ajax 끝
		
		// 타이머 구역
		var time = 900;	// 카운트다운 시간 설정
		timer4 = setInterval(function() {
			var min = parseInt(time / 60);
			var sec = time % 60;

			bedded4.innerHTML =
				"<div class='container'>" +
					"<div class='inline-block'>" +
						"<div>" +
							"<span style='font-size:large;'>" + min
								+ ":" + sec + "</span>" +
						"</div>" +
					"</div>" +
				"</div>";
			time--;

			if (time < 0) {
				clearInterval(timer4);
				image.addClass("brightness opacity");

				bedded4.innerHTML = 
						"<div class='container'>"
							+ "<div class='inline-block'>"
								+ "<div>"
									+ "<span style='color:#808080;font-size:large;'>00:00</span>"
								+ "</div>"
							+ "</div>"
						+ "</div>";
				
			}	// if (time < 0) 종료
		}, 1000);	// setInterval 끝
		// 타이머 구역 끝
		
		// 침대(환자배치 메뉴) '완료' 버튼 클릭 이벤트
		$("#bed4Done").on("click",function() {
			// 타이머 중단 및 이미지 변경
			clearInterval(timer4);
			image.addClass("brightness opacity");
			bedded4.innerHTML = 
				"<div class='container'>"
					+ "<div class='inline-block'>"
						+ "<div>"
							+ "<span style='color:#808080;font-size:large;'>00:00</span>"
						+ "</div>"
					+ "</div>"
				+ "</div>";
			// 침대제목 비우기
			$('#bed4name').html("");
			
			// '치료 기록' 칸에 값 넣기
			// 환자 신상 입력
			let report =
					memName + " (" + memGender + ", " + memAge + "세)";
			$('#reportInfo').html(report);
			// 치료 종류 입력
			let typeInfo = $('#typeInfo');
			typeInfo.html(therapyType);
			console.log('typeInfo: ' + therapyType);
			
			// 치료 기록 작성 후 '저장' 버튼 클릭 이벤트
			$("#finish").on("click",function() {
				// 보낼 값 정리
				dataPtNo4;	// "4" 들어있음
				dataEmpNo4 = theraEmpNo;	// 물리치료사 empNo
				dataOrderNo4;	// orderNo 들어있음;
// 				let ptEqNo = selectedTherapy;	// onchange 함수로 구한 값
				let ptRecordContent = $('#ptRecordContent');	// textarea id로 가져옴
				
				// 치료기록 등록을 위한 data
				let data = {
						ptEqNo: selectedTherapy4,
						ptRecordContent: ptRecordContent.val(),
						ptNo: dataPtNo4,
						empNo: dataEmpNo4,
						orderNo: dataOrderNo4
				};
				
				// 치료기록 등록을 위해 data 전송
				$.ajax({
					url : "/emp/physical/report",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 치료기록 res: " + res);
						if (res === 'success'){
							console.log("(침대4)치료기록 입력 성공!");
							$('#reportInfo').html("");
							$('#typeInfo').html("");
							$('#ptRecordContent').val("");
							Swal.fire({
								title: "입력 완료!",
								text: "치료기록을 입력했습니다.",
								icon: "success"
							});
							location.reload();
						}else{
							console.log("치료기록 입력 실패!!!!!");
							Swal.fire({
								title: "입력 실패!",
								text: "치료기록을 입력하지 못했습니다.",
								icon: "error"
							});
						}
					}	// success 끝
				});	// 치료기록 등록 ajax 끝
				
				// 환자 위치&상태 변경
				$.ajax({
					url : "/emp/physical/statusDone",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify({
						receiptNo: receiptNo4
					}),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 상태 변경 res: " + res);
						if (res === 'success'){
							console.log("환자상태 변경 성공!");
						}else{
							console.log("환자 상태 변경 실패!!!!!");
						}
					}	// success 끝
				});	// 상태변경 ajax 끝
				
			});	// 치료기록 '저장' 버튼 클릭 이벤트 끝
						
		});	// 완료버튼 클릭이벤트 종료
		
		// 환자 정보 세팅 (침상배정 표 상단 tr)
		let bedName4 = $('#bed4name');
		let htmlName4 = '';
		htmlName4 += memName;
		htmlName4 += " (" + memGender + ", " + memAge + "세)";
		bedName4.html(htmlName4);
		
	} else {	// 이미지 CSS로 상태파악 끝
		// 한번 더 눌렀을 때
		console.log("class 없음");
		clearInterval(timer4);
		image.addClass("brightness opacity");
	}
});
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//클릭 타이머 코드
var timer5;
// 침대별 값 세팅
var dataPtNo5 = "5";
var dataEmpNo5;
var dataOrderNo5;
var receiptNo5;
var memNo5;
var selectedTherapy5;
var therapyType5;
// 침대5 타이머
$("#bed5").on("click",function() {
	console.log("click 이벤트 인식 ");
	var image = $("#bed5");
	var isBrightness = image.hasClass("brightness");
	var isOpacity = image.hasClass("opacity");
	const bedded5 = document.getElementById('bed5_1');

// 	var time = 10;
// 	var min = "";
// 	var sec = "";

	// 값 임시로 담아놓기
	dataEmpNo5 = empNo;
	dataOrderNo5 = orderNo;
	memNo5 = memNo;
	receiptNo5 = receiptNo;
	console.log("receipNo5: " + receiptNo5);
	selectedTherapy5 = selectedTherapy;
	therapyType5 = therapyType;
	
	// 이미지 CSS로 상태 파악
	if (isBrightness && isOpacity) {
		console.log("class 존재 인식 ");
		clearInterval(timer5); // 이미 진행 중인 카운트다운을 멈춤
		image.removeClass("brightness opacity");

		console.log("memNo5: " + memNo5);
		console.log("dataEmpNo5: " + dataEmpNo5);
		var data = {
				"memNo": memNo5,
				"empNo": dataEmpNo5,
				"receiptNo": receiptNo5
			};
		
		// 값 가져가서 pt_status update 를 ajax로
		$.ajax({
			url : "/emp/physical/statusStart",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            // CSRF 토큰 헤더에 추가
	           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function (res) {
				console.log("환자 상태 변경 res: " + res);
				if (res === 'success'){
					console.log("환자 상태변경 성공!");
				}else{
					console.log("환자 상태변경 실패!!!!");
				}
			}	// success 끝
		});	// ajax 끝
		
		// 타이머 구역
		var time = 900;	// 카운트다운 시간 설정
		timer5 = setInterval(function() {
			var min = parseInt(time / 60);
			var sec = time % 60;

			bedded5.innerHTML =
				"<div class='container'>" +
					"<div class='inline-block'>" +
						"<div>" +
							"<span style='font-size:large;'>" + min
								+ ":" + sec + "</span>" +
						"</div>" +
					"</div>" +
				"</div>";
			time--;

			if (time < 0) {
				clearInterval(timer5);
				image.addClass("brightness opacity");

				bedded5.innerHTML = 
						"<div class='container'>"
							+ "<div class='inline-block'>"
								+ "<div>"
									+ "<span style='color:#808080;font-size:large;'>00:00</span>"
								+ "</div>"
							+ "</div>"
						+ "</div>";
				
			}	// if (time < 0) 종료
		}, 1000);	// setInterval 끝
		// 타이머 구역 끝
		
		// 침대(환자배치 메뉴) '완료' 버튼 클릭 이벤트
		$("#bed5Done").on("click",function() {
			// 타이머 중단 및 이미지 변경
			clearInterval(timer5);
			image.addClass("brightness opacity");
			bedded5.innerHTML = 
				"<div class='container'>"
					+ "<div class='inline-block'>"
						+ "<div>"
							+ "<span style='color:#808080;font-size:large;'>00:00</span>"
						+ "</div>"
					+ "</div>"
				+ "</div>";
				
			// 침대제목 비우기
			$('#bed5name').html("");
			
			// '치료 기록' 칸에 값 넣기
			// 환자 신상 입력
			let report =
					memName + " (" + memGender + ", " + memAge + "세)";
			$('#reportInfo').html(report);
			// 치료 종류 입력
			let typeInfo = $('#typeInfo');
			typeInfo.html(therapyType);
			console.log('typeInfo: ' + therapyType);
			
			// 치료 기록 작성 후 '저장' 버튼 클릭 이벤트
			$("#finish").on("click",function() {
				// 보낼 값 정리
				dataPtNo5;	// "5" 들어있음
				dataEmpNo5 = theraEmpNo;	// 물리치료사 empNo
				dataOrderNo5;	// orderNo 들어있음;
// 				let ptEqNo = selectedTherapy;	// onchange 함수로 구한 값
				let ptRecordContent = $('#ptRecordContent');	// textarea id로 가져옴
				
				// 치료기록 등록을 위한 data
				let data = {
						ptEqNo: selectedTherapy5,
						ptRecordContent: ptRecordContent.val(),
						ptNo: dataPtNo5,
						empNo: dataEmpNo5,
						orderNo: dataOrderNo5
				};
				
				// 치료기록 등록을 위해 data 전송
				$.ajax({
					url : "/emp/physical/report",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 치료기록 res: " + res);
						if (res === 'success'){
							console.log("(침대5)치료기록 입력 성공!");
							$('#reportInfo').html("");
							$('#typeInfo').html("");
							$('#ptRecordContent').val("");
							Swal.fire({
								title: "입력 완료!",
								text: "치료기록을 입력했습니다.",
								icon: "success"
							});
							location.reload();
						}else{
							console.log("치료기록 입력 실패!!!!!");
							Swal.fire({
								title: "입력 실패!",
								text: "치료기록을 입력하지 못했습니다.",
								icon: "error"
							});
						}
					}	// success 끝
				});	// 치료기록 등록 ajax 끝
				
				// 환자 위치&상태 변경
				$.ajax({
					url : "/emp/physical/statusDone",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify({
						receiptNo: receiptNo5
					}),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 상태 변경 res: " + res);
						if (res === 'success'){
							console.log("환자상태 변경 성공!");
						}else{
							console.log("환자상태 변경 실패!!!!!");
						}
					}	// success 끝
				});	// 상태변경 ajax 끝
				
			});	// 치료기록 '저장' 버튼 클릭 이벤트 끝
						
		});	// 완료버튼 클릭이벤트 종료
		
		// 환자 정보 세팅 (침상배정 표 상단 tr)
		let bedName5 = $('#bed5name');
		let htmlName5 = '';
		htmlName5 += memName;
		htmlName5 += " (" + memGender + ", " + memAge + "세)";
		bedName5.html(htmlName5);
		
	} else {	// 이미지 CSS로 상태파악 끝
		// 한번 더 눌렀을 때
		console.log("class 없음");
		clearInterval(timer5);
		image.addClass("brightness opacity");
	}
});
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
//클릭 타이머 코드
var timer6;
// 침대별 값 세팅
var dataPtNo6 = "6";
var dataEmpNo6;
var dataOrderNo6;
var receiptNo6;
var memNo6;
var selectedTherapy6;
var therapyType6;
// 침대6 타이머
$("#bed6").on("click",function() {
	console.log("click 이벤트 인식 ");
	var image = $("#bed6");
	var isBrightness = image.hasClass("brightness");
	var isOpacity = image.hasClass("opacity");
	const bedded6 = document.getElementById('bed6_1');

// 	var time = 10;
// 	var min = "";
// 	var sec = "";

	// 값 임시로 담아놓기
	dataEmpNo6 = empNo;
	dataOrderNo6 = orderNo;
	memNo6 = memNo;
	receiptNo6 = receiptNo;
	console.log("receipNo6: " + receiptNo6);
	selectedTherapy6 = selectedTherapy;
	therapyType6 = therapyType;
	
	// 이미지 CSS로 상태 파악
	if (isBrightness && isOpacity) {
		console.log("class 존재 인식 ");
		clearInterval(timer6); // 이미 진행 중인 카운트다운을 멈춤
		image.removeClass("brightness opacity");

		console.log("memNo6: " + memNo6);
		console.log("dataEmpNo6: " + dataEmpNo6);
		var data = {
				"memNo": memNo6,
				"empNo": dataEmpNo6,
				"receiptNo": receiptNo6
			};
		
		// 값 가져가서 pt_status update 를 ajax로
		$.ajax({
			url : "/emp/physical/statusStart",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            // CSRF 토큰 헤더에 추가
	           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
			},
			success : function (res) {
				console.log("환자 상태 변경 res: " + res);
				if (res === 'success'){
					console.log("환자 상태변경 성공!");
				}else{
					console.log("환자 상태변경 실패!!!!");
				}
			}	// success 끝
		});	// ajax 끝
		
		// 타이머 구역
		var time = 900;	// 카운트다운 시간 설정
		timer6 = setInterval(function() {
			var min = parseInt(time / 60);
			var sec = time % 60;

			bedded6.innerHTML =
				"<div class='container'>" +
					"<div class='inline-block'>" +
						"<div>" +
							"<span style='font-size:large;'>" + min
								+ ":" + sec + "</span>" +
						"</div>" +
					"</div>" +
				"</div>";
			time--;

			if (time < 0) {
				clearInterval(timer6);
				image.addClass("brightness opacity");

				bedded6.innerHTML = 
						"<div class='container'>"
							+ "<div class='inline-block'>"
								+ "<div>"
									+ "<span style='color:#808080;font-size:large;'>00:00</span>"
								+ "</div>"
							+ "</div>"
						+ "</div>";
				
			}	// if (time < 0) 종료
		}, 1000);	// setInterval 끝
		// 타이머 구역 끝
		
		// 침대(환자배치 메뉴) '완료' 버튼 클릭 이벤트
		$("#bed6Done").on("click",function() {
			// 타이머 중단 및 이미지 변경
			clearInterval(timer6);
			image.addClass("brightness opacity");
			bedded6.innerHTML = 
				"<div class='container'>"
					+ "<div class='inline-block'>"
						+ "<div>"
							+ "<span style='color:#808080;font-size:large;'>00:00</span>"
						+ "</div>"
					+ "</div>"
				+ "</div>";
				
			// 침대제목 비우기
			$('#bed6name').html("");
			
			// '치료 기록' 칸에 값 넣기
			// 환자 신상 입력
			let report =
					memName + " (" + memGender + ", " + memAge + "세)";
			$('#reportInfo').html(report);
			// 치료 종류 입력
			let typeInfo = $('#typeInfo');
			typeInfo.html(therapyType);
			console.log('typeInfo: ' + therapyType);
			
			// 치료 기록 작성 후 '저장' 버튼 클릭 이벤트
			$("#finish").on("click",function() {
				// 보낼 값 정리
				dataPtNo6;	// "6" 들어있음
				dataEmpNo6 = theraEmpNo;	// 물리치료사 empNo
				dataOrderNo6;	// orderNo 들어있음;
// 				let ptEqNo = selectedTherapy;	// onchange 함수로 구한 값
				let ptRecordContent = $('#ptRecordContent');	// textarea id로 가져옴
				
				// 치료기록 등록을 위한 data
				let data = {
						ptEqNo: selectedTherapy6,
						ptRecordContent: ptRecordContent.val(),
						ptNo: dataPtNo6,
						empNo: dataEmpNo6,
						orderNo: dataOrderNo6
				};
				
				// 치료기록 등록을 위해 data 전송
				$.ajax({
					url : "/emp/physical/report",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 치료기록 res: " + res);
						if (res === 'success'){
							console.log("(침대6)치료기록 입력 성공!");
							$('#reportInfo').html("");
							$('#typeInfo').html("");
							$('#ptRecordContent').val("");
// 							getWaitingList();
// 							location.reload(true);
							Swal.fire({
								title: "입력 완료!",
								text: "치료기록을 입력했습니다.",
								icon: "success"
							});
							location.reload();
						}else{
							console.log("치료기록 입력 실패!!!!!");
							Swal.fire({
								title: "입력 실패!",
								text: "치료기록을 입력하지 못했습니다.",
								icon: "error"
							});
						}
					}	// success 끝
				});	// 치료기록 등록 ajax 끝
				
				// 환자 위치&상태 변경
				$.ajax({
					url : "/emp/physical/statusDone",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify({
						receiptNo: receiptNo6
					}),
					beforeSend: function(xhr) {
			            // CSRF 토큰 헤더에 추가
			           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
					},
					success : function (res) {
						console.log("환자 상태 변경 res: " + res);
						if (res === 'success'){
							console.log("환자상태 변경 성공!");
						}else{
							console.log("환자상태 변경 실패!!!!!");
						}
					}	// success 끝
				});	// 상태변경 ajax 끝
				
			});	// 치료기록 '저장' 버튼 클릭 이벤트 끝
						
		});	// 완료버튼 클릭이벤트 종료
		
		// 환자 정보 세팅 (침상배정 표 상단 tr)
		let bedName6 = $('#bed6name');
		let htmlName6 = '';
		htmlName6 += memName;
		htmlName6 += " (" + memGender + ", " + memAge + "세)";
		bedName6.html(htmlName6);
		
	} else {	// 이미지 CSS로 상태파악 끝
		// 한번 더 눌렀을 때
		console.log("class 없음");
		clearInterval(timer6);
		image.addClass("brightness opacity");
	}
});
////////////////////////////////////////////////////////////////////////////////////////////////////

</script>
</html>