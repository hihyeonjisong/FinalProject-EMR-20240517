<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<div class="page">

		<!-- 본문 시작 -->
		<!-- Start::app-content -->
		<div class="main-content app-content">
			<div class="container-fluid">



				<!-- 본문의 본문 -->
				<!-- Start::row-1 -->
				<div class="row">


					<!-- 서브메뉴 -->
					<div class="col-xl-3">
						<div class="card custom-card">
							<div class="card-body p-0">

								<div class="p-3 task-navigation border-bottom border-block-end-dashed">
									<ul class="list-unstyled task-main-nav mb-0">
										<li class="px-0 pt-0"><span
											class="fs-11 text-muted op-7 fw-semibold">TASKS</span></li>
										<li>
											<a href="/emp/surgery/reservList">
												<div class="d-flex align-items-center">
													<span class="me-2 lh-1">
														<i class="ri-task-line align-middle fs-14"></i>
													</span>
													<span class="flex-fill text-nowrap"> 수술 예정 환자 </span>
													<span class="badge bg-success-transparent rounded-pill">뱃지</span>
												</div>
											</a>
										</li>
										<li class="active">
											<a href="/emp/surgery/reservForm">
												<div class="d-flex align-items-center">
													<span class="me-2 lh-1">
														<i class="ri-star-line align-middle fs-14"></i>
													</span>
													<span class="flex-fill text-nowrap"> 수술 일정 등록 </span>
												</div>
											</a>
										</li>
										<li>
											<a href="/emp/surgery/surgeryRoom">
												<div class="d-flex align-items-center">
													<span class="me-2 lh-1">
														<i class="ri-delete-bin-5-line align-middle fs-14"></i>
													</span>
													<span class="flex-fill text-nowrap"> 수술실 예약 현황 </span>
												</div>
											</a>
										</li>
										<li>
											<a href="/emp/surgery/surgeryRecord">
												<div class="d-flex align-items-center">
													<span class="me-2 lh-1">
														<i class="ri-delete-bin-5-line align-middle fs-14"></i>
													</span>
													<span class="flex-fill text-nowrap"> 수술 기록 조회 </span>
												</div>
											</a>
										</li>
									</ul>
								</div>

							</div>
						</div>
					</div>
					<!-- 서브메뉴 끝 -->

					<div class="col-xl-9">
						<div class="row">
							<div class="col-xl-12">
								<!-- 카드 -->
								<div class="card custom-card">
									<div class="card-header">
										<div class="card-title">Surgery Reservation Form</div>
									</div>

									<div class="card-body">
										<form action="" method="post" id="surgeryResvForm">
											<ul class="list-group">
												<!-- 환자명 -->
												<li class="list-group-item">
													<div class="d-flex flex-wrap align-items-center">
														<label class="me-2 fw-semibold" for="input-name">
															Patient Name </label>
														<input type="text" 	class="fs-12 form-control" style="width: 200px;"
															id="patientName" placeholder="상단 검색창에 환자 검색" readonly/>
													</div>
												</li>
												<!-- 환자명 끝 -->
												<!-- 환자 성별 -->
												<li class="list-group-item">
													<div class="d-flex flex-wrap align-items-center">
														<label class="me-2 fw-semibold" for="input-gender">
															Gender </label>
														<input type="radio" class="fs-12 form-check-input"
															name="input-gender" id="patientGenderMale" value="male"
															onclick="return false;" readonly/>
														<label for="input-gender-male" style="padding-right: 20px;">남성</label>
														<input type="radio" class="fs-12 form-check-input"
															name="input-gender" id="patientGenderFemale"
															value="female" onclick="return false;" readonly/>
														<label for="input-gender-female" style="padding-right: 20px;">여성</label>
													</div>
												</li>
												<!-- 환자 성별 끝 -->
												<!-- 환자 나이 입력 -->
												<li class="list-group-item">
													<div class="d-flex flex-wrap align-items-center">
														<div class="me-2 fw-semibold">Age </div>
														<input type="number" class="fs-12 form-control"
															id="patientAge" style="width: 200px;" readonly/>
														<!-- 										<span class="fs-12 text-muted">+(555) 555-1234</span> -->
													</div>
												</li>
												<!-- 환자 나이 끝 -->
												<!-- 수술 종류 검색! -->
												<li class="list-group-item">
													<div class="d-flex flex-wrap align-items-center">
														<div class="me-2 fw-semibold">Surgery Type</div>
														<input type="text" id="surgerySearchKeyword" name="surgerySearchKeyword"
															class="fs-4 form-control">
													</div>
												</li>
												<!-- 수술 종류 검색 끝 -->
												<li class="list-group-item">
													<div class="d-flex flex-wrap align-items-center">
														<div class="me-2 fw-semibold">Requested Surgery Date
														</div>
														<span class="fs-12 text-muted"> <input type="date"
															class="fs-10 form-control" style="width: 200px;" />
														</span>
													</div>
												</li>
												<li class="list-group-item">
													<div class="d-flex flex-wrap align-items-center">
														<div class="me-2 fw-semibold">Surgery Time</div>
														<span class="fs-12 text-muted">
															<input type="time" class="fs-6 form-control" style="width: 200px;" />
														</span>
													</div>
												</li>
												<li class="list-group-item">
													<div class="d-flex flex-wrap align-items-center">
														<div class="me-2 fw-semibold">Operating Room</div>
														<span class="fs-12"> <input type="radio"
															class="fs-12 form-check-input" id="input-res-oproom1"
															name="input-res-oproom" value="room1" /> <label
															for="input-res-oproom1" style="padding-right: 20px;">Operating
																Room 1</label> <input type="radio"
															class="fs-12 form-check-input" name="input-res-oproom"
															id="input-res-oproom2" value="room2" /> <label
															for="input-sex-female">Operating Room 2</label>
														</span>
													</div>
												</li>
												<li class="list-group-item">
													<div class="d-flex flex-wrap align-items-center">
														<div class="me-2 fw-semibold">Surgeon</div>
