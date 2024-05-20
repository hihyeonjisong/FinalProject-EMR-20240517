<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/customValid.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/show-password.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/date&time_pickers.js"></script>
	<!-- FullCalendar CSS -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css"> -->

<!-- FullCalendar Moment.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<!-- FullCalenar Javascript -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>


<!-- FullCalendar Locale -->
<!-- <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script> -->
<%-- <script src="${pageContext.request.contextPath }/resources/fullcalendar/index.global.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/fullcalendar/index.global.js"></script> --%>


<style>
/* 추가적인 CSS 스타일링을 원하면 여기에 작성하세요 */
.h4 {
	cursor: pointer; /* 마우스 커서를 포인터로 변경하여 사용자에게 클릭 가능한 요소임을 나타냄 */
	position: relative; /* 밑줄을 절대적으로 위치시킬 수 있도록 설정 */
	display: inline-block; /* 요소의 너비가 텍스트에 맞게 설정되도록 인라인 블록 요소로 설정 */
}

.h4::after {
	content: ""; /* 가상 요소 생성 */
	position: absolute; /* 밑줄을 절대적으로 위치시킴 */
	left: 0; /* 텍스트의 왼쪽부터 밑줄을 시작함 */
	bottom: -5px; /* 밑줄의 위치를 조절함 (원하는 여백의 크기에 따라 조절) */
	width: 100%; /* 밑줄의 너비를 텍스트의 너비와 같게 설정 */
	height: 2px; /* 밑줄의 두께 설정 */
	background-color: transparent; /* 밑줄의 색상 설정 */
	transition: background-color 0.3s ease; /* 전환 효과 추가 */
}

.h4:hover::after {
	background-color: black; /* hover 상태일 때 밑줄의 색상 변경 */
}

.h4.clicked::after {
	background-color: black; /* 클릭 상태일 때 밑줄의 색상 변경 */
}

.h4.clicked {
	font-weight: bold; /* 클릭 상태일 때 글꼴 굵게 설정 */
}

.h4:hover {
	font-weight: bold; /* 마우스를 올렸을 때 글꼴 굵게 설정 */
}
.worktime {
	position : absolute;
	margin-top : 20px;
}

.color-picker {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
}
.color-option {
  width: 20px;
  height: 20px;
  margin: 5px;
  cursor: pointer;
  border: 1px solid #999;
  border-radius: 30%;
}

.tab-content .tab-pane {
    padding: 0rem; !important;
}




</style>
<!-- Start::app-content -->
<div class="main-content app-content">
	<div class="container-fluid">
		<!-- Page Header Close -->
		<!-- Start::row-1 -->
		<div class="row g-2">
			<div class="col-xxl-4 col-xl-12">
				<div class="card custom-card overflow-hidden">
					<div class="card-body p-0">
						<div
							class="d-sm-flex align-items-top p-4 border-bottom-0 main-profile-cover">
							<div>
								<span class="avatar avatar-xxl avatar-rounded online me-3">
									<c:set
					       					value="${member.fileVO.attachPath}${member.fileVO.attachName }"
										var="target" /> <img
									src="/file/displayFile?fileName=${target}" alt="">
								</span>
							</div>
							<div class="flex-fill main-profile-info">
								<div class="d-flex align-items-center justify-content-between">
									<h4 class="fw-semibold mb-1 text-fixed-white">${member.memName }</h4>
									<div id="workbadge">
									<c:choose>
										<c:when test="${empty workVO }">
											<span class="badge rounded-pill bg-light" 
											style="font-size: 12px; margin-left: 15px;"><span style="color: black;">퇴근</span>
											</span>
										
										</c:when>
										<c:otherwise>
											<span class="badge rounded-pill bg-success" id="working"
												style="font-size: 12px; margin-left: 15px;">근무중</span>
										</c:otherwise>
									</c:choose>
									</div>
								</div>
								<p class="mb-1 text-muted text-fixed-white op-7">${member.empVO.empJob }</p>
								<p class="fs-12 text-fixed-white mb-4 op-5">
									<span class="me-3"><i
										class="ri-building-line me-1 align-middle"></i>${member.memPostcode }</span>
									<span><i class="ri-map-pin-line me-1 align-middle"></i>${member.memAddress1 }</span>
								</p>
								<c:if test="${empty workVO }">
								<button type="button" id="startWork"
									class="btn btn-light rounded-pill btn-wave"
									style="width: 85px;">
										<i class='bx bx-log-in' style="margin-right: 10px;"></i><span id="startWorkTime">출근</span>
								</button>
								</c:if> 
								<c:if test="${not empty workVO }">
								<button type="button" id="startWork"
									class="btn btn-light rounded-pill btn-wave"
									style="width: 85px;" disabled="disabled">
										<span id="startWorkTime">${workVO.workStartTime }</span>
								</button>
								</c:if> 
								<button type="button" id="endWork"
									class="btn btn-light rounded-pill btn-wave"
									style="margin-left: 20px; width: 85px;">
									<i class='bx bx-log-out' style="margin-right: 10px;"> </i><span id="endWorkTime">퇴근</span>
								</button>
							</div>
<!-- 							<span class="worktime starttime">09:11</span><span class="worktime endtime">19:00</span> -->
						</div>
						<div class="p-4 border-bottom border-block-end-dashed">
							<div class="table-responsive">
								<table class="table text-nowrap table-striped">
									<thead style="text-align:center;">
										<tr>
											<th scope="col">총 연가일</th>
											<th scope="col">사용 연가일</th>
											<th scope="col">잔여 연가일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><span style="float: right;">15일</span></th>
											<td><span style="float: right;">${15-member.empVO.empVacation }일</span></td>
											<td><span style="float: right;">${member.empVO.empVacation}일</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="p-4 border-bottom border-block-end-dashed" id="sideMenu">
							<p>
								<span class="h4 mb-4 text-black tab-link" data-target="home1"> 내프로필 </span>
							</p>
							<p>
								<span class="h4 mb-4 text-black tab-link" data-target="home2">연가신청</span>
							</p>
							<p>
								<span class="h4 mb-4 text-black tab-link" data-target="home3">캘린더</span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xxl-8 col-xl-12">
				<div class="col-xl-12">
					<div class="card custom-card" id="sideMeneContent">
						<div class="card-body">
							<div class="tab-content">
								<div class="tab-pane show active text-muted" id="home1" role="tabpanel">
									<ul class="list-group">
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">아이디 :</div>
												<span class="fs-12 text-muted">${member.memId }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">이메일 :</div>
												<span class="fs-12 text-muted">${member.memEmail }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">이름 :</div>
												<span class="fs-12 text-muted">${member.memName }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">나이 :</div>
												<span class="fs-12 text-muted">${member.memAge }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">성별 :</div>
												<span class="fs-12 text-muted">${member.memGender }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">휴대폰 번호 :</div>
												<span class="fs-12 text-muted">${member.memTel }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">주민번호 :</div>
												<span class="fs-12 text-muted">${member.memRegno1 }-${member.memRegno2}</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">주소 :</div>
												<span class="fs-12 text-muted">${member.memAddress1 },
													${member.memAddress2 }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">사번 :</div>
												<span class="fs-12 text-muted">${member.empVO.empNo }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">직무 :</div>
												<span class="fs-12 text-muted">${member.empVO.empJob }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">면허번호 :</div>
												<span class="fs-12 text-muted">${member.empVO.empLicence }</span>
											</div>
										</li>
										<li class="list-group-item">
											<div class="d-flex flex-wrap align-items-center">
												<div class="me-2 fw-semibold">입사일 :</div>
												<span class="fs-12 text-muted">${member.empVO.empHireDate }</span>
											</div>
											<input type="button" class="btn btn-primary" style="float:right;" value="프로필 변경" data-bs-toggle="modal" data-bs-target="#passChkModal">
											<input type="button" class="btn btn-primary" style="float:right; margin-right:10px;" value="비밀번호 변경" data-bs-toggle="modal" data-bs-target="#passwordModify">
										</li>
									</ul>
								</div>
								<div class="tab-pane text-muted" id="about1" role="tabpanel">
									<form action="/public/mypage/profilemodify.do" enctype="multipart/form-data" id="modifyform" method="post">
										<input type="hidden" value="${sessionScope.user.member.memNo }" name="memNo">
										<input type="hidden" id="imgVal" name="imgData">
										<div class="row gy-4">
											<div class="col-xl-12">
												<span class="avatar avatar-xxl avatar-rounded me-3"
													style="margin-left: 40%; height: 10rem; width: 10rem;">
													<img id="imgBox" src="/file/displayFile?fileName=${target}"
													alt="">
												</span><br>
											</div>
											<div class="col-12">
												<label for="input-label" class="form-label">프로필사진</label> <input
													type="file" class="form-control" style="width: 50%;"
													id="file" name="file">
											</div>
											
											<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
												<label for="input-label" class="form-label">아이디</label>
												<div class="input-group">
													<input type="text" class="form-control" id="memId" name="memId" value="${member.memId }"> 
													<input type="button" class="btn btn-light" id="checkId" value="중복체크">
													<div class="invalid-feedback" id="invalid-id">
													*영어와 숫자를 사용한 4~16자리의 아이디를 입력해주세요!
													</div>
												</div>
											</div>
											
											<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 ">
												<label for="input-label" class="form-label">이름</label> <input
													type="text" class="form-control" id="memName"
													name="memName" value="${member.memName }">
												<div class="invalid-feedback" id="invalid-name">*한글로
													이루어진 이름을 입력해주세요!
												</div>
											</div>
											
											<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
												<label for="form-control" class="form-label">전화번호</label> 
												<input type="text" class="form-control" id="memTel" name="memTel" value="${member.memTel}">
												<div class="invalid-feedback" id="invalid-tel">*010-1234-5678
													형식으로 입력해주세요</div>
											</div>
											<div class="col-xl-8 col-lg-6 col-md-6 col-sm-12">
												<label for="input-email" class="form-label">이메일</label>
												<div class="input-group">
													<input type="email" class="form-control" id="memEmail"
														name="memEmail" value="${member.memEmail }"> <input
														type="button" class="btn btn-light" id="checkEmail"
														value="인증번호 전송">
												</div>
												<div class="invalid-feedback" id="invalid-email">*이메일
													형식이 올바르지 않습니다!</div>
											</div>

											<div class="col-xl-4" style="display: none;" id="emailAuth">
												<label for="signup-email" class="form-label text-default">인증번호
													입력</label>
												<div class="input-group">
													<input type="text" class="form-control form-control-lg"
														id="authNo" placeholder="인증번호"> <input
														type="button" class="btn btn-light" id="emailAuthBtn"
														value="입력">
													<div class="invalid-feedback" id="invalid-emailAuth">*인증번호가
														일치하지 않습니다!</div>
												</div>
											</div>
											<div class="input-group">
												<input type="text" class="form-control form-control-lg"
													id="memPostcode" name="memPostcode" placeholder="우편번호"
													value="${member.memPostcode }">
												<button type="button" class="btn btn-secondary btn-flat"
													onclick="DaumPostCode()">우편번호 찾기</button>
												<div class="invalid-feedback" id="invalid-postcode">*주소를
													선택해주세요!</div>
											</div>
											<div class="col-xl-12">
												<label for="signup-add" class="form-label text-default">주소
													선택</label> <input type="text" class="form-control form-control-lg"
													id="memAddress1" name="memAddress1"
													value="${member.memAddress1 }">
												<div class="invalid-feedback" id="invalid-address1">*주소를
													선택해주세요!</div>
											</div>
											<div class="col-xl-12">
												<label for="signup-add2" class="form-label text-default">상세
													주소</label> <input type="text" class="form-control form-control-lg"
													id="memAddress2" name="memAddress2"
													value="${member.memAddress2 }">
												<div class="invalid-feedback" id="invalid-address2">*상세주소를
													입력해주세요!</div>
											</div>
										</div>
										<div class="col-xl-2 d-grid mt-2" style="float: right;">
											<input type="button" class="btn btn-lg btn-primary"
												data-bs-toggle="modal" data-bs-target="#exampleModal"
												value="수정하기">
										</div>
										<sec:csrfInput/>
									</form>
								</div>
								<!-- 연가신청 폼 -->
								<div class="tab-pane text-muted" id="home2" role="tabpanel">
<!-- <div class="container"> -->
    <div class="card custom-card">
        <div class="card-header">
            <div class="card-title">
                연가 신청 기록
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table text-nowrap table-bordered" style="text-align:center;">
                    <thead>
                        <tr>
                            <th scope="col">시작일</th>
                            <th scope="col">종료일</th>
                            <th scope="col">사용일수</th>
                            <th scope="col">기안작성일</th>
                            <th scope="col">진행 상태</th>
                        </tr>
                    </thead>
                    <tbody id="vacationBody">
                    	<c:if test="${empty vacationReqList }">
                    	<tr>
							<td colspan="5">연가 신청 기록이 존재하지 않습니다.</td>
						</tr>
                    	</c:if>
                    	<c:if test="${not empty vacationReqList }">
                    		<c:forEach items="${vacationReqList }" var="vacationReq">
                        <tr>
                            <td>${vacationReq.vacationStartDate }</td>
                            <td>${vacationReq.vacationEndDate }</td>
                            <td>${vacationReq.vacationDate}일</td>
                            <td>${vacationReq.vacationRequestDate}</td>
                            <c:if test="${vacationReq.vacationRequestStatus eq 'Y' }">
	                            <td><span class="badge rounded-pill bg-light-transparent text-dark">완료</span></td>
                            </c:if>
                            <c:if test="${vacationReq.vacationRequestStatus eq 'N' }">
	                            <td><a href="#" class="disagreeReason" data-disagree="${vacationReq.vacationResultDisagree }"><span class="badge rounded-pill bg-danger-transparent">반려</span></a></td>
                            </c:if>
                            <c:if test="${empty vacationReq.vacationRequestStatus}">
	                            <td><span class="badge rounded-pill bg-success-transparent">진행중</span></td>
                            </c:if>
                        </tr>
                    		</c:forEach>
                    	</c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <hr style="margin:0px; border-color:rgba(148, 145, 145, 0.289);">
        <div class="card-header">
            <div class="card-title">
                연가 기안 작성
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label for="daterange" class="form-label">기간</label>
                        <div class="input-group">
                            <div class="input-group-text text-muted"><i class="ri-calendar-line"></i></div>
                            <input type="text" class="form-control" id="daterange" placeholder="기간을 선택해주세요.">
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label for="day" class="form-label">사용일수</label>
                        <input type="text" class="form-control" id="day" value="" readonly>
                    </div>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label for="duration" class="form-label">잔여일수</label>
                        <input type="text" class="form-control" id="leftover" value="" readonly>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="daterange" class="form-label" style="margin-top:30px;">사유</label>
                <input type="text" class="form-control" id="vacationReason">
            </div>

            <div class="form-group" style="margin-top:20px;">
                <button type="button" class="btn btn-outline-dark btn-wave" id="vacationBtn">신청</button>
            </div>
        </div>
<!--     </div> -->

								</div>
								<div class="tab-pane text-muted" id="service1" role="tabpanel">
									<b>Lorem Ipsum</b>
								</div>
							</div>
							
<!-- 캘린더 폼 -->

<div class="tab-pane text-muted" id="home3" role="tabpanel">
<!-- <div class="container"> -->
    <div class="card custom-card">
        <div class="card-header">
            <div class="card-title">
               	 캘린더
            </div>
        </div>
        
        <div class="card-body">
        <nav>
            <div class="nav nav-tabs mb-3" id="calendar-tab" role="tablist">
              <button class="nav-link active" id="nav-calendarAll-tab" data-bs-toggle="tab" data-bs-target="#nav-calendarAll" type="button" role="tab" aria-controls="nav-calendarAll" aria-selected="true">전체캘린더</button>
              <button class="nav-link" id="nav-calendarPersonal-tab" data-bs-toggle="tab" data-bs-target="#nav-calendarPersonal" type="button" role="tab" aria-controls="nav-calendarPersonal" aria-selected="false">개인캘린더</button>
              <button class="nav-link" id="nav-calendarOffice-tab" data-bs-toggle="tab" data-bs-target="#nav-calendarOffice" type="button" role="tab" aria-controls="nav-calendarOffice" aria-selected="false">업무캘린더</button>
            </div>
         </nav>
         