<!-- 														<span class="fs-12 text-muted"> 검색? </span> -->
														<input type="text" class="fs-12 form-control">
														<button type="button" class="btn btn-info">검색</button>
													</div>
												</li>
											</ul>
											<div style="margin-top: 10px;">
												<button form="surgeryResvForm" class="btn btn-info">Submit</button>
											</div>
											<sec:csrfInput />
										</form>
									</div>

								</div>
								<!-- 카드 끝 -->




							</div>
							<!--End::row-1 -->
							<!-- 본문의 본문 끝 -->

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End::app-content -->
		<!--본문 끝-->

	</div>

	<!-- Scroll To Top -->
	<div class="scrollToTop">
		<span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
	</div>
	<div id="responsive-overlay"></div>
	<!-- Scroll To Top -->




<!-- 모달 공간: 집도의 검색 -->
<!-- 모달 공간: 집도의 검색 -->
<!-- 모달 공간: 집도의 검색 -->

<!-- 모달 공간: 집도의 검색 끝 -->
<!-- 모달 공간: 집도의 검색 끝 -->
<!-- 모달 공간: 집도의 검색 끝 -->

</body>
<script>
// header의 검색버튼을 통해 환자를 선택했을 때, 상세정보에서
// '선택' 버튼을 눌렀을 때의 클릭이벤트: selectPatientBtn
$(document).on("click","#selectPatientBtn",function(){
	// 환자 이름 입력
	$('#patientName').val(patntInfo.memName);
	// 환자 성별 입력
	var gender = (patntInfo.memGender);
	console.log("가져온 성별값 gender: " + gender)
	if(gender === '남성'){
		// radio 버튼에서 '남성' 선택
		$('#patientGenderMale').prop('checked', true);
	}else if(gender === '여성'){
		// radio 버튼에서 '여성' 선택
		$('#patientGenderFemale').prop('checked', true);
	}else{
		alert("성별 정보가 없거나 잘못되었습니다. 관리자에게 문의해 주세요.");
	}
	// 환자 나이 입력
	$('#patientAge').val(patntInfo.memAge)
});

// 자동완성
// 자동완성
// 자동완성
$(function(){
// 	var searchWord = $("#surgerySearchKeyword");
	var arr = [];
	
	$.ajax({
		type: "get",
		url: "/emp/surgery/getKinds.do",
// 		data: JSON.stringify(searchWord),
// 		contentType: "application/json;charset=utf-8;",
		dataType : 'json',
		success: function(data) {
			// list 출력: for문으로
			for(var i=0 ; i<data.length; i++)  arr[i]= data[i].surgeryKindName;
         	console.log("arrrrrrr : "+arr);
		}	// success 끝
// 		error: function(){
// 			alert("검색 실패! 다시 시도해주세요.");
// 		}	// error 끝
	});	// ajax 닫음
	
	// 자동완성 코드 (수정해야 함)
    $('#surgerySearchKeyword').autocomplete({ // autocomplete 구현 시작부
        source : arr, //source 는 자동완성의 대상
        select : function(event, ui) { // item 선택 시 이벤트
          	console.table("ui: " + ui);
        },
        focus : function(event, ui) { // 포커스 시 이벤트
            return false;
        },
        minLength : 1, // 최소 글자 수
        autoFocus : true, // true로 설정 시 메뉴가 표시 될 때, 첫 번째 항목에 자동으로 초점이 맞춰짐
        classes : { // 위젯 요소에 추가 할 클래스를 지정
            'ui-autocomplete' : 'highlight'
        },
        delay : 500, // 입력창에 글자가 써지고 나서 autocomplete 이벤트 발생될 떄 까지 지연 시간(ms)
        disable : false, // 해당 값 true 시, 자동완성 기능 꺼짐
        position : { my : 'right top', at : 'right bottom'}, // 제안 메뉴의 위치를 식별
        close : function(event) { // 자동완성 창 닫아질 때의 이벤트
            console.log("event: " + event);
        }
	});
});	// function 끝
//자동완성 끝
//자동완성 끝
//자동완성 끝
</script>
</html>