<!--          <div id=calendarAll></div> -->
         
          <div class="calendar-tab-cont" id="calnav-tabContent">
            <div class="tab-pane text-muted fade show active" id="nav-calendarAll" role="tabpanel" aria-labelledby="nav-calendarAll-tab" tabindex="0">
            	<div id="calendarAll"></div>
            </div>
            <div class="tab-pane text-muted fade mt-0" id="nav-calendarPersonal" role="tabpanel" aria-labelledby="nav-calendarPersonal-tab" tabindex="0">
            	<div id="calendarPersonal"></div>
            </div>
            <div class="tab-pane text-muted fade mt-0" id="nav-calendarOffice" role="tabpanel" aria-labelledby="nav-calendarOffice-tab" tabindex="0">
            	<div id="calendarOffice"></div>
            </div>
          </div>

     	</div>
	</div>
</div> 
       
						</div>
						<!-- </div> -->
						<!-- </div> -->

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- End::app-content -->



<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal"
        data-bs-target="#exampleModal">
        Launch demo modal
    </button>

    <div class="modal fade" id="exampleModal" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel1">Modal title</h6>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label for="inputPassword6" class="col-form-label">Password</label>
                        </div>
                        <div class="col-auto">
                            <input type="password" id="inputPassword6" class="form-control"
                                aria-describedby="passwordHelpInline">
                        </div>
                        <div class="col-auto">
                            <span id="passwordHelpInline" class="form-text">
                                Must be 8-20 characters long.
                            </span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save
                        changes</button>
                </div>
            </div>
        </div>
    </div> -->
   <!-- 캘린더 입력 모달 -->
<div class="modal fade" id="insertCalModal" tabindex="-1" aria-labelledby="exampleModalScrollable2" data-bs-keyboard="false" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="card custom-card contactus-form overflow-hidden">
			<div class="modal-content">
				<div class="card-header">
					<div class="card-title" id="calModalTitle">일정등록</div>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기" style="position: absolute; top: 30%; right: 5%;"></button>				</div>
				<div class="card-body">
					<div class="row gy-3">
						<div class="col-xl-12">
							<label for="contact-address-firstname" class="form-label">일정:</label> 
								<input type="text" class="form-control" id="calendarTitle" placeholder="일정을 입력하세요">
						</div>
						<div class="col-xl-12 mb-2">
							<label for="colorPiker" class="form-label">색상선택 :</label>
							<div class="color-picker" id="calendarColor">
								<div class="color-option" style="background-color: #a4bdfc;"></div> <!-- 라이트 파랑 -->
								<div class="color-option" style="background-color: #7ae7bf;"></div> <!-- 민트 -->
								<div class="color-option" style="background-color: #dbadff;"></div> <!-- 라이트 보라 -->
								<div class="color-option" style="background-color: #ff887c;"></div> <!-- 라이트 레드 -->
								<div class="color-option" style="background-color: #fbd75b;"></div> <!-- 라이트 옐로우 -->
								<div class="color-option" style="background-color: #ffb878;"></div> <!-- 라이트 오렌지 -->
								<div class="color-option" style="background-color: #46d6db;"></div> <!-- 라이트 청록 -->
								<div class="color-option" style="background-color: #e1e1e1;"></div> <!-- 라이트 그레이 -->
						<!-- Add more color options as needed -->
							</div>
						</div>
							<div class="col-xl-6">
								<label for="contact-address-phone" class="form-label">시작시간 :</label>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-text text-muted">
											<i class="ri-calendar-line"></i>
										</div>
										<input type="text" class="form-control" id="calendarStartDate" placeholder="Choose date with time">
									</div>
								</div>
							</div><br/>
							<div class="col-xl-6">
								<label for="contact-address-email" class="form-label">종료시간:</label>
								<div class="input-group">
									<div class="input-group-text text-muted">
										<i class="ri-calendar-line"></i>
									</div>
									<input type="text" class="form-control" id="calendarEndDate"
										placeholder="Choose date with time">
								</div>
							</div>
							<div class="col-xl-2">
								<label for="contact-address-email" class="form-label">&nbsp;</label>
								<br />
								<div class="input-group">
									<div class="form-check form-check-md d-flex align-items-center">
										<input class="form-check-input" type="checkbox" value="" id="calendarAllday"> 
										<label class="form-check-label" for="checkebox-md"> Allday </label>
									</div>
								</div>
							</div>
						<div class="col-xl-12">
							<label for="contact-mail-message" class="form-label">메모
								:</label>
							<textarea class="form-control" id="calendarContent" rows="2"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary-light btn-wave" id="insertCalBtn">등록</button>
					<button class="btn btn-secondary-light btn-wave" data-bs-dismiss="modal" id="updateCalBtn">수정</button>
					<button class="btn btn-danger-light btn-wave" data-bs-dismiss="modal" id="closeModal">취소</button>
					<button class="btn btn-danger-light btn-wave" data-bs-dismiss="modal" id="deleteCalBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 캘린더 입력 모달  끝-->

 <!-- 오피스캘린더 디테일 모달 -->
<div class="modal fade" id="officeCalModal" tabindex="-1" aria-labelledby="exampleModalScrollable2" data-bs-keyboard="false" aria-hidden="true" style="width">
	<div class="modal-dialog modal-dialog-centered">
		<div class="card custom-card contactus-form overflow-hidden" style="width:400px;">
			<div class="modal-content">
				<div class="card-header">
					<div class="card-title">일정조회</div>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기" style="position: absolute; top: 30%; right: 5%;"></button></div>
				<div class="card-body m-3">
					<div class="row gy-3">
						<div class="col-xl-12" style="margin-top:-5px;">
							<label for="officeTitle" class="form-label"><i class="ri-calendar-schedule-line" style="margin-right:5px;"></i>일정</label> 
								<div id="officeTitle" > </div>
<!-- 								<input type="text" class="form-control" id="officeTitle" disabled > -->
						</div>
							<div class="col-xl-6">
								<label for="contact-address-phone" class="form-label"><i class="ri-time-line" style="margin-right:5px;"></i>시간 </label>
								<div class="form-group">
								
										<div type="text" id="officeStartDate"></div>
								</div>
							</div><br/>
						<div class="col-xl-12">
							<label for="contact-mail-message" class="form-label"><i class="ri-draft-line" style="margin-right:5px;"></i>메모</label>
							<div id="officeContent" rows="2" ></div>
<!-- 							<textarea class="form-control" id="officeContent" rows="2" disabled></textarea> -->
						</div>
					</div>
				</div>
<!-- 				<div class="modal-footer"> -->
<!-- 					<button class="btn btn-danger-light btn-wave" data-bs-dismiss="modal" id="closeModal">닫기</button> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
</div>
<!--오피스캘린더 디테일 모달   끝-->
	


<!-- 알럿 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="col-xxl-12 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="card bg-white border-0">
					<div class="alert custom-alert1 alert-warning">
						<div class="text-center px-5 pb-0" style="margin-top: 50px">
							<svg class="custom-alert-icon svg-warning"
								xmlns="http://www.w3.org/2000/svg" height="1.5rem"
								viewBox="0 0 24 24" width="1.5rem" fill="#000000">
								<path d="M0 0h24v24H0z" fill="none" />
								<path d="M1 21h22L12 2 1 21zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z" /></svg>
							<h5>주의</h5>
							<p class="">정말로 개인정보를 수정하시겠습니까?</p>
							<button class="btn btn-sm btn-outline-secondary m-1"
								data-bs-dismiss="modal">취소</button>
							<button class="btn btn-sm btn-warning m-1" id="modifyBtn">수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 비밀번호 검증 모달 -->
<div class="modal fade" id="passChkModal" tabindex="-1">
    <div class="modal-dialog modal-md">
        <div class="modal-content" >
            <div class="modal-header">
                <h6 class="modal-title" id="passChkModalLabel">비밀번호 인증
                </h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="mb-3">
                    <form action="">
                        <label for="form-text" class="form-label fs-14 text-dark">비밀번호</label>
                        <input type="password" class="form-control" id="memPw" placeholder="비밀번호를 입력해주세요!">
                        <div class="invalid-feedback" id="invalid-pw">*비밀번호가 틀렸습니다!</div>
                    </form>
                    </div>
                    <div>
                        <button class="btn btn-primary" type="button" id="pwChkBtn" data-param="${sessionScope.user.member.memPw}">확인</button>
                        <button class="btn btn-primary" type="button" data-bs-dismiss="modal" aria-label="모달닫기">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 비밀번호 변경 모달 -->
<div class="modal fade" id="passwordModify" tabindex="-1">
    <div class="modal-dialog modal-md">
        <div class="modal-content" >
            <div class="modal-header">
                <h6 class="modal-title" id="#passwordModifyLabel">비밀번호 변경
                </h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="mb-3">
                        <label for="form-text" class="form-label fs-14 text-dark">현재 비밀번호</label>
                        <input type="password" class="form-control" id="originalPw" placeholder="비밀번호를 입력해주세요!">
                        <div class="invalid-feedback" id="invalid-pw">*비밀번호가 틀렸습니다!</div>
                        <label for="form-text" class="form-label fs-14 text-dark">변경 할 비밀번호</label>
                        <input type="password" class="form-control" id="modifyPassword1" placeholder="변경하실 비밀번호를 입력해주세요!">
                        <div class="invalid-feedback">*4~10자리 영어, 숫자, 특수문자를 포함하여 입력하여주세요!</div>
                        <label for="form-text" class="form-label fs-14 text-dark">비밀번호 확인</label>
                        <input type="password" class="form-control" id="modifyPassword2" placeholder="변경하실 비밀번호를 한번 더 입력해주세요!">
                        <div class="invalid-feedback">*비밀번호가 일치하지 않습니다!</div>
						<font color="red" id="errMsg" size="15px"></font>
                        <input type="hidden" value="${sessionScope.user.member.memNo }" id="memNo" name="memNo">
                    </div>
                    <div>
                        <button class="btn btn-primary" type="button" id="modifyPasswordBtn" data-param="${sessionScope.user.member.memPw}">확인</button>
                        <button class="btn btn-primary" type="button" data-bs-dismiss="modal" aria-label="모달닫기">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="disagreeModal" tabindex="-1"
aria-labelledby="exampleModalSmLabel" aria-hidden="true">
<div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header">
            <h6 class="modal-title" id="exampleModalSmLabel">반려 사유
            </h6>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
        </div>
        <div class="modal-body" id="disagreeBody">
            ...
        </div>
    </div>
</div>
</div>
<script>
var fullDate;

$(document).on("click",'.disagreeReason', function(){
	console.log($(this));
	let reason = $(this).data("disagree");
	$('#disagreeBody').text(reason);
	$('#disagreeModal').modal('show');
// 	$('#modaldemo8').toggle();
});
	
$('#daterange').on("change",function(){
	fullDate = $('#daterange').val();
	let startDate = new Date(fullDate.split(' to ')[0]);
	let endDate = new Date(fullDate.split(' to ')[1]);
	let dateDiff = endDate.getTime() - startDate.getTime();
	daysDiff = dateDiff / (1000 * 3600 * 24);
	daysDiff = Math.floor(daysDiff) + 1;
	
	if(isNaN(daysDiff)) daysDiff = 1;

	
	$('#day').val(daysDiff+"일")
	let leftoverDay = ${member.empVO.empVacation};
	if(leftoverDay - daysDiff < 0){
		$('#leftover').val("잔여 일수가 초과되었습니다");
	}else{
		$('#leftover').val(leftoverDay-daysDiff +"일");
	}
});
/* 비밀번호 검증 */
$('#pwChkBtn').on("click",function(){
	console.log("클릭클릭클릭클릭")
	let memPw = $('#memPw').val();
	let memPw2 = $('#pwChkBtn').data('param');
	console.log(memPw2)
	let data = { 
			"memPw" : memPw,
			"memPw2" : memPw2
			}
	$.ajax({
		url : "/public/pwchk.do",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	},
		success : function(res){
			console.log(res);
			if(res === "SUCCESS"){
                $("#passChkModal").modal('toggle');					
                $('#home1').removeClass('active');
                // 탭을 직접 활성화합니다.
//                 $('#about1-tab').addClass('active');
                // 탭 내용을 보여줍니다.
                $('#about1').addClass('active');
			}else if(res === "FAILED"){
				$('#memPw').addClass("is-invalid");
			}
		}
	});
});
$('#modifyBtn').on("click",function(){
	console.log("수정버튼 클릭 !");
	$('#modifyform').submit();
});
$('#modifyPasswordBtn').on("click",function(){
	let memPw = $('#originalPw').val();
	let memPw2 = $('#modifyPassword1').val();
	let memPw3 = $(this).data("param");
	let memNo = $('#memNo').val();
	let data = {
			"memPw1" : memPw,
			"memPw2" : memPw2,
			"memPw3" : memPw3,
			"memNo" : memNo
	};
	$.ajax({
		url : "/public/mypage/passwordmodify.do",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            // CSRF 토큰 헤더에 추가
           xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	},
		success : function(res){
			if(res ==="SUCCESS"){
				location.href="/mypage/"+memNo;
			}
			if(res ==="FAILED"){
				$('#errMsg').text("비밀번호 변경이 실패하였습니다!");
			}
			if(res ==="!MATCH"){
				$('#errMsg').text("비밀번호 인증이 실패하였습니다!");
			}
			console.log(res)
		}
	});
});
    	
        $(function(){
        	var NO = ${sessionScope.user.member.memNo}
            var memAddress2 = $("#memAddress2");
			//카카오맵 api 사용 자원들
			var mapContainer = null;
			var map = null;
			var geocoder = null;
			var file = $('#file');
			var imgBox = $('#imgBox');
            var authCode;
            
            const $h4Elements = $('.h4');
		
            $('#vacationBtn').on("click",function(){
            	let leftOver = $('#leftover').val();
            	let dateRange = fullDate.split(' to ');
            	let startDate = dateRange[0];
            	let endDate = dateRange.length > 1 ? dateRange[1] : startDate;
            	
            	let today = new Date();
  				let writingDate = today.getFullYear()+ '년 '+(today.getMonth()+1)+'월 '+today.getDate()+'일';
            	
            	let data = {
            			"vacationStartDate" : startDate,
            			"vacationEndDate" : endDate,
            			"vacationDate" : daysDiff,
            			"memNo" : NO,
            			"vacationReason" : $('#vacationReason').val()
            	};
            	
            	console.table(data);
            	if(leftOver === "잔여 일수가 초과되었습니다"){
            		alert('연가 잔여 일수가 초과되었습니다.');
            		return;
            	}else{
            		
	            	$.ajax({
	            		url : "/public/vacationRequest.do",
	            		type : "post",
	            		data : JSON.stringify(data),
	            		contentType : "application/json;charset=utf-8",
	            		beforeSend: function(xhr) {
	                        // CSRF 토큰 헤더에 추가
	                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
	            	},
	            		success : function(res){
// 							let html = $('#vacationBody').html();
							let html = "";
	            			if(res === "SUCCESS"){
								html += '<tr>';
								html += '<td>'+startDate.split("-")[0]+'년 '+startDate.split("-")[1]+'월 '+startDate.split("-")[2]+'일</td>';
								html += '<td>'+endDate.split("-")[0]+'년 '+endDate.split("-")[1]+'월 '+endDate.split("-")[2]+'일</td>';
								html += '<td>'+daysDiff+'일</td>';
								html += '<td>'+writingDate+'</td>';
								html += '<td><span class="badge rounded-pill bg-success-transparent">진행중</span></td>';
								html += '</tr>';
								$('#vacationBody').append(html);
								
								
								$('#daterange').val("");
								$('#day').val("");
								$('#leftover').val("");
								$('#vacationReason').val("");
								
		            			let notidata ={
		            					"code" : "requestNoti",
		            					"content" :"처리 대기 중인 연가기안이 존재합니다.",
		            					"destination" : "/admin/vacationRequestList"
		            			};
		            				ws.send(JSON.stringify(notidata))
							}
	            			
	            		}
	            	});
            	}
            });
            
            
            $('#startWork').on("click",function(){
            	alert("출근 처리가 완료되었습니다");
            	let data = {
            			"memNo" : NO
            	}
            	let $working = $('#working');
            	$.ajax({
            		url: "/public/startwork.do",
            		type : "post",
            		data : JSON.stringify(data),
            		contentType : "application/json;charset=utf-8",
            		beforeSend: function(xhr) {
                        // CSRF 토큰 헤더에 추가
                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
            	},
            		success : function(res){
//             			$('#startWorkTime').text(res);
            			$('#startWork').prop('disabled',true);
						$('#startWork').html(res);
						$('#workbadge').html('<span class="badge rounded-pill bg-success" id="working" style="font-size: 12px; margin-left: 15px;">근무중</span>');
						console.log(res)
            		}
            	})
            });
		
            $('#endWork').on("click",function(){
            	alert("퇴근 처리가 완료되었습니다.");
            	let data = {
            			"memNo" : NO
            	}
            	$.ajax({
            		url: "/public/endwork.do",
            		type : "post",
            		data : JSON.stringify(data),
            		contentType : "application/json;charset=utf-8",
            		beforeSend: function(xhr) {
                        // CSRF 토큰 헤더에 추가
                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
            	},
            		success : function(res){
//             			$('#startWorkTime').text(res);
            			$('#endWork').prop('disabled',true);
						$('#endWork').html(res);
						$('#workbadge').html('<span class="badge rounded-pill bg-light"	style="font-size: 12px; margin-left: 15px;"><span style="color: black;">퇴근</span>');
            				console.log(res)
            		}
            	})
            });
            
            
            // 페이지가 로드될 때 내 프로필에 호버 이벤트와 클릭 이벤트를 설정합니다.
            $h4Elements.each(function (index, element) {
                // 처음 로드될 때 가장 위에 있는 내 프로필에 밑줄과 굵은 글씨 스타일을 적용합니다.
                if (index === 0) {
                    $(element).addClass('clicked');
                }

                $(element).on('mouseover', function () {
                    // 호버 이벤트 처리
                    console.log('마우스를 올렸습니다.');
                    // 예를 들어, 요소의 텍스트를 변경하거나 다른 작업을 수행할 수 있습니다.
                });

                $(element).on('click', function () {
                    // 클릭 이벤트 처리
                    // 다른 요소들의 클릭 클래스 제거
                    $h4Elements.removeClass('clicked');
                    // 클릭된 요소에 'clicked' 클래스 추가
                    $(this).addClass('clicked');
                });
            });
            
            // 2024.04.19 JE Calendar Update
            $('#sideMenu .tab-link').click(function(){
                // 클릭된 탭의 data-target 속성 값 가져오기
                var targetId = $(this).data('target');
                

                $('#sideMeneContent .tab-pane').hide();
                
                // 클릭된 탭에 해당하는 컨텐츠 보여주기
                $('#' + targetId).show();
                if(targetId == "home3"){
	                setTimeout(() => {
		                $('#calendar-tab .nav-link').map(function(i,v){
		                	this.classList.remove("active");
		               		var eleAll = document.getElementById("nav-calendarAll-tab");
		               		eleAll.classList.add("active");
		               		var ele = document.getElementById("nav-calendarAll");
		               		ele.classList.add("active","show");
		               		ele.style.display = "block";
	                		
	            	        loadCalendarAll();
		                });
					}, 50);
                }
            });
            
            file.on("change",function(){
				var files = event.target.files;
				var file = files[0];
				console.log(file);
								
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					url : "/file/uploadAjax",
					type : "post",
					data : formData,
					dataType : "text",
					processData : false,
					contentType : false,
					beforeSend: function(xhr) {
                        // CSRF 토큰 헤더에 추가
                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
            	},
					success : function(data){
						console.log(data);
						if(checkImageType(data)){
							imgBox.attr("src", "/file/displayFile?fileName="+getThumbnailName(data));
							$('#imgVal').attr("value",data);
						}
					}
				});
			});
            
			// 이름 검증
			$('#memName').on('blur',function(){
				memName = $('#memName').val();
			    if(validateName(memName)) {
			        $('#memName').removeClass('is-invalid');
			        $('#memName').addClass("is-valid");
			    }
			    else if(!validateName(memName)){
			        $('#memName').removeClass('is-valid');
			        $('#memName').addClass("is-invalid");
			}
			});
			
			// 아이디 검증
			$('#memId').on('blur',function(){
				memId = $('#memId').val();
			    if(validateUsername(memId)) {
			        $('#memId').removeClass('is-invalid');
			        $('#memId').addClass("is-valid");
			    }
			    else if(!validateUsername(memId)){
			        $('#memId').removeClass('is-valid');
			        $('#memId').addClass("is-invalid");
			}
			});
			
			$('#checkId').on("click",function(){
				let checkId = $('#memId').val();
				let data = {
						"checkId" : checkId
				};
				$.ajax({
					url : "/public/idChk.do",
					type : "post",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					beforeSend: function(xhr) {
                        // CSRF 토큰 헤더에 추가
                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
            	},
					success : function(result){
						console.log(result);
						if(result === "OK") {
					        $('#memId').removeClass('is-invalid');
					        $('#memId').addClass("is-valid");
					       	$('#valid-id').html("*사용 가능한 아이디입니다 !");
						}
						
						if(result === "FAILED") {
					        $('#memId').removeClass('is-valid');
					        $('#memId').addClass("is-invalid");
							$('#invalid-id').html("*중복된 아이디가 존재합니다 !");
						}
					}
				});
			});
			
			// 비밀번호 정규식 검증
			$('#memPw').on('blur',function(){
				var memPw = $('#memPw').val();
			    if(validatePassword(memPw)) {
			        $('#memPw').removeClass('is-invalid');
			        $('#memPw').addClass("is-valid");
			    }
			    else if(!validatePassword(memPw)){
			        $('#memPw').removeClass('is-valid');
			        $('#memPw').addClass("is-invalid");
			}
			});
			
			// 변경할 비밀번호 정규식 검증
			$('#modifyPassword1').on('blur',function(){
				var memPw = $('#modifyPassword1').val();
			    if(validatePassword(memPw)) {
			        $('#modifyPassword1').removeClass('is-invalid');
			        $('#modifyPassword1').addClass("is-valid");
			    }
			    else if(!validatePassword(memPw)){
			        $('#modifyPassword1').removeClass('is-valid');
			        $('#modifyPassword1').addClass("is-invalid");
			}
			});
			// 변경할 비밀번호 확인 검증
			$('#modifyPassword2').on('blur',function(){
				var memPw = $('#modifyPassword1').val();
				var memPw2 = $('#modifyPassword2').val();
			    if(correctPassword(memPw,memPw2)) {
			        $('#modifyPassword2').removeClass('is-invalid');
			        $('#modifyPassword2').addClass("is-valid");
			    }
			    else if(!correctPassword(memPw,memPw2)){
			        $('#modifyPassword2').removeClass('is-valid');
			        $('#modifyPassword2').addClass("is-invalid");
			}
			});
			
			// 이메일 검증
			$('#checkEmail').on("click",function(){
				var memEmail = $('#memEmail').val();
			    if(validateEmail(memEmail)) {
			        $('#memEmail').removeClass('is-invalid');
			        $('#memEmail').addClass("is-valid");

			    }
			    else if(!validateEmail(memEmail)){
			        $('#memEmail').removeClass('is-valid');
			        $('#memEmail').addClass("is-invalid");
			        return;
			    }
				let obj = { "email" : memEmail};
				$.ajax({
					url : "/public/emailAuth",
					data : JSON.stringify(obj),
					type : "POST",
					contentType : "application/json;charset=utf-8",
					beforeSend: function(xhr) {
                        // CSRF 토큰 헤더에 추가
                       xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
            	},
					success:function(res){
						console.log("result : "+res);
						authCode = res;
					}
				});
				$('#emailAuth').css('display', 'block');
			});
		
			// 이메일 인증번호 확인
			$('#emailAuthBtn').on('click',function(){
				let authNo = $('#authNo').val();	
				console.log(authNo);
				console.log(authCode);
				if(authNo === authCode.toString() ) {
					$('#authNo').prop("disabled",true);
					$('#emailAuthBtn').prop("disabled",true);
					alert('인증번호가 일치합니다!');
					$('#authNo').removeClass("is-invalid");
				}else{
					$('#authNo').addClass("is-invalid");
					alert('인증번호가 일치하지 않습니다');
				}
			});
			
			// 주민등록번호 검증
			$('#memRegno').on('blur',function(){
				var memRegno = $('#memRegno').val();
				if(validateResidentNumber(memRegno)) {
		        	$('#memRegno').removeClass('is-invalid');
			        $('#memRegno').addClass("is-valid");
			    }
			    else if(!validateResidentNumber(memRegno)){
			        $('#memRegno').removeClass('is-valid');
			        $('#memRegno').addClass("is-invalid");
				}
			});
			
		    $('#memTel').on('input', function () {
		        // 현재 입력된 전화번호를 가져옵니다.
		        let telNumber = $(this).val();
		        
		        // 전화번호에서 숫자만 남기고 나머지는 모두 제거합니다.
		        telNumber = telNumber.replace(/\D/g, '');
		        
		        // 전화번호를 010-0000-0000 형식으로 변환합니다.
		        if (telNumber.length >= 4 && telNumber.length <= 11) {
		            telNumber = telNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		        }
		        
		        // 변환된 전화번호를 다시 입력 필드에 넣어줍니다.
		        $(this).val(telNumber);
		    });
		    
			// 전화번호 검증
			$('#memTel').on('blur',function(){
				var memTel = $('#memTel').val();
				if(validatePhoneNumber(memTel)) {
		        	$('#memTel').removeClass('is-invalid');
			        $('#memTel').addClass("is-valid");
			    }
			    else if(!validatePhoneNumber(memTel)){
			        $('#memTel').removeClass('is-valid');
			        $('#memTel').addClass("is-invalid");
				}
			});
			
			$('#memAddress1').on('blur',function(){
				var memAddress1 = $('#memAddress1').val();
				var memAddress2 = $('#memAddress2').val();
				if(memAddress1 == null) {
					$('#memAddress1').removeClass('is-valid');
					$('#memAddress1').addClass('is-invalid');
				}
				if(memAddress1 != null) {
					$('#memAddress1').removeClass('is-invalid');
					$('#memAddress1').addClass('is-valid');
				}
			});
			$('#memAddress2').on('blur',function(){
				var memAddress2 = $('#memAddress2').val();
				if(memAddress2 != null) {
					$('memAddress2').removeClass('is-invalid');
					$('#memAddress2').addClass('is-valid');
				}
				if(memAddress2 == null) {
					$('#memAddress2').removeClass('is-valid');
					$('#memAddress2').addClass('is-invalid');
				}
			});

		

        function DaumPostCode() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== ''
                                    && /[동|로|가]$/g.test(data.bname)) {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== ''
                                    && data.apartment === 'Y') {
                                extraAddr += (extraAddr !== '' ? ', '
                                        + data.buildingName
                                        : data.buildingName);
                            }
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('memPostcode').value = data.zonecode;
                        document.getElementById("memAddress1").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("memAddress2").focus();
                    }
                }).open();
        }

		function getThumbnailName(fileName){
			var front = fileName.substr(0, 12); // 년 월 일 에 해당하는 폴더 경로
			var end = fileName.substr(12);		// 뒤쪽 파일명
			
			console.log(front);
			console.log(end);
			
			return front + "s_" + end;
		}
		
		function checkImageType(fileName){
			//정규식에서 i는 대소문자 구분없음을 나타냄
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern); //패턴과 일치하면 이미지로 판단
		}
		
		
//------------------------------캘린더영역---------------------------

//     function showTab(tabId) {
//         var tabs = document.querySelectorAll('[id^="calendar"]');
//         if(tabId=="calendarAll"){
//         	$("#calendarAll").show();
//         	$("#calendarPersonal").hide();
//         	$("#calendarOffice").hide();
//         }else if(tabId=="calendarPersonal"){
//         	$("#calendarPersonal").show();
//         	$("#calendarOffice").hide();
//         	$("#calendarAll").hide();
//         }else if(tabId=="calendarOffice"){
//         	$("#calendarOffice").show();
//         	$("#calendarPersonal").hide();
//         	$("#calendarAll").hide();
//         }
// 	}
        

	//캘린더 nav바 오류수정
//     $('#calendar-tab .nav-link').on('click', function(){
//         // 클릭된 탭의 data-bs-target 속성값 가져오기
//         var target = $(this).data('bs-target');
//         // 모든 컨텐츠 영역 숨기기
//         $('#calendar-tab .tab-pane').hide();
//         // 선택된 탭의 컨텐츠 영역 표시하기
//         $(target).show();
//     });


//         tabs.forEach(function(tab) {
//             if (tab.id === tabId) {
//                 tab.style.display = 'block';
        
//             } else {
//                 tab.style.display = 'none';
//             }
//         });
//     }
$(function() {
		
    $('#calendar-tab .nav-link').click(function(){
    	$('.calendar-tab-cont .tab-pane').hide();
        // 클릭된 탭의 data-target 속성 값 가져오기
        var targetId = $(this).data('bs-target');
        console.log("calendar-tab을 누름 : " + targetId);
        // 클릭된 탭에 해당하는 컨텐츠 보여주기
        $(targetId).show();
        
        if(targetId == "#nav-calendarAll")
        	loadCalendarAll();
        else if(targetId == "#nav-calendarPersonal")
        	loadCalendarPersonal();
        else if(targetId == "#nav-calendarOffice")
        	loadCalendarOffice();
    });


	});
		
	//날짜선택
    var fp1 = flatpickr("#calendarStartDate", {
        enableTime: true,
        dateFormat: "Y-m-d H:i",
    });
    
    var fp2 = flatpickr("#calendarEndDate", {
        enableTime: true,
        dateFormat: "Y-m-d H:i",
    });
    
    var fp3 = flatpickr("#officeStartDate", {
        enableTime: true,
        dateFormat: "Y-m-d H:i",
    });
    
	
	
	//각각의 캘린더 요소 
    var calendarAll="";
    
    var calendarPersonal="";
    
    var calendarOffice="";
    let allDay = false;	// 이벤트 종일 여부값을 넣을 변수
    let calendarKey =""; //수정, 삭제 위한 변수

    //개인 모달 안에 값들
    let title = $('#calendarTitle');			
    let content = $('#calendarContent');	
    let startDate = $('#calendarStartDate');		
    let endDate = $('#calendarEndDate');	
    let allDayCheckBox = $('#calendarAllday');	
	let color="";
    
    //모달버튼
    let insertCalBtn = $('#insertCalBtn');	// 등록버튼
    let updateCalBtn = $('#updateCalBtn');	// 수정버튼
    let deleteCalBtn = $('#deleteCalBtn');	// 삭제버튼
    let closeModalBtn = $('#closeModal');	// 취소버튼
    
    let calModalTitle = $("#calModalTitle"); //모달타이틀
	
	//캘린더 입력/수정 모달 플래그
	var calendarFalg = true;
    
    function calendarFalgEvent(){
		if(calendarFalg){
			insertCalBtn.show();
			closeModalBtn.show();
			deleteCalBtn.hide();
			updateCalBtn.hide();
			calModalTitle.text("일정입력");
		}else{
			updateCalBtn.show();
			deleteCalBtn.show();
			insertCalBtn.hide();
			closeModalBtn.hide();
			calModalTitle.text("일정조회");
		}
    }
    
    
    allDayCheckBox.change(function() {	// checkbox change 이벤트
    	if ($(this).is(':checked')) {	// checkbox가 체크되어 있으면	
			allDay = true;
		} else {
			allDay = false;
		}
    });
    
    // 각 색상 옵션 요소들을 가져옵니다.
    var colorOptions = document.querySelectorAll('.color-option');

    // 각 색상 옵션에 클릭 이벤트를 추가합니다.
    colorOptions.forEach(function(option) {
        option.addEventListener('click', function() {
            // 선택된 색상 네모의 테두리를 진하게 바꿉니다.
            // 모든 색상 옵션의 테두리를 초기화합니다.
            colorOptions.forEach(function(opt) {
                opt.style.border = 'none';
            });
            // 클릭된 색상 네모의 테두리를 진하게 바꿉니다.
            this.style.border = '2px solid black';

            // 선택된 색상을 어딘가에 저장하거나 처리합니다.
           	color = this.style.backgroundColor;
            console.log('Selected color:', color);
        });
    });
    
	//오피스 모달 설정
    let officeTitle = $('#officeTitle');			
    let officeContent = $('#officeContent');	
    let officeStartDate = $('#officeStartDate');		
    let officeEndDate = $('#officeEndDate');	
    
    //모달 설정
	var calModal = new bootstrap.Modal(document.getElementById('insertCalModal'));
	var officeModal = new bootstrap.Modal(document.getElementById('officeCalModal'));
	
	let calendarPersonalEl = document.getElementById('calendarPersonal');	// calendarPersonal 영역
    
	//개인캘린더 불러오기
    function loadCalendarPersonal(){
    	$.ajax({
        	url : "/calendar/personal",
        	type : "post",
   	     	beforeSend: function(xhr) {
 	     	   // CSRF 토큰 헤더에 추가
              xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
   			},
        	success : function (res) {
				console.log("개인캘린더 : "+res);

        		calendarPersonal = new FullCalendar.Calendar(calendarPersonalEl, {
        			
			       events : res,
			       initialView: 'dayGridMonth',
			       headerToolbar : {				// 헤드툴바 설정
			           left: 'prev,next today',
			           center: 'title',
			           right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			       },
	   		        expandRows : true,
			        selectable : true, // 달력 일자 드래그 설정가능
					droppable : true,	// 드롭 가능 여부 설정
					editable : true,	// 수정 가능 여부 설정
					nowIndicator: true, // 현재 시간 마크
					navLinks : true,	// 링크 활성화 여부 설정
			    	locale: 'ko', // 한국어 설정
					windowResizeDelay: 100,
					
			
					select : function(info) {	//날짜영역 클릭시 입력모달 띄움
						// 입력 요소의 값 초기화
					   var inputs = document.querySelectorAll('#insertCalModal input');
					    inputs.forEach(function(input) {
					        input.value = ''; 
					        calendarContent.value='';
					    });
					        allDayCheckBox.checked=false;
					        
					    calendarFalg = true;
					    calendarFalgEvent();
					   
					    //클릭한 시작날짜, 종료날짜 세팅
    					startDate.val(info.startStr);
    					endDate.val(info.endStr);

			            calModal.show();
    					
    				},
    				// 이벤트를 클릭했을 때의 이벤트
    				eventClick : function(info) {
    				
    					// 입력 요소의 값 초기화
    					var inputs = document.querySelectorAll('#insertCalModal input');
   					    inputs.forEach(function(input) {
   					        input.value = ''; 
   					        calendarContent.value='';
   					    });
   					     allDayCheckBox.checked=false;
   						 calendarFalg=false;
   						calendarFalgEvent();
    					
   						
    					// 클릭한 이벤트의 정보
    					let event = info.event._def;
    					let contentVal = event.extendedProps.calendarContent;
    					let instance = info.event._instance;
    					let titleVal = event.title;
    					let allDay = event.allDay;
    					let startVal = instance.range.start;
    					let endVal = instance.range.end;
    					let color =event.ui.backgroundColor;
    					
    					console.log(startVal);
    					
    					calendarKey = event.extendedProps.calendarKey;
    					
    					let startDateVal = startVal.toISOString().split('.')[0].split(' ')[0];
    					let endDateVal = endVal.toISOString().split('.')[0].split(' ')[0];
    					
    					// 이벤트의 정보들을 가공하여 input에 입력
    					title.val(titleVal);
    					startDate.val(startDateVal);
    					endDate.val(endDateVal);
    					content.val(contentVal);
    					
    					
    					if (allDay) {	// 종일 여부가 true이면
    						allDayCheckBox.attr("checked", true);
    					
    						var startDateTimeVal = new Date(startDateVal);
    						fp1.setDate(startDateTimeVal);
    						
    						var endDateTimeVal = new Date(endDateVal);
    						fp2.setDate(endDateTimeVal);
    
    					} else {
    						allDayCheckBox.attr("checked", false);
    						
    						var startDateTimeVal = new Date(startDateVal);
    						fp1.setDate(startDateTimeVal);
    						
    						var endDateTimeVal = new Date(endDateVal);
    						fp2.setDate(endDateTimeVal);

    					}
    					
    					 calModal.show();
    				},
    				// 이벤트가 드롭되었을 떄 이벤트
    				eventDrop : function(info) {

    					// 이벤트가 드롭되었을 때의 정보
						let event = info.event._def;
    					let contentVal = event.extendedProps.calendarContent;
    					let instance = info.event._instance;
    					let titleVal = event.title;
    					let allDay = event.allDay;
    					let startVal = instance.range.start;
    					let endVal = instance.range.end;
    					let color =event.ui.backgroundColor;
    					calendarKey = event.extendedProps.calendarKey;
    					
    					
    					let startDateVal = startVal.toISOString().split('T')[0].split(' ')[0];
    					let endDateVal = endVal.toISOString().split('T')[0].split(' ')[0];
    					let startTimeVal = startVal.toISOString().split('.')[0].split('T')[1].substring(0,5);
    					let endTimeVal = endVal.toISOString().split('.')[0].split('T')[1].substring(0,5);
    					
    					startVal = startDateVal + " " + startTimeVal;
    					endVal = endDateVal + " " + endTimeVal;
    					
    					console.log(startVal);
    					
    					console.log(endVal);
  	
    					let data = {
    							calendarTitle : titleVal,
    							calendarStartDate : startVal,
    							calendarEndDate :  endVal,
    							calendarContent : contentVal,
    							calendarAllDay : allDay,
    							calendarColor : color,
    							calendarKey : calendarKey
    					};
    					update(data);	// 이벤트 수정 함수
    				}
    				
	            });
            	
        		calendarPersonal.render();
        		calendarPersonal.updateSize();
        	    console.log(calendarPersonal);
        	    
        	    calendarPersonal.refetchEvents();
        		
	        }
	    });
    	
		setTimeout(() => {
// 			calendarPersonal.render();
       		calendarPersonal.updateSize();
		}, 10);
    	
	}
 	
   	//전체캘린더
   	function loadCalendarAll(){
   		let calendarAllEl = document.getElementById('calendarAll');	// calendarAll 영역
    	$.ajax({
        	url : "/calendar/all",
        	type : "post",
   	     	beforeSend: function(xhr) {
 	     	   // CSRF 토큰 헤더에 추가
              xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
   			},
        	success : function (res) {
        		console.log("전체캘린더 : " + res);
        		calendarAll = new FullCalendar.Calendar(calendarAllEl, {
			       events : res,
			       initialView: 'dayGridMonth',
			       headerToolbar : {				// 헤드툴바 설정
			           left: 'prev,next today',
			           center: 'title',
			           right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			       },
	   		        expandRows : true,
			        selectable : false, // 달력 일자 드래그 설정가능
					droppable : false,	// 드롭 가능 여부 설정
					editable : false,	// 수정 가능 여부 설정
					nowIndicator: true, // 현재 시간 마크
					navLinks : false,	// 링크 활성화 여부 설정
 			    	locale: 'ko' ,
					
//     				이벤트를 클릭했을 때의 이벤트
    				eventClick : function(info) {
    					console.log(info);
    				
    					// 입력 요소의 값 초기화
    					var inputs = document.querySelectorAll('#officeCalModal input');
   					    inputs.forEach(function(input) {
   					        input.value = ''; 
   					        calendarContent.value='';
   					    });
   						
    					// 클릭한 이벤트의 정보
    					let event = info.event._def;
    					let contentVal = event.extendedProps.calendarContent;
    					let calendarCate = event.extendedProps.calendarCate;
    					let patntName = event.extendedProps.memName;
    					let instance = info.event._instance;
    					let titleVal = event.title;
    					let startVal = instance.range.start;
    					let endVal = instance.range.end;
    					let patntNo = event.extendedProps.empNo;
    					
    					console.log(startVal);
    					let startDateTime = startVal.toISOString().split('T')[0].split(' ')[0]; //날짜
    					let startDateVal = startVal.toISOString().split('T')[1].substring(0,5); //시간
    					
    					//하루 뒤로 생성되는 문제 해결
    					let endDate = new Date(endVal);
    					
    					endDate.setDate(endDate.getDate() - 1);
    					let endDateVal = endDate.toISOString().split('T')[0];
    					
    					// 이벤트의 정보들을 가공하여 input에 입력
    					officeTitle.text(titleVal);
    					
    					if (patntName != "") {
    						//진료예약
    						//시간세팅 문제ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
							officeStartDate.text(startDateTime + " " + startDateVal);
	    					officeContent.text(patntName + " 환자   : "  + contentVal);
    					}else if(calendarCate == "CD005"){
    						//연가
    						officeContent.text(contentVal);
    						officeStartDate.text(startDateVal + " ~ " + endDateVal);
//     						officeEndDate.val(endDateVal);
    					}else if(calendarCate=="CD003"){
    						//수술
    						officeStartDate.text(startDateTime + " " + startDateVal);
	    					officeContent.text(contentVal);
    						
    					}
    				
    					officeModal.show();
    				},
	            });
        		calendarAll.render();
        		calendarAll.updateSize();
        		
        		calendarAll.refetchEvents();
	        }
	    });
		
    	setTimeout(function(){
//     		calendarAll.render();
    		calendarAll.updateSize();
		},5);
   	}
			    

		   	
	//업무캘린더
	function loadCalendarOffice(){
		let calendarOfficeEl = document.getElementById('calendarOffice');	// calendarOffice 영역
    	$.ajax({
        	url : "/calendar/office",
        	type : "post",
   	     	beforeSend: function(xhr) {
 	     	   // CSRF 토큰 헤더에 추가
              xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
   			},
        	success : function (res) {
				console.log("업무캘린더 : "+res);
        		calendarOffice = new FullCalendar.Calendar(calendarOfficeEl, {
			       events : res,
			       initialView: 'dayGridMonth',
			       headerToolbar : {				// 헤드툴바 설정
			           left: 'prev,next today',
			           center: 'title',
			           right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			       },
	   		        expandRows : true,
			        selectable : false, // 달력 일자 드래그 설정가능
					droppable : false,	// 드롭 가능 여부 설정
					editable : false,	// 수정 가능 여부 설정
					nowIndicator: true, // 현재 시간 마크
					navLinks : false,	// 링크 활성화 여부 설정
			    	locale: 'ko', // 한국어 설정
					
//     				이벤트를 클릭했을 때의 이벤트
    				eventClick : function(info) {
    					console.log(info);
    				
    					// 입력 요소의 값 초기화
    					var inputs = document.querySelectorAll('#officeCalModal input');
   					    inputs.forEach(function(input) {
   					        input.value = ''; 
   					        calendarContent.value='';
   					    });
   						
    					// 클릭한 이벤트의 정보
    					let event = info.event._def;
    					let contentVal = event.extendedProps.calendarContent;
    					let calendarCate = event.extendedProps.calendarCate;
    					let patntName = event.extendedProps.memName;
    					let instance = info.event._instance;
    					let titleVal = event.title;
    					let startVal = instance.range.start;
    					let endVal = instance.range.end;
    					let patntNo = event.extendedProps.empNo;
    					
    					let startDateTime = startVal.toISOString().split('T')[0].split(' ')[0]; //날짜
    					let startDateVal = startVal.toISOString().split('T')[1].substring(0,5); //시간
    					
    					//하루 뒤로 생성되는 문제 해결
    					let endDate = new Date(endVal);
    					
    					endDate.setDate(endDate.getDate() - 1);
    					let endDateVal = endDate.toISOString().split('T')[0];
    					
    					// 이벤트의 정보들을 가공하여 input에 입력
    					officeTitle.text(titleVal);
    					
    					if (patntName != "") {
    						//진료예약
    						//시간세팅 문제ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
							officeStartDate.text(startDateTime + " " + startDateVal);
	    					officeContent.text(patntName + " 환자   : "  + contentVal);
    					}else if(calendarCate == "CD005"){
    						//연가
    						officeContent.text(contentVal);
    						officeStartDate.text(startDateVal + " ~ " + endDateVal);
//     						officeEndDate.val(endDateVal);
    					}else if(calendarCate=="CD003"){
    						//수술
    						officeStartDate.text(startDateTime + " " + startDateVal);
	    					officeContent.text(contentVal);
    						
    					}
    				
    					officeModal.show();
    				},
	            });
			    calendarOffice.render();
	        },
	    });
		
    	setTimeout(function(){
// 			calendarOffice.render();
		},5);
	}
 
    
 // 등록 버튼 클릭 이벤트
    insertCalBtn.click(function() {
    	
		let calendarStartdate = "";
		let calendarEndDate = "";
		let event = "";
		let startTime="";
		let endTime="";
		let subEndDay="";

		
		if (allDayCheckBox.is(':checked')) {
			allDay = true;
		} else {
			allDay = false;
		}
		
		if (allDay) {	//올데이 체크되어 있으면 날짜만
		  	var endDate1 = new Date(endDate.val()); // endDate를 Date 객체로 변환
		  	endDate1.setUTCHours(23, 59, 0, 0); // 시, 분, 초, 밀리초를 설정하여 23:59:59.999로 설정
		    calendarEndDate = endDate1.toISOString();; // 다시 문자열로 변환하여 calendarEndDate에 저장
		    subEndDay = calendarEndDate.substr(0,10);
		    endTime  = calendarEndDate.substr(11,5);
		    calendarEndDate = subEndDay +" " + endTime;
		    console.log(calendarEndDate);
			calendarStartdate = startDate.val().substr(0,10);
			
		} else {
			if (startDate.val() == null || endDate.val() == null) {
				alert("null!!!");
				return;
			} else {
				calendarStartdate = startDate.val();
				calendarEndDate = endDate.val();
			}
		}
		
		let data = {
				calendarTitle : title.val(),
				calendarStartDate : calendarStartdate,
				calendarEndDate : calendarEndDate,
				calendarContent : content.val(),
				calendarAllDay : allDay,
				calendarColor : color
		};
		
		$.ajax({
			url : "/calendar/insertEvent",
			data : JSON.stringify(data),
			method : "post",
			contentType : "application/json; charset=utf-8",
			dataType: "text",
   	     	beforeSend: function(xhr) {
    	     	   // CSRF 토큰 헤더에 추가
                 xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
      		},
			success : function(res) {
				if (res=="SUCCESS") {
					alert("일정 등록 성공!");
					// FullCalendar를 다시 로드
					calModal.toggle('hide');
// 					cellElement.style.backgroundColor = '';
					loadCalendarPersonal();
					
				} else {
					alert("일정 등록에 실패했습니다!");
				} 
				
			}
		});
	});
 
    
    // 삭제 버튼 클릭 이벤트
    deleteCalBtn.click(function() {
    	var data = {calendarKey : calendarKey};
		$.ajax({
			url : "/calendar/deleteEvent",
			data : JSON.stringify(data),
			method : "post",
			contentType : "application/json; charset=utf-8",
			dataType: "text",
   	     	beforeSend: function(xhr) {
 	     	   // CSRF 토큰 헤더에 추가
              xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
   			},
			success : function(res) {
				if (res=="SUCCESS") {
					alert("삭제 성공!");
					// FullCalendar를 다시 로드
					loadCalendarPersonal();
				} else {
					alert("삭제 실패!");
				} 
			}
		});
	});
    
    // 수정 버튼 클릭 이벤트
    updateCalBtn.click(function() {
		let calendarStartdate = "";
		let calendarEndDate = "";
		let event = "";
		let startTime="";
		let endTimel="";
		
		if (allDayCheckBox.is(':checked')) {
			allDay = true;
		} else {
			allDay = false;
		}
		
		if (allDay) {
			calendarStartdate = startDate.val().substr(0,10);
			calendarEndDate = endDate.val().substr(0,10);;
		} else {
			if (startDate.val() == null || endDate.val() == null) {
				alert("null!!!");
				return;
			} else {
				calendarStartdate = startDate.val();
				calendarEndDate = endDate.val();
			}
		}
		
		let data = {
				calendarTitle : title.val(),
				calendarStartDate : calendarStartdate,
				calendarEndDate : calendarEndDate,
				calendarContent : content.val(),
				calendarAllDay : allDay,
				calendarColor : color,
				calendarKey : calendarKey
		};
    
		// 이벤트 수정 함수
		update(data);
		
	});
    // 이벤트 수정함수 
    // input으로 입력한 값으로 수정하는 것 이외에 reSize, drop되었을 때에도 이벤트가 수정될 수 있도록
    // 함수를 따로 만들어두었음
    // data : 수정할 정보 데이터
    function update(data) {
		$.ajax({
			url : "/calendar/updateEvent",
			data : JSON.stringify(data),
			method : "post",
			contentType : "application/json; charset=utf-8",
 	     	beforeSend: function(xhr) {
  	     	   // CSRF 토큰 헤더에 추가
               xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
    		},
			success : function(res) {
				if (res=="SUCCESS") {
					alert("수정 성공!");
					// FullCalendar를 다시 로드
					loadCalendarPersonal();
				} else {
					alert("수정 실패!");
				} 
			}
		});
	}
});
    </script